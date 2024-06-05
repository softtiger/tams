package com.nytkm.tams.tools;

import com.nytkm.tams.auth.dto.CustomUserDTO;
import org.springframework.security.core.context.SecurityContextHolder;

/*
 * @author     chengYu
 * @date     2023/10/30
 * @describe   获取当前登录用户的相关信息帮助类
 */
public class CurrentUserHelper {

    public static Integer getTenantId(){
        CustomUserDTO customUserDTO = (CustomUserDTO)SecurityContextHolder.getContext().getAuthentication().getDetails();
        return customUserDTO.getUserInfo().getTenantId();

    }

    public static Integer getCurrentUID(){
        CustomUserDTO customUserDTO = (CustomUserDTO)SecurityContextHolder.getContext().getAuthentication().getDetails();
        return customUserDTO.getUserInfo().getId();
    }



}
