package com.nytkm.tams.auth.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@ApiModel("操作员信息")
public class AuthUserDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @ApiModelProperty("主键")
    private Integer id;


    /**
     * 所属租户ID
     */
    @ApiModelProperty("所属租户ID")
    private Integer tenantId;


    /**
     * 登录账号
     */
    @ApiModelProperty("登录账号")
    private String account;



    /**
     * 用户名称
     */
    @ApiModelProperty("用户名称")
    private String userName;


    /**
     * 手机号码
     */
    @ApiModelProperty("手机号码")
    private String mobile;


    /**
     * 电子邮箱
     */
    @ApiModelProperty("电子邮箱")
    private String email;


    /**
     * 状态 0-禁用 1-启用  99-删除
     */
    @ApiModelProperty("状态 0-禁用 1-启用  99-删除")
    private Integer status;


    /**
     * 昵称
     */
    @ApiModelProperty("昵称")
    private String nickname;


    /**
     * 0 女  1 男   2 未知
     */
    @ApiModelProperty("0 女  1 男   2 未知")
    private Integer gender;


    /**
     * 语言
     */
    @ApiModelProperty("语言")
    private String language;


    /**
     * 创建时间
     */
    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;


    /**
     * 账号创建人       -1 系统初始化创建   -2 注册生成
     */
    @ApiModelProperty("账号创建人       -1 系统初始化创建   -2 注册生成")
    private Integer createBy;


    /**
     * 0管理员创建。1 前台注册时自动创建
     */
    @ApiModelProperty("0管理员创建。1 前台注册时自动创建")
    private Boolean auto;

}
