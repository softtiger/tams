package com.nytkm.tams.auth.repository;

import com.nytkm.tams.auth.domain.AuthMenus;
import com.nytkm.tams.auth.dto.TemplatePermissionDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AuthMenusRepository extends JpaRepository<AuthMenus, Integer>, JpaSpecificationExecutor<AuthMenus> {


    @Query(value= """
                WITH RECURSIVE descendants AS
                (
                SELECT id, menu_name as menuName, parent_id as parentId, 1 as level
                FROM  tbl_auth_menus where parent_id=0
                UNION ALL
                SELECT t.id, t.menu_name as menuName,t.parent_id as parentId,d.level+1
                FROM descendants d, tbl_auth_menus t
                WHERE t.parent_id = d.id
                )
                 select tree.* from descendants tree inner join tbl_auth_menus_tpl tpl where tree.id=tpl.auth_menus_id and type =:type  order by level, id
            """,nativeQuery = true)
    List<TemplatePermissionDTO> getTemplateTreePermission(@Param("type") Integer type);


}