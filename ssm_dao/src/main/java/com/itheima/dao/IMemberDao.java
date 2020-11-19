package com.itheima.dao;

import com.itheima.domain.Member;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/28 19:58
 */
public interface IMemberDao {

    /**
     * 根据id查询会员信息
     * @param id
     * @return
     * @throws Exception
     */
    public Member findById(String id) throws Exception;

    /**
     * 查询全部会员信息
     * @return
     * @throws Exception
     */
    public List<Member> findAll() throws Exception;
}
