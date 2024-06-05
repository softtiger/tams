package com.nytkm.tams.auth.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel(value="用户拥有的权限")
public class UserGrantedAuthorityDTO implements GrantedAuthority {

     @ApiModelProperty("菜单id")
     private Integer menuId;

     @ApiModelProperty("菜单名称")
     private String menuName;


     @ApiModelProperty("菜单类型")
     private String menuType;

     @ApiModelProperty("菜单对应的url")
     private String menuUrl;


     @Override
     public String getAuthority() {
          return menuUrl;
     }

     public void setAuthority(String authority){
          this.menuUrl = authority;
     }
}