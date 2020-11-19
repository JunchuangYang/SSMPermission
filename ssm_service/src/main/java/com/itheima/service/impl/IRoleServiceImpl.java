package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IRoleDao;
import com.itheima.domain.Permission;
import com.itheima.domain.Role;
import com.itheima.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * @author LiZongXiao
 * @create 2020/6/13 22:21
 */
@Service
@Transactional
public class IRoleServiceImpl implements IRoleService {

    @Autowired
    IRoleDao roleDao;

    /**
     * 添加权限
     * @param roleId
     * @param permissionId
     * @throws Exception
     */
    @Override
    public void addPermissionToRole(String roleId, String permissionId) throws Exception {
        roleDao.addPermissionToRole(roleId,permissionId);
    }

    /**
     * 添加权限前，查询所有当前该角色没有关联的权限
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public List<Permission> findOtherPermissions(String id) throws Exception {
        return roleDao.findOtherPermissions(id);
    }

    /**
     * 角色详情
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Role findById(String id) throws Exception {
        return roleDao.findById(id);
    }

    /**
     * 角色删除
     * @param id
     * @throws Exception
     */
    @Override
    public void deleteById(String id) throws Exception {
        // 删除有关的外键
        //role_permission表的角色删除
        roleDao.deleteRolePermissionById(id);
        //users_role表的角色删除
        roleDao.deleteUsersRoleById(id);
        roleDao.deleteById(id);
    }

    /**
     * 新建角色
     * @param role
     * @throws Exception
     */
    @Override
    public void addRole(Role role) throws Exception {
        //获取32位UUID大写字符串
        String replace = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        role.setId(replace);
        roleDao.addRole(role);
    }

    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Role> findAll(int page,int szie) throws Exception {
        //分页
        PageHelper.startPage(page,szie);
        return roleDao.findAll();
    }
}
