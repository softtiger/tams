package com.nytkm.tams.auth.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 入驻用户
 */
@Data
@Entity
@ApiModel("租户信息")
@Table(name = "tbl_tenant")
public class Tenant implements Serializable {

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
     * 入驻用户
     */
    @ApiModelProperty("入驻用户")
    @Column(name = "name", nullable = false)
    private String name;

    /**
     * 域名
     */
    @ApiModelProperty("域名")
    @Column(name = "domain")
    private String domain;

    /**
     * 租户识别码  app 用于中用于区分不同的租户
     */
    @Column(name = "code")
    @ApiModelProperty("租户识别码  app 用于中用于区分不同的租户")
    private String code;

    /**
     * 联系人
     */
    @ApiModelProperty("联系人")
    @Column(name = "contact", nullable = false)
    private String contact;

    /**
     * 联系电话
     */
    @ApiModelProperty("联系电话")
    @Column(name = "phone", nullable = false)
    private String phone;

    /**
     * 1 平台商  2 租户 3 试用租户
     */
    @ApiModelProperty("1 平台商  2 租户 3 试用租户")
    @Column(name = "type", nullable = false)
    private Integer type;

    @Column(name = "settled_time")
    private LocalDateTime settledTime;

    @Column(name = "create_time", nullable = false)
    private LocalDateTime createTime;

    /**
     * -1  平台初始化
     */
    @ApiModelProperty("-1  平台初始化")
    @Column(name = "create_by", nullable = false)
    private Integer createBy;

}
