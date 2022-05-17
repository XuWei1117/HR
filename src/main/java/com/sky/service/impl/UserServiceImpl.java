package com.sky.service.impl;

import com.sky.dao.UserDao;
import com.sky.domain.User;
import com.sky.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Create by xww
 * 2021/9/27
 **/
@SuppressWarnings("all")
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User login(User user) {
        System.out.println("----------UserServiceImpl.login----------------");
        User user_login = userDao.login(user);
        System.out.println("user_login = " + user_login);
        return user_login;
    }

    @Override
    public void register(User user) {
        userDao.register(user);
    }
}
