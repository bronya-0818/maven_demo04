package com.zx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zx.entity.PostQuery;
import com.zx.entity.Post_Clazz_Relationship;
import com.zx.entity.test1;
import com.zx.service.Post_Clazz_Service;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class Post_Clazz_ServiceImplTest {
    PostQuery postQuery;
    @Resource
    private Post_Clazz_Service post_clazz_service;
    @Test
    public void test(){
        QueryWrapper<Post_Clazz_Relationship> querryWrapper=new QueryWrapper<>();
        querryWrapper.select("clazz_id")
                .eq("clazz_id",23);
        long count = post_clazz_service.count(querryWrapper);
        System.out.println(count);
    }
    @Test
    public void test2(){
        QueryWrapper<Post_Clazz_Relationship>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("post_id",1)
                        .select("clazz_id");
        List<Object> list = post_clazz_service.listObjs(queryWrapper);
//        postQuery.setClazzIds(listToString(list));
//        String clazzIds = postQuery.getClazzIds();
        test1 t1 = new test1();
        t1.setClazzIds(listToString(list));
        String clazzIds1 = t1.getClazzIds();
        list.forEach(System.out::println);
        System.out.println("================================");
        System.out.println(clazzIds1);
    }
    private String listToString(List<Object> list){
        StringBuilder stringBuilder = new StringBuilder();
        for(int i=0;i<list.size();i++){
            stringBuilder.append(list.get(i));
            if(i<list.size()-1){
                stringBuilder.append(",");
            }
        }
        return stringBuilder.toString();
    }
}