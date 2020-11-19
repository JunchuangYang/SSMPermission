package com.itheima.service;

import com.itheima.domain.Permission;
import com.itheima.domain.Role;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/13 22:21
 */
public interface IRoleService {
    /**
     * 添加权限
     * @param roleId
     * @param permissionId
     * @throws Exception
     */
    public void addPermissionToRole(String roleId,String permissionId) throws Exception;

    /**
     * 添加权限前，查询所有当前该角色没有关联的权限
     * @param id
     * @return
     * @throws Exception
     */
    public List<Permission> findOtherPermissions(String id) throws Exception;

    /**
     * 角色详情
     * @param id
     * @return
     * @throws Exception
     */
    public Role findById(String id) throws Exception;

    /**
     * 角色删除
     * @param id
     * @throws Exception
     */
    public void deleteById(String id) throws Exception;

    /**
     * 新建角色
     * @param role
     * @throws Exception
     */
    public void addRole(Role role) throws Exception;

    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    public List<Role> findAll(int page,int szie) throws Exception;
}
