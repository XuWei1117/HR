package com.sky.filter; /**
 * Create by xww
 * 2021/9/30
 **/

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(filterName = "Filter")
public class LoginFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        request.setCharacterEncoding("utf-8");
        HttpServletResponse response = (HttpServletResponse) resp;
        response.setContentType("text/html;charset=utf-8");
        String uri = request.getRequestURI();
        System.out.println("uri = " + uri);
        if(uri.contains("/login.jsp") || uri.contains("/register.jsp") || uri.contains("/css") || uri.contains("/js") || uri.contains("/font") || uri.contains("/img") || uri.contains("/checkCodeServlet") || uri.contains("/log") || uri.contains("/register")){
            chain.doFilter(req,resp);
        }else{
            if(request.getSession().getAttribute("user_login") != null){
                chain.doFilter(req,resp);
            }else{
                response.sendRedirect("/hr/login.jsp");
            }
        }

    }
}
