package com.zx.service.impl;

import com.zx.entity.User;
import com.zx.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class UserServiceImplTest {
    @Resource
    private UserService userService;
    @Test
    public void test1(){
        User test1 = userService.checkLogin("test1", "123456");
        System.out.println(test1.toString());
    }

}