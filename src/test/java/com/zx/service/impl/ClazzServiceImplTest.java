package com.zx.service.impl;

import com.baomidou.mybatisplus.extension.conditions.query.QueryChainWrapper;
import com.zx.entity.Clazz;
import com.zx.entity.ClazzVo;
import com.zx.service.ClazzService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class ClazzServiceImplTest {
    @Resource
    private ClazzService clazzService;
    @Test
    public void test1(){
        QueryChainWrapper<Clazz> query =
                clazzService.query();
        List<Clazz> list = clazzService.list(null);
        System.out.println("---------------------------------------------------------");
        System.out.println(query.toString());
        System.out.println("-----------------------------------------------------");

        list.forEach(System.out::println);
    }
    @Test
    public void test2(){
        List<ClazzVo> clazzVos = clazzService.querryClazzVo();
        clazzVos.forEach(System.out::println);

    }

}