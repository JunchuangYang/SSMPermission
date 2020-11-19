package com.itheima.test;

import com.itheima.dao_anno.IOrdersDao;
import com.itheima.dao_anno.IUsersDao;
import com.itheima.domain.Orders;
import com.itheima.domain.UserInfo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class UserTest {

    private IUsersDao iUsersDaoMapper;

    @Before
    public void before() throws IOException {
        //1.获得核心配置文件
        InputStream resourceAsStream = Resources.getResourceAsStream("SqlMapConfig.xml");
        //2.获得session工厂对象
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(resourceAsStream);
        //3.获得session会话对象
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        iUsersDaoMapper= sqlSession.getMapper(IUsersDao.class);
    }

    @Test
    public void findByIdTest(){
        List<UserInfo> byId = iUsersDaoMapper.findById("111-111");
        for (UserInfo userInfo : byId) {
            System.out.println(userInfo);
        }
    }
}
