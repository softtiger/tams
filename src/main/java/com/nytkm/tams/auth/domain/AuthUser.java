package com.nytkm.tams.auth.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 保存操作员信息
 */
@Data
@Entity
@ApiModel("保存操作员信息")
@Table(name = "tbl_auth_user")
public class AuthUser implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @Id
    @ApiModelProperty("主键")
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 所属租户ID
     */
    @Column(name = "tenant_id")
    @ApiModelProperty("所属租户ID")
    private Integer tenantId;

    /**
     * 登录账号
     */
    @ApiModelProperty("登录账号")
    @Column(name = "account", nullable = false)
    private String account;

    /**
     * 登录密码
     */
    @ApiModelProperty("登录密码")
    @Column(name = "password", nullable = false)
    private String password;

    /**
     * 用户名称
     */
    @ApiModelProperty("用户名称")
    @Column(name = "user_name", nullable = false)
    private String userName;

    /**
     * 手机号码
     */
    @Column(name = "mobile")
    @ApiModelProperty("手机号码")
    private String mobile;

    /**
     * 电子邮箱
     */
    @Column(name = "email")
    @ApiModelProperty("电子邮箱")
    private String email;

    /**
     * 状态 0-禁用 1-启用  99-删除
     */
    @ApiModelProperty("状态 0-禁用 1-启用  99-删除")
    @Column(name = "status", nullable = false)
    private Integer status = 1;

    /**
     * 昵称
     */
    @ApiModelProperty("昵称")
    @Column(name = "nickname")
    private String nickname;

    /**
     * 0 女  1 男   2 未知
     */
    @Column(name = "gender")
    @ApiModelProperty("0 女  1 男   2 未知")
    private Integer gender = 2;

    /**
     * 语言
     */
    @ApiModelProperty("语言")
    @Column(name = "language")
    private String language = "english";

    /**
     * 创建时间
     */
    @ApiModelProperty("创建时间")
    @Column(name = "create_time", nullable = false)
    private LocalDateTime createTime;

    /**
     * 账号创建人       -1 系统初始化创建   -2 注册生成
     */
    @Column(name = "create_by", nullable = false)
    @ApiModelProperty("账号创建人       -1 系统初始化创建   -2 注册生成")
    private Integer createBy;

    /**
     * 0管理员创建。1 前台注册时自动创建
     */
    @Column(name = "is_auto")
    @ApiModelProperty("0管理员创建。1 前台注册时自动创建")
    private Boolean auto = Boolean.FALSE;


    @ManyToMany(cascade ={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name="tbl_auth_user_role",joinColumns = {@JoinColumn(name="user_id")},inverseJoinColumns = {@JoinColumn(name="role_id")}
                ,foreignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT),inverseForeignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT) )
    private List<AuthRole> authRoleList;


    @OneToOne
    @JoinColumn(name="tenant_id",insertable = false,updatable = false)
    private Tenant tenant;

}
