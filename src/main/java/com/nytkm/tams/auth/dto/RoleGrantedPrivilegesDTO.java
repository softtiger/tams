package com.nytkm.tams.auth.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * @author     chengYu
 * @date     2023/10/31
 * @describe
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("角色授权信息")
public class RoleGrantedPrivilegesDTO {
      @ApiModelProperty("资源id")
      private Integer id;

      @ApiModelProperty("资源名称")
      private String menuName;

      @ApiModelProperty("上级资源ID")
      private  Integer parentId;

      @ApiModelProperty("资源层级")
      private Integer  level;

      @ApiModelProperty("是否拥护该权限")
      private boolean  hasPrivilege=false;


}
