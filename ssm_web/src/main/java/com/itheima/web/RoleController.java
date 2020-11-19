package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Permission;
import com.itheima.domain.Role;
import com.itheima.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/17 22:10
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    IRoleService roleService;

    /**
     * 添加权限，只有ROLE_ADMIN角色的可以操作
     * @param roleId
     * @param permissionIds
     * @return
     * @throws Exception
     */
    @RequestMapping("/addPermissionToRole.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String addPermissionToRole(@RequestParam(value = "roleId") String roleId,@RequestParam(value = "ids",defaultValue = "") String[] permissionIds) throws Exception {
        for (String permissionId : permissionIds) {
            roleService.addPermissionToRole(roleId,permissionId);
        }
        return "redirect:findAll.do";
    }

    /**
     * 添加权限前，查询所有当前该角色没有关联的权限，只有ROLE_ADMIN角色的可以操作
     * @param id
     * @return
     */
    @RequestMapping("/findRoleByIdAndAllPer.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findRoleByIdAndAllPer(@RequestParam(value = "id")String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(id);
        List<Permission> permissionList = roleService.findOtherPermissions(id);
        mv.addObject("role",role);
        mv.addObject("permissionList",permissionList);
        mv.setViewName("role-permission-add");
        return mv;
    }

    /**
     * 角色详情
     * @param id
     * @return
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(value = "id",required = false)String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(id);
        mv.addObject("role",role);
        mv.setViewName("role-show");
        return mv;
    }

    /**
     * 角色批量删除，只有ROLE_ADMIN角色的可以操作
     * @param idStr
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteByIdStr.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String deleteByIdStr(@RequestParam(value = "idStr",defaultValue = "",required = false)String idStr) throws Exception {
        if (idStr != null && idStr != "" && idStr.length()>0){
            String[] ids = idStr.split(",");
            for (String id : ids) {
                System.out.println(id);
                roleService.deleteById(id);
            }
        }
        return "redirect:findAll.do";
    }

    /**
     * 角色删除，只有ROLE_ADMIN角色的可以操作
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteById.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String deleteById(@RequestParam(value = "id",required = false) String id) throws Exception {
        roleService.deleteById(id);
        return "redirect:findAll.do";
    }

    /**
     * 新建角色，只有ROLE_ADMIN角色的可以操作
     * @param role
     * @return
     * @throws Exception
     */
    @RequestMapping("/addRole.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String addRole(Role role) throws Exception {
        roleService.addRole(role);
        return "redirect:findAll.do";
    }

    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1") Integer page, @RequestParam(value = "size",defaultValue = "4") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(roleList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("roleList",roleList);
        mv.setViewName("role-list");
        return mv;
    }
}
