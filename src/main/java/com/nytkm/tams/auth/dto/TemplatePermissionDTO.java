package com.nytkm.tams.auth.dto;

/*
 * @author     chengYu
 * @date     2023/10/31
 * @describe   将模板
 */
public interface TemplatePermissionDTO {

   Integer getId();

   String getMenuName();

   Integer getParentId();

   Integer  getLevel();
}
