package com.zx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zx.entity.User;

public interface UserService extends IService<User> {
    User checkLogin(String username, String password);
    int userRegister(User user);
}
