package com.sky.controller;

import com.sky.domain.User;
import com.sky.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Create by xww
 * 2021/9/27
 **/
@SuppressWarnings("all")
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/log")
    public @ResponseBody Map<String,Object> login(HttpServletRequest request,String u_name,String u_password,String checkCode0){
        System.out.println("-------------UserController.login----------");
        HashMap<String, Object> map = new HashMap<>();
        String checkCode = (String) request.getSession().getAttribute("checkCode");
        if(!checkCode0.equalsIgnoreCase(checkCode)){
            map.put("msg", "验证码不正确");
            map.put("flag", false);
        }else{
            User user = new User();
            user.setU_name(u_name);
            user.setU_password(u_password);
            User user_login = userService.login(user);
            if(user_login != null){
                request.getSession().setAttribute("user_login", user_login);
                map.put("flag", true);
            }else{
                map.put("msg", "用户名或验证码不正确");
                map.put("flag", false);
            }
        }
        return map;
    }


    @RequestMapping("/register")
    public @ResponseBody Map<String,Object> register(HttpServletRequest request,String u_name,String u_password,String u_password2,String checkCode0){
        User user = new User();
        user.setU_name(u_name);
        user.setU_password(u_password);
        HashMap<String, Object> map = new HashMap<>();
        String checkCode = (String) request.getSession().getAttribute("checkCode");
        if(!checkCode.equalsIgnoreCase(checkCode0)){
            map.put("msg", "验证码不正确");
            map.put("flag", false);
        }else{
            if(!u_password.equals(u_password2)){
                map.put("msg", "两次输入密码不一致");
                map.put("flag", false);
            }else {
                userService.register(user);
                request.getSession().setAttribute("user_login",user);
                map.put("flag", true);
                map.put("msg", "注册成功");
            }
        }
        return map;
    }
}
