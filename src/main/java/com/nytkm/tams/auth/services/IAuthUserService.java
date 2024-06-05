package com.nytkm.tams.auth.services;

import com.nytkm.tams.auth.dto.AuthUserDTO;
import com.nytkm.tams.auth.dto.CustomUserDTO;
import com.nytkm.tams.auth.dto.UserGrantedRoleDTO;
import com.nytkm.tams.common.Pagination;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/*
 * @author     chengYu
 * @date     2023/11/3
 * @describe
 */
public interface IAuthUserService {

    /**
     * 获取指定操作员信息
     * @param id
     * @return
     */
    AuthUserDTO getById(Integer id);

    /**
     * 按用户名条件分页查询操作员信息
     * @param userName
     * @param pageNo
     * @param pageSize
     * @return
     */
    Pagination<AuthUserDTO> query(String userName, Integer pageNo, Integer pageSize);

    /**
     * 按租户代码，账号及密码获取操作员及权限信息
     * @param account
     * @param password
     * @param code
     * @return
     * @throws UsernameNotFoundException
     */
    CustomUserDTO loadUser(String account, String password, String code) throws UsernameNotFoundException;


    /**
     * 判断当前登录的操作员，是否拥有当前请求的URL的访问权限
     * @param request
     * @param authentication
     * @return
     */
    boolean canAccess(HttpServletRequest request, Authentication authentication);

    /**
     * 开启/禁用某操作员
     * @param id
     * @param enabled
     */
    void toggle(Integer id, Boolean enabled);


    /**
     * 修改指定操作员信息
     * @param id
     * @param userName
     * @param email
     */
    @Transactional
    void update(Integer id, String userName, String email);

    /**
     * 创建操作人员
     * @param account
     * @param password
     * @param userName
     * @param email
     */
    void save(String account, String password,String userName, String email);


    /**
     * 修改某个操作员密码
     * @param id
     * @param password
     */
    void setPassword(Integer id, String password);


    /**
     *  设置我的密码
     * @param password
     */
    void setPassword(String password);


    /**
     * 获取指定操作员配置的角色信息
     * @param id
     * @return
     */
    List<UserGrantedRoleDTO> getUserRoleRelationById(Integer id);


    /**
     *  给指定操作员设置角色
     * @param id
     * @param roleIds
     */
    void configRoles(Integer id, List<Integer> roleIds);


    /**
     *  通过账号和邮箱获取一个系统重置的新密码。
     * @param account
     * @param email
     * @return
     */

    String forgetPassword(String account, String email);
}
