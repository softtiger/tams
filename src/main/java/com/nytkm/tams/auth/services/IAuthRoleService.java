package com.nytkm.tams.auth.services;

import com.nytkm.tams.auth.dto.AuthRoleDTO;
import com.nytkm.tams.auth.dto.RoleGrantedPrivilegesDTO;
import com.nytkm.tams.common.Pagination;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*
 * @author     chengYu
 * @date     2023/11/3
 * @describe
 */
public interface IAuthRoleService {
    /**
     * 创建角色
     * @param code
     * @param roleName
     */
    void save(String code, String roleName);


    /**
     * 启用/禁用角色
     * @param id
     * @param enabled
     */
    @Transactional
    void toggle(Integer id, Boolean enabled);


    /**
     * 修改角色信息
     * @param id
     * @param roleName
     * @param code
     */
    @Transactional
    void update(Integer id, String roleName, String code);


    /**
     * 获取指定角色ID的内容
     * @param id
     * @return
     */
    AuthRoleDTO getById(Integer id);


    /**
     * 按名称查找角色
     * @param roleName
     * @param pageNo
     * @param pageSize
     * @return
     */
    Pagination<AuthRoleDTO> query(String roleName, Integer pageNo, Integer pageSize);


    /**
     *  获取某个角色当前配置的权限信息
     * @param id
     * @return
     */
    List<RoleGrantedPrivilegesDTO> queryPrivileges(Integer id);


    /**
     *  设置角色权限
     * @param id
     * @param menuIds
     */
    void setPrivileges(Integer id, List<Integer> menuIds);
}
