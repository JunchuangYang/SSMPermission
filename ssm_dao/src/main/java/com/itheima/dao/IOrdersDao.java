package com.itheima.dao;

import com.itheima.domain.Orders;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/26 19:23
 */
public interface IOrdersDao {

    /**
     * 订单删除
     * @param id
     * @throws Exception
     */
    public void deleteById(String id) throws Exception;

    /**
     * 订单详情
     * @param id
     * @return
     * @throws Exception
     */
    public Orders findById(String id) throws Exception;

    /**
     * 订单添加
     * @param orders
     * @throws Exception
     */
    public void addOrders(Orders orders) throws Exception;

    /**
     * 根据订单编号查找订单
     * @param orderNum
     * @return
     * @throws Exception
     */
    public String findByNum(String orderNum) throws Exception;

    /**
     * 订单全部查询，模糊查询
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<Orders> findAll(@Param("fuzzyName") String fuzzyName) throws Exception;
}
