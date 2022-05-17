package com.sky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Create by xww
 * 2021/9/30
 **/
@Controller
@RequestMapping("/e")
public class ExitController {
    @RequestMapping("/exit")
    public @ResponseBody boolean exit(HttpServletRequest request){
        request.getSession().removeAttribute("user_login");
        return true;
    }
}
