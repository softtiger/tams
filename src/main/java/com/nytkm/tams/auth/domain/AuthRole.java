package com.nytkm.tams.auth.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 保存角色信息
 */
@Data
@Entity
@ApiModel("保存角色信息")
@Table(name = "tbl_auth_role")
public class AuthRole implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识ID
     */
    @Id
    @ApiModelProperty("唯一标识ID")
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 入住租户ID
     */
    @ApiModelProperty("入住租户ID")
    @Column(name = "tenant_id", nullable = false)
    private Integer tenantId;

    /**
     * 角色名称
     */
    @ApiModelProperty("角色名称")
    @Column(name = "role_name", nullable = false)
    private String roleName;
    /**
     * 角色编码
     */
    @ApiModelProperty("角色编码")
    @Column(name = "code", nullable = false)
    private String code;

    /**
     * 角色状态 0-禁用 1-启用
     */
    @ApiModelProperty("角色状态 0-禁用 1-启用")
    @Column(name = "status", nullable = false)
    private Integer status;

    /**
     * 角色描述
     */
    @ApiModelProperty("角色描述")
    @Column(name = "role_desc")
    private String roleDesc;

    /**
     * 创建人ID    其中  -1 系统初始化   -2 注册生成
     */
    @Column(name = "create_by")
    @ApiModelProperty("创建人ID    其中  -1 系统初始化   -2 注册生成")
    private Integer createBy;

    /**
     * 创建时间
     */
    @ApiModelProperty("创建时间")
    @Column(name = "create_time", nullable = false)
    private LocalDateTime createTime;


    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    @JoinTable(name="tbl_auth_role_permission",joinColumns = {@JoinColumn(name="role_id")},inverseJoinColumns = {@JoinColumn(name="menu_id")},
                foreignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT),inverseForeignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT))
    private List<AuthMenus> authRolePermissionList;

}
