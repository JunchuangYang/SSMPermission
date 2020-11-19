package com.itheima.dao_anno;

import com.itheima.domain.Role;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IRolesDao {
    // 根据用户ID 查询用户的Role信息
    @Select("select * from role where rid in (select roleId from users_role where userId = #{userId})")
    @Results({
            @Result(id=true,property = "id",column = "rid"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "rid",javaType = List.class,many=@Many(
                    select = "com.itheima.dao_anno.IPermissionDao.findPermissionByRoleId"
            ))
    })
    List<Role> findRolesByUserId(String userId);
}
