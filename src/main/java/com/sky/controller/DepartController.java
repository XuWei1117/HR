package com.sky.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sky.domain.Depart;
import com.sky.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Create by xww
 * 2021/9/17
 **/
@SuppressWarnings("all")
@Controller
@RequestMapping("/depart")
public class DepartController {
    @Autowired
    private DepartService departService;

    //页面首次加载的时候发送ajax请求,显示全部数据
    @RequestMapping("/showDepart")
    public @ResponseBody Map<String,Object> showDepart(Depart depart){
        PageHelper.startPage(1,5);
        List<Depart> list = departService.findAll(depart);
        System.out.println("list = " + list);
        HashMap<String, Object> map = new HashMap<>();
        PageInfo<Depart> info = new PageInfo<>(list);
        long total = info.getTotal();//总记录数
        int pages = info.getPages();//总页数
        int pageNum = info.getPageNum();//当前页
        map.put("list", list);
        map.put("total", total);
        map.put("pageNum", pageNum);
        map.put("pages", pages);
        return map;
    }

    //增加部门
    @RequestMapping("/addDepart")
    public String addDepart(Depart depart){
        Integer integer = departService.addDepart(depart);
        return "redirect:/department.jsp";
    }

    //删除部门
    @RequestMapping("/deleteDepart")
    public @ResponseBody boolean deleteDepart(Integer d_id){
       departService.deleteDepart(d_id);
       return true;
    }
    //根据id查找部门
    @RequestMapping("/selectById")
    public @ResponseBody Depart selectById(Integer d_id){
        Depart depart = departService.selectById(d_id);
        return depart;
    }
    //修改部门信息
    @RequestMapping("/updateDepart")
    public String updateDepart(Depart depart){
        System.out.println("DepartController.updateDepart");
        departService.updateDepart(depart);
        return "redirect:/department.jsp";
    }
    //删除选中
    @RequestMapping("/deleteSelected")
    public String deleteSelected(HttpServletRequest request){
        String[] d_ids = request.getParameterValues("d_id");
        departService.deleteSelected(d_ids);
        return "redirect:/department.jsp";
    }

}
