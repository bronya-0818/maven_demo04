package com.zx.dao;

import com.zx.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@Repository
public interface RoleDAO extends BaseMapper<Role> {
//    @RunWith(SpringJUnit4ClassRunner.class)
//    @ContextConfiguration("classpath:spring.xml")
}