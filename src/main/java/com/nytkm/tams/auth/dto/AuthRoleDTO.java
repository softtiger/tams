package com.nytkm.tams.auth.dto;


import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@ApiModel("角色信息")
public class AuthRoleDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识ID
     */
    @ApiModelProperty("唯一标识ID")
    private Integer id;


    /**
     * 入住租户ID
     */
    @ApiModelProperty("入住租户ID")
    private Integer tenantId;


    /**
     * 角色名称
     */
    @ApiModelProperty("角色名称")
    private String roleName;
    /**
     * 角色编码
     */
    @ApiModelProperty("角色编码")
    private String code;


    /**
     * 角色状态 0-禁用 1-启用
     */
    @ApiModelProperty("角色状态 0-禁用 1-启用")
    private Integer status;


    /**
     * 角色描述
     */
    @JsonIgnore
    @ApiModelProperty("角色描述")
    private String roleDesc;


    /**
     * 创建人ID    其中  -1 系统初始化   -2 注册生成
     */
    @JsonIgnore
    @ApiModelProperty("创建人ID    其中  -1 系统初始化   -2 注册生成")
    private Integer createBy;


    /**
     * 创建时间
     */
    @JsonIgnore
    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

}
