package com.itheima.web;

import com.github.pagehelper.PageInfo;
import com.itheima.domain.SysLog;
import com.itheima.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.nio.charset.Charset;
import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/25 22:04
 */
@Controller
@RequestMapping("/syslog")
public class SysLogController {

    @Autowired
    ISysLogService sysLogService;

    /**
     * 查询全部日志，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",defaultValue = "1") Integer page, @RequestParam(value = "size",defaultValue = "10") Integer size, @RequestParam(value = "fuzzyName",defaultValue = "",required = false) String fuzzyName) throws Exception {
        ModelAndView mv = new ModelAndView();
        //判断是乱码 (GBK包含全部中文字符；UTF-8则包含全世界所有国家需要用到的字符。)
        if (!(Charset.forName("GBK").newEncoder().canEncode(fuzzyName))) {
            //转码UTF8
            fuzzyName = new String(fuzzyName.getBytes("ISO-8859-1"), "utf-8");
        }
        List<SysLog> sysLogList = sysLogService.findAll(page,size,fuzzyName);
        PageInfo pageInfo = new PageInfo(sysLogList);
        mv.addObject("sysLogList",sysLogList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("fuzzyName",fuzzyName);
        mv.setViewName("syslog-list");
        return mv;
    }

}
