package com.nytkm.tams.auth.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 保存系统所有功能及菜单元信息
 */
@Data
@Entity
@ApiModel("保存系统所有功能及菜单元信息")
@Table(name = "tbl_auth_menus")
public class AuthMenus implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识id
     */
    @Id
    @ApiModelProperty("唯一标识id")
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 功能名称
     */
    @ApiModelProperty("功能名称")
    @Column(name = "menu_name", nullable = false)
    private String menuName;

    /**
     * 英文名称
     */
    @ApiModelProperty("英文名称")
    @Column(name = "en_menu_name")
    private String enMenuName;

    /**
     * 功能类型 menu-功能菜单 btn-操作按钮
     */
    @ApiModelProperty("功能类型 menu-功能菜单 btn-操作按钮")
    @Column(name = "menu_type", nullable = false)
    private String menuType;

    /**
     * 上级菜单ID
     */
    @ApiModelProperty("上级菜单ID")
    @Column(name = "parent_id", nullable = false)
    private Integer parentId = 0;

    /**
     * 菜单图标样式
     */
    @Column(name = "icon_css")
    @ApiModelProperty("菜单图标样式")
    private String iconCss;

    /**
     * 菜单访问地址
     */
    @Column(name = "menu_url")
    @ApiModelProperty("菜单访问地址")
    private String menuUrl;

    /**
     * 菜单显示优先级顺序
     */
    @Column(name = "priority")
    @ApiModelProperty("菜单显示优先级顺序")
    private Integer priority = 0;

    /**
     * 功能状态 0-禁用 1-启用
     */
    @Column(name = "status")
    @ApiModelProperty("功能状态 0-禁用 1-启用")
    private Integer status = 0;

    /**
     * 功能描述
     */
    @ApiModelProperty("功能描述")
    @Column(name = "menu_desc")
    private String menuDesc;

}
