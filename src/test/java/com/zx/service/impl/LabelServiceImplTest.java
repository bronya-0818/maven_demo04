package com.zx.service.impl;

import com.zx.entity.LabelVo;
import com.zx.service.LabelService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class LabelServiceImplTest {
    @Resource
    private LabelService labelService;
    @Test
    public void queryLabelVo() {
        List<LabelVo> labelVos = labelService.queryLabelVo();
        labelVos.forEach(System.out::println);
    }
}