package com.nytkm.tams.common.jpa;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.ParamDef;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.time.LocalDateTime;

/*
 * @author     chengYu
 * @date     2023/11/3
 * @describe
 */
@Data
@MappedSuperclass
@NoArgsConstructor
@EntityListeners(TenantListener.class)
@FilterDef(name = "tenantFilter", parameters = {@ParamDef(name = "tenantId", type = "int")})
@Filter(name = "tenantFilter", condition = "tenant_id = :tenantId")
public abstract class BaseEntity implements TenatAware, Serializable {

     @Column(name="tenant_id")
     @ApiModelProperty("租户ID")
     private  Integer tenantId;

     @ApiModelProperty("创建人")
     @Column(name = "create_by")
     private Integer createBy;


    @ApiModelProperty("创建时间")
    @Column(name = "create_time")
    private LocalDateTime createTime;


     BaseEntity(Integer tenantId){
        this.tenantId = tenantId;
     }

}
