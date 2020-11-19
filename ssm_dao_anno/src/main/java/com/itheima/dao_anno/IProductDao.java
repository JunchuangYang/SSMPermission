package com.itheima.dao_anno;

import com.itheima.domain.Product;
import org.apache.ibatis.annotations.Select;

public interface IProductDao {

    @Select("select * from product where id=#{id}")
    Product findById(String id);
}
