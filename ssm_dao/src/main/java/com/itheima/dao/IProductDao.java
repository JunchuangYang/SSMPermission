package com.itheima.dao;

import com.itheima.domain.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/15 19:44
 */
public interface IProductDao {

    /**
     * 产品删除
     * @param id
     * @throws Exception
     */
    public void deleteById(String id) throws Exception;

    /**
     * 修改产品信息
     * @param product
     * @throws Exception
     */
    public void updateProduct(Product product) throws Exception;

    /**
     * 根据id查询产品信息
     * @param id
     * @return
     * @throws Exception
     */
    public Product findById(String id) throws Exception;

    /**
     * 根据productNum查询产品信息
     * @param productNum
     * @return
     * @throws Exception
     */
    public Product findByNum(String productNum) throws Exception;

    /**
     * 添加产品信息
     * @param product
     * @throws Exception
     */
    public void addProduct(Product product) throws Exception;

    /**
     * 查询全部产品信息，模糊查询
     * @return
     * @throws Exception
     */
    public List<Product> findAll(@Param("fuzzyName") String fuzzyName) throws Exception;
}
