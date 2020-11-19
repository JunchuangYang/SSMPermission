package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IPermissionDao;
import com.itheima.domain.Permission;
import com.itheima.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:42
 */
@Service
public class IPermissionServiceImpl implements IPermissionService {
    @Autowired
    IPermissionDao permissionDao;

    /**
     * 资源权限详情
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Permission findById(String id) throws Exception {
        return permissionDao.findById(id);
    }

    /**
     * 权限删除
     * @param id
     * @throws Exception
     */
    @Override
    public void deleteById(String id) throws Exception {
        //role_permission表的权限删除
        permissionDao.deleteRolePermissionById(id);
        permissionDao.deleteById(id);
    }

    /**
     * 权限添加
     * @param permission
     * @throws Exception
     */
    @Override
    public void addPermission(Permission permission) throws Exception {
        //获取32位UUID大写字符串
        String replace = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        permission.setId(replace);
        permissionDao.addPermission(permission);
    }

    /**
     * 查询全部权限信息
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @Override
    public List<Permission> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page, size);
       return permissionDao.findAll();
    }
}
