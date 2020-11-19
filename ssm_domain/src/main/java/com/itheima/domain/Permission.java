package com.itheima.domain;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/4 21:45
 * 资源权限表
 */
public class Permission {
    private String id;//无意义，主键uuid
    private String permissionName;//权限名
    private String url;//资源路径
    private List<Role> roles;//角色信息，多对多

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id='" + id + '\'' +
                ", permissionName='" + permissionName + '\'' +
                ", url='" + url + '\'' +
                ", roles=" + roles +
                '}';
    }
}
