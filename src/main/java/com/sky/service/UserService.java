package com.sky.service;

import com.sky.domain.User;

/**
 * Create by xww
 * 2021/9/27
 **/
public interface UserService {
    User login(User user);
    void register(User user);
}
