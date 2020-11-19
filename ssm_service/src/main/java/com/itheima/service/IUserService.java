package com.itheima.service;

import com.itheima.domain.Role;
import com.itheima.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/4 22:27
 */
// 继承UserDetailsService ，实现用户认证
public interface IUserService extends UserDetailsService {

    /**
     * 用户添加角色
     * @param userId
     * @param roleIds
     * @throws Exception
     */
    public void addRoleToUser(String userId, String[] roleIds) throws Exception;

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
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<UserInfo> findAll(int page,int size,String fuzzyName)throws Exception;

    void modifyUser(UserInfo userInfo);
}
