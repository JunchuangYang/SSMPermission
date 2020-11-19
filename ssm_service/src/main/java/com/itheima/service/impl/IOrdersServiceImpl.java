package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IOrdersDao;
import com.itheima.domain.Orders;
import com.itheima.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @author LiZongXiao
 * @create 2020/5/26 19:22
 */
@Service
@Transactional
public class IOrdersServiceImpl implements IOrdersService {
    @Autowired
    IOrdersDao ordersDao;

    /**
     * 订单删除
     * @param id
     * @throws Exception
     */
    @Override
    public void deleteById(String id) throws Exception {
        ordersDao.deleteById(id);
    }

    /**
     * 订单详情
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Orders findById(String id) throws Exception {
        if (id != null && id != "" && id.length() > 0){
            return ordersDao.findById(id);
        }
       return null;
    }

    /**
     * 订单添加
     * @param orders
     * @throws Exception
     */
    @Override
    public void addOrders(Orders orders) throws Exception {
        //获取32位UUID大写字符串
        String replace = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        orders.setId(replace);
        ordersDao.addOrders(orders);
    }

    /**
     * 根据订单编号查找订单
     * @param orderNum
     * @return
     * @throws Exception
     */
    @Override
    public String findByNum(String orderNum) throws Exception {
        return ordersDao.findByNum(orderNum);
    }

    /**
     * 订单全部查询，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    @Override
    public List<Orders> findAll(int page,int size,String fuzzyName) throws Exception {
        //分页：page：从哪页开始 size：每页显示多少条
        PageHelper.startPage(page,size);//必须写在真正执行分页语句的前面
        return ordersDao.findAll(fuzzyName);
    }
}
