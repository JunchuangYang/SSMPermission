package com.itheima.dao;

import com.itheima.domain.Role;
import com.itheima.domain.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/4 22:30
 */
public interface IUserDao {

    /**
     * 用户添加角色
     * @param userId
     * @param roleId
     * @throws Exception
     */
    //// 在mybatis中传递多个参数要做参数的绑定
    public void addRoleToUser(@Param("userId") String userId,@Param("roleId") String roleId) throws Exception;

    /**
     * 添加角色前，查询所有当前该用户没有关联的角色
     * @param id
     * @return
     * @throws Exception
     */
    public List<Role> findUserByIdAndAllRole(String id) throws Exception;

    /**
     * 用户详情
     * @param id
     * @return
     * @throws Exception
     */
    public UserInfo findById(String id) throws Exception;

    /**
     * 添加用户
     * @param userInfo
     * @throws Exception
     */
    public void addUser(UserInfo userInfo) throws Exception;

    /**
     * 查询全部用户信息，模糊查询
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<UserInfo> findAll(@Param("fuzzyName") String fuzzyName)throws Exception;

    /**
     * 根据username查询用户信息
     * @param username
     * @return
     * @throws Exception
     */
    public UserInfo findByUserName(String username) throws Exception;

    /*
     *根据username修改信息
     * */
    public  void modifyUser(UserInfo userInfo);
}
