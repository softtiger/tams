package com.nytkm.tams.auth.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * @author     chengYu
 * @date     2023/11/1
 * @describe
 */
@ApiModel(value="用户角色配置关系")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserGrantedRoleDTO {

    @ApiModelProperty("角色id")
    private Integer roleId;

    @ApiModelProperty("角色名称")
    private String roleName;

    @ApiModelProperty("是否属于该角色")
    private boolean belongTo = false;

}
