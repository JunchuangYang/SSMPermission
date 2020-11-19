package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IUserDao;
import com.itheima.domain.Role;
import com.itheima.domain.UserInfo;
import com.itheima.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author LiZongXiao
 * @create 2020/6/4 22:29
 */
@Service("userService")
@Transactional
public class IUserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;



    // springsecurity 提供的密码加密类bean
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * 用户添加角色
     * @param userId
     * @param roleIds
     * @throws Exception
     */
    @Override
    public void addRoleToUser(String userId, String[] roleIds) throws Exception {
        for(String roleId : roleIds){
            userDao.addRoleToUser(userId,roleId);
        }
    }

    /**
     * 添加角色前，查询所有当前该用户没有关联的角色
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public List<Role> findUserByIdAndAllRole(String id) throws Exception {
        return userDao.findUserByIdAndAllRole(id);
    }

    /**
     * 用户详情
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public UserInfo findById(String id) throws Exception {
        return userDao.findById(id);
    }

    /**
     * 添加用户
     * @param userInfo
     * @throws Exception
     */
    @Override
    public void addUser(UserInfo userInfo) throws Exception {
        //获取32位UUID大写字符串（随机生成的用户ID）
        String replace = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        userInfo.setId(replace);
        //对密码进行加密处理
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.addUser(userInfo);
    }

    /**
     * 查询全部用户信息，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    @Override
    public List<UserInfo> findAll(int page,int size,String fuzzyName) throws Exception {
        //分页
        PageHelper.startPage(page,size);
        return userDao.findAll(fuzzyName);
    }

    /*
    * 根据userName 修改用户信息
    * */
    @Override
    public void modifyUser(UserInfo userInfo) {
        //对密码进行加密处理
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.modifyUser(userInfo);
    }

    // spring security 用户密码认证
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUserName(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象，封装成UserDetails
        User user = new User(userInfo.getUsername(), userInfo.getPassword(), userInfo.getStatus() == 0 ? false : true, true, true, true, getAuthority(userInfo.getRoles()));
        return user;
    }

    //作用就是返回一个List集合，集合装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return list;
    }
}
