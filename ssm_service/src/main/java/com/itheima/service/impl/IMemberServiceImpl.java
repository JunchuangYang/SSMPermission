package com.itheima.service.impl;

import com.itheima.dao.IMemberDao;
import com.itheima.domain.Member;
import com.itheima.service.IMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/5/28 20:02
 */
@Service
@Transactional
public class IMemberServiceImpl implements IMemberService {
    @Autowired
    IMemberDao memberDao;

    /**
     * 根据id查询会员信息
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Member findById(String id) throws Exception {
        return memberDao.findById(id);
    }

    /**
     * 查询全部会员信息
     * @return
     * @throws Exception
     */
    @Override
    public List<Member> findAll() throws Exception {
        return memberDao.findAll();
    }
}
