package com.zx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zx.dao.Post_Clazz_DAO;
import com.zx.entity.Post_Clazz_Relationship;
import com.zx.service.Post_Clazz_Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Post_Clazz_ServiceImpl extends ServiceImpl<Post_Clazz_DAO, Post_Clazz_Relationship> implements Post_Clazz_Service {
    @Resource
    private Post_Clazz_DAO post_clazz_dao;

    @Override
    public List<Integer> findClazzIdsByPostId(Integer pid) {
        QueryWrapper<Post_Clazz_Relationship>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("post_id",pid);
//        List<Integer> post_clazz_relationships = post_clazz_dao.selectList(queryWrapper);
//        post_clazz_dao.select
        return null;
    }
}
