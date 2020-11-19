package com.itheima.domain;

import org.springframework.security.core.userdetails.User;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/4 21:43
 * 角色表
 */
public class Role {
    private String id;//无意义，主键uuid
    private String roleName;//角色名
    private String roleDesc;//角色描述
    private List<Permission> permissions;//资源权限信息，多对多
    private List<User> users; //用户信息，多对多

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id='" + id + '\'' +
                ", roleName='" + roleName + '\'' +
                ", roleDesc='" + roleDesc + '\'' +
                ", permissions=" + permissions +
                ", users=" + users +
                '}';
    }
}
