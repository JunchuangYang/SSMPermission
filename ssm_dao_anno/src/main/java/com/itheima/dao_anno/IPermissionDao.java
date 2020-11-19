package com.itheima.dao_anno;

import com.itheima.domain.Permission;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IPermissionDao {

    @Select("select * from permission where pid in (select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findPermissionByRoleId(String roleId);
}
