package com.nytkm.tams.auth.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

/*
 * @author     chengYu
 * @date     2023/10/27
 * @describe
 */
@Data
@AllArgsConstructor
@ApiModel("用户及权限信息")
public class CustomUserDTO implements UserDetails {

    @ApiModelProperty(name="userInfo",reference = "AuthUserDTO.class")
    private AuthUserDTO userInfo;


    @ApiModelProperty(name="token")
    private String token;

    @ApiModelProperty(name="authorities",reference="UserGrantedAuthorityDTO.class")
    private List<UserGrantedAuthorityDTO> authorities;

    @Override
    public Collection<UserGrantedAuthorityDTO> getAuthorities() {
        return authorities;
    }

    @JsonIgnore
    @Override
    public String getPassword() {
        return "";
    }

    @JsonIgnore
    @Override
    public String getUsername() {
        return userInfo.getUserName();
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isEnabled() {
        return userInfo.getStatus().equals(1);
    }
}
