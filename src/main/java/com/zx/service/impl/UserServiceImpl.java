package com.zx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zx.dao.UserDAO;
import com.zx.entity.User;
import com.zx.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserDAO,User> implements UserService {
    @Resource
    private UserDAO userDAO;


    @Override
    public User checkLogin(String username, String password) {
        QueryWrapper<User> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("account",username)
                        .eq("password",password);
        User user = userDAO.selectOne(queryWrapper);
        return user;
    }

    @Override
    public int userRegister(User user) {
        int insert = userDAO.insert(user);
        return insert;
    }
}
