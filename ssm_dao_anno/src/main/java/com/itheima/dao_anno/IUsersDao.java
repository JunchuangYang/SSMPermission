package com.itheima.dao_anno;

import com.itheima.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IUsersDao {
    @Select("select * from users where id = #{userId}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "status",column = "status"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "roles",column = "id",javaType = List.class, many=@Many(
                    select = "com.itheima.dao_anno.IRolesDao.findRolesByUserId")
            )

    })
    List<UserInfo> findById(String userId);
}
