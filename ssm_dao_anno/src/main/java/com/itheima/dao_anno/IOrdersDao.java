package com.itheima.dao_anno;

import com.itheima.domain.Member;
import com.itheima.domain.Orders;
import com.itheima.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IOrdersDao {

    //多表操作
    @Select("select * from orders where id=#{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one=@One(
                    select="com.itheima.dao_anno.IProductDao.findById"
            )),
            @Result(property = "member",column = "memberId",javaType = Member.class,one=@One(
                    select="com.itheima.dao_anno.IMemberDao.findById"
            )),
            @Result(property = "travellers",column = "id",javaType = List.class,many=@Many(
                    select="com.itheima.dao_anno.ITravellerDao.findByOrdersId"
            )),
    })
    Orders findByid(String id);
}
