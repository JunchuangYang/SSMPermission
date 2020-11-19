package com.itheima.dao;

import com.itheima.domain.SysLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/25 22:06
 */
public interface ISysLogDao {

    /**
     * 添加日志
     * @param sysLog
     * @throws Exception
     */
    public void addSysLog(SysLog sysLog)throws Exception;

    /**
     * 查询全部日志，模糊查询
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    public List<SysLog> findAll(@Param("fuzzyName") String fuzzyName) throws Exception;
}
