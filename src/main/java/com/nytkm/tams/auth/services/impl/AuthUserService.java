package com.nytkm.tams.auth.services.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import com.nytkm.tams.auth.domain.AuthRole;
import com.nytkm.tams.auth.domain.AuthUser;
import com.nytkm.tams.auth.dto.AuthUserDTO;
import com.nytkm.tams.auth.dto.CustomUserDTO;
import com.nytkm.tams.auth.dto.UserGrantedAuthorityDTO;
import com.nytkm.tams.auth.dto.UserGrantedRoleDTO;
import com.nytkm.tams.auth.repository.AuthRoleRepository;
import com.nytkm.tams.auth.dto.PrivilegeDTO;
import com.nytkm.tams.auth.repository.AuthUserRepository;
import com.nytkm.tams.auth.services.IAuthUserService;
import com.nytkm.tams.common.Pagination;
import com.nytkm.tams.common.RespCode;
import com.nytkm.tams.exception.TamsException;
import com.nytkm.tams.tools.CurrentUserHelper;
import com.nytkm.tams.tools.JWTTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Service("authService")
public class AuthUserService  implements UserDetailsService, IAuthUserService {

    @Autowired
    private AuthUserRepository authUserRepository;

    @Autowired
    private AuthRoleRepository  authRoleRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    private static final List<String>  IGNORE_PRIVILEGE_LIST = new ArrayList();

    {
        IGNORE_PRIVILEGE_LIST.add("/account/changePassword");
        IGNORE_PRIVILEGE_LIST.add("/account/logout");
        IGNORE_PRIVILEGE_LIST.add("/account/forgetPassword");
    }

    @Override
    public AuthUserDTO getById(Integer id) {
        AuthUser authUser = authUserRepository.findByIdAndTenantId(id,CurrentUserHelper.getTenantId());
        if (authUser==null){
            throw new NoSuchElementException("操作员不存在:" + id);
        }
        return BeanUtil.copyProperties(authUser,AuthUserDTO.class);
    }

    @Override
    public Pagination<AuthUserDTO> query(String userName, Integer pageNo, Integer pageSize) {
        PageRequest pageRequest = PageRequest.of(pageNo-1, pageSize, Sort.by("createTime").descending());

        //构造自定义查询条件
        Specification<AuthUser> queryCondtion = new Specification<AuthUser>() {
            @Override
            public Predicate toPredicate(Root<AuthUser> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicateList = new ArrayList<>();
                if (!StrUtil.isEmpty(userName)) {
                    predicateList.add(criteriaBuilder.like(root.get("userName"), "%" + userName + "%"));
                }
                predicateList.add(criteriaBuilder.equal(root.get("tenantId"), CurrentUserHelper.getTenantId()));
                return criteriaBuilder.and(predicateList.toArray(new Predicate[predicateList.size()]));
            }
        };
        Page<AuthUser> searchResult = authUserRepository.findAll(queryCondtion, pageRequest);

        Pagination<AuthUserDTO> result;
        if (searchResult.hasContent()) {
            return Pagination.getPagination(pageNo,
                    pageSize, searchResult.getTotalElements(),
                    searchResult.getContent().stream().map(o -> BeanUtil.copyProperties(o, AuthUserDTO.class)).collect(Collectors.toList()));
        } else {
            result = Pagination.getPagination(pageNo, pageSize, 0, new ArrayList<>());
        }
        return result;
    }

    @Override
    public CustomUserDTO loadUser(String account, String password, String code) throws UsernameNotFoundException {
        AuthUser authUser = authUserRepository.findByAccountAndCode(account, code);
        if  (authUser == null){
            throw new UsernameNotFoundException(account);
        }
        if  (!bCryptPasswordEncoder.matches(password,authUser.getPassword())){
                throw new BadCredentialsException("用户名或密码不正确");
        }

        if (authUser.getStatus()!=1){
               throw new DisabledException("用户已被禁用，请与管理员联系");
        }

        List<PrivilegeDTO> privilegeDTOList = authUserRepository.getPermissionByUID(authUser.getId());

        List<UserGrantedAuthorityDTO> userGrantedAuthorityDTOS = privilegeDTOList.stream().map(o -> {
            return new UserGrantedAuthorityDTO(o.getMenuId(), o.getMenuName(), o.getMenuType(), o.getMenuUrl());
        }).collect(Collectors.toList());

        return new CustomUserDTO(BeanUtil.copyProperties(authUser,AuthUserDTO.class), genToken(authUser)
                ,userGrantedAuthorityDTOS.stream().distinct().collect(Collectors.toList()));
    }

    private String genToken(AuthUser authUser) {
            Map<String,Object> payLoad = new HashMap<>(3);
            payLoad.put("account",authUser.getAccount());
            payLoad.put("uid",authUser.getId());
            payLoad.put("nickName",authUser.getNickname());
            return JWTTools.genToken(30, TimeUnit.MINUTES,payLoad);
    }

    @Override
    //not used
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }

    @Override
    public boolean canAccess(HttpServletRequest request, Authentication authentication) {
        Object principal = authentication.getPrincipal();
        if(principal == null){
            return false;
        }

        if(authentication instanceof AnonymousAuthenticationToken){
            //check if this uri can be access by anonymous
            return false;
        }

        String uri = request.getRequestURI();

        if(IGNORE_PRIVILEGE_LIST.contains(uri)){
             return true;
        }

        Set<String> roles = authentication.getAuthorities()
                .stream()
                .map(e -> e.getAuthority())
                .collect(Collectors.toSet());


        return  roles.contains(uri);

    }


    @Override
    @Transactional
    public void toggle(Integer id, Boolean enabled) {
        AuthUser authuser = findAuthUserById(id);
        authuser.setStatus(enabled?1:0);
        authUserRepository.save(authuser);
    }

    @Override
    @Transactional
    public void update(Integer id, String userName, String email) {
        AuthUser authuser = findAuthUserById(id);
        authuser.setUserName(userName);
        authuser.setEmail(email);
        authUserRepository.save(authuser);

    }

    private AuthUser findAuthUserById(Integer id) {
        AuthUser authuser = authUserRepository.findByIdAndTenantId(id, CurrentUserHelper.getTenantId());
        if (authuser == null){
            throw new NoSuchElementException("操作员不存在:"+ id);
        }
        return authuser;
    }

    @Override
    public void save(String account,String password, String userName, String email) {
         AuthUser authUser =  authUserRepository.findByAccountAndTenantId(account,CurrentUserHelper.getTenantId());
         if  (authUser !=null){
            throw new TamsException(RespCode.USER_ACCOUNT_DUPLICATE,"账号已存在");
         }
         authUser = new AuthUser();
         authUser.setUserName(userName);
         authUser.setAccount(account);
         authUser.setTenantId(CurrentUserHelper.getTenantId());
         authUser.setStatus(1);
         authUser.setLanguage("english");
         authUser.setCreateBy(CurrentUserHelper.getCurrentUID());
         authUser.setCreateTime(LocalDateTime.now());
         authUser.setPassword(bCryptPasswordEncoder.encode(password));
         authUser.setEmail(email);
         authUserRepository.save(authUser);

    }

    @Override
    public void setPassword(Integer id, String password) {
        AuthUser authUser = findAuthUserById(id);
        authUser.setPassword(bCryptPasswordEncoder.encode(password));
        authUserRepository.save(authUser);
    }

    @Override
    public void setPassword(String password) {
        AuthUser authUser = findAuthUserById(CurrentUserHelper.getCurrentUID());
        authUser.setPassword(bCryptPasswordEncoder.encode(password));
        authUserRepository.save(authUser);
    }

    @Override
    public List<UserGrantedRoleDTO> getUserRoleRelationById(Integer id) {
            List<UserGrantedRoleDTO>  result = new ArrayList<>();
            AuthUser authUser = findAuthUserById(id);
            //获取租户的所有角色
            List<AuthRole> authRoleList = authRoleRepository.findByTenantId(CurrentUserHelper.getTenantId());

            //根据用户已拥有的角色，对租户的所有角色设置其已选标志位。
            if (authRoleList!=null || authRoleList.size()>0){
                Set<Integer> ownedMenuSet = authUser.getAuthRoleList().stream().map(o -> o.getId()).collect(Collectors.toSet());
                authRoleList.stream().forEach(each -> result.add(new UserGrantedRoleDTO(each.getId(),each.getRoleName(),ownedMenuSet.contains(each.getId()))));
            }
            return result;
    }

    @Override
    public void configRoles(Integer id, List<Integer> roleIds) {
             AuthUser authUser = findAuthUserById(id);
             if (roleIds!=null && roleIds.size()>0){
                   validatedRoles(roleIds);
                   List<AuthRole> allById = authRoleRepository.findAllById(roleIds);
                   authUser.setAuthRoleList(allById);
             }else{
                   authUser.setAuthRoleList(new ArrayList<>());
             }
             authUserRepository.save(authUser);
    }

    /**
     *      检查角色ID是否正确
     */
    private void validatedRoles(List<Integer> roleIds) {
        List<AuthRole> authRoleList = authRoleRepository.findByTenantId(CurrentUserHelper.getTenantId());
        if (authRoleList==null){
                throw new TamsException("设置的角色ID无效:");
        }else{
            Set<Integer>  validRoleIdSet = authRoleList.stream().map(AuthRole::getId).collect(Collectors.toSet());
            if (roleIds.stream().anyMatch( o ->  !validRoleIdSet.contains(o))){
                throw new TamsException("设置的角色ID无效:");
            }
        }
    }

    @Override
    @Transactional
    public String forgetPassword(String account, String email) {
        AuthUser authUser = authUserRepository.findByAccountAndEmail(account,email);
        if (authUser == null){
              throw new TamsException("提供的账号和邮箱地址不正确");
        }
        String newPassword = RandomUtil.randomString(RandomUtil.BASE_CHAR_NUMBER_LOWER,8);
        authUser.setPassword(bCryptPasswordEncoder.encode(newPassword));
        authUserRepository.save(authUser);
        return newPassword;
    }
}
