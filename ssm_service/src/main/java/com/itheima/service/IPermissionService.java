package com.itheima.service;

import com.itheima.domain.Permission;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:41
 */
public interface IPermissionService {
    /**
     * 资源权限详情
     * @param id
     * @return
     * @throws Exception
     */
    public Permission findById(String id) throws Exception;

    /**
     * 权限删除
     * @param id
     * @throws Exception
     */
    public void deleteById(String id) throws Exception;

    /**
     * 权限添加
     * @param permission
     * @throws Exception
     */
    public void addPermission(Permission permission) throws Exception;

    /**
     * 查询全部权限信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    public List<Permission> findAll(int page,int size) throws Exception;
}
