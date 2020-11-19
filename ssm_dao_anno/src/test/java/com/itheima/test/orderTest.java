package com.itheima.test;

import com.itheima.dao_anno.IOrdersDao;
import com.itheima.domain.Orders;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;

public class orderTest {

    private IOrdersDao iOrdersDaoMapper;

    @Before
    public void before() throws IOException {
        //1.获得核心配置文件
        InputStream resourceAsStream = Resources.getResourceAsStream("SqlMapConfig.xml");
        //2.获得session工厂对象
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        //3.获得session会话对象
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        iOrdersDaoMapper= sqlSession.getMapper(IOrdersDao.class);
    }

    @Test
    public void findByIdTest(){
        Orders ordersById = iOrdersDaoMapper.findByid("0E7231DC797C486290E8713CA3C6ECCC");
        System.out.println(ordersById);
    }

}
