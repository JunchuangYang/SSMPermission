package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.Permission;
import com.itheima.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/18 17:41
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    IPermissionService permissionService;

    /**
     * 资源权限详情，只有ROLE_ADMIN角色的可以操作
     * @param id
     * @return
     */
    @RequestMapping("/findById.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findById(@RequestParam(value = "id",required = false)String id) throws Exception {
        ModelAndView mv = new ModelAndView();
        Permission permission = permissionService.findById(id);
        mv.addObject("permission",permission);
        mv.setViewName("permission-show");
        return mv;
    }

    /**
     * 权限批量删除，只有ROLE_ADMIN角色的可以操作
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
                permissionService.deleteById(id);
            }
        }
        return "redirect:findAll.do";
    }

    /**
     * 权限删除，只有ROLE_ADMIN角色的可以操作
     * @param id
     * @return
     */
    @RequestMapping("/deleteById.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String deleteById(String id) throws Exception {
        permissionService.deleteById(id);
        return "redirect:findAll.do";
    }

    /**
     * 权限添加，只有ROLE_ADMIN角色的可以操作
     * @param permission
     * @return
     * @throws Exception
     */
    @RequestMapping("/addPermission.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String addPermission(Permission permission) throws Exception {
        permissionService.addPermission(permission);
        return "redirect:findAll.do";
    }

    /**
     * 查询全部权限信息，只有ROLE_ADMIN角色的可以操作
     * @param page
     * @param size
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1")Integer page, @RequestParam(value = "size",defaultValue = "4") Integer size) throws Exception {
        ModelAndView mv =  new ModelAndView();
        List<Permission> permissionList = permissionService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(permissionList);
        mv.addObject("permissionList",permissionList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("permission-list");
        return mv;
    }
}
