package com.zx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zx.entity.Post;
import com.zx.entity.PostQuery;
import com.zx.entity.PostVo;
import com.zx.service.PostService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class PostServiceImplTest {
    @Resource
    private PostService postService;
    @Test
    public void test1(){
        List<Post> posts =
                postService.posts();
        posts.forEach(System.out::println);
    }
    @Test
    public void findByParamWithClazz() {
        PostQuery query=new PostQuery();
//        query.setTitle("mybatis");
        query.setClazzId(23);
        List<PostVo> postlist = postService.findByParamWithClazz(query);
//        for (PostVo postVo : postlist) {
//            System.out.println(postVo);
//        }
//        System.out.println(postlist.get(1));

    }
    @Test
    public void test3(){
      //postService.save()
        QueryWrapper<Post>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("id",1);
        Post one = postService.getOne(queryWrapper);
        System.out.println(one.toString());

    }
}