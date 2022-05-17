package com.sky.controller;

import com.sky.domain.Recruit;
import com.sky.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Create by xww
 * 2021/9/29
 **/
@SuppressWarnings("all")
@Controller
@RequestMapping("/recruit")
public class RecruitController {
    @Autowired
    private RecruitService recruitService;

    @RequestMapping("/selectAll")
    public @ResponseBody List<Recruit> selectAll(){
        List<Recruit> recruits = recruitService.selectAll();
        return recruits;
    }

    @RequestMapping("/selectById")
    public @ResponseBody Recruit selectById(Integer r_id){
        Recruit recruit = recruitService.selectById(r_id);
        return recruit;
    }

    @RequestMapping("/addRecruit")
    public String  addRecruit(Recruit recruit){
        recruitService.addRecruit(recruit);
        return "redirect:/recruit.jsp";
    }

    @RequestMapping("/deleteRecruit")
    public @ResponseBody boolean deleteRecruit(Integer r_id){
        recruitService.deleteRecruit(r_id);
        return true;
    }
    @RequestMapping("/updateRecruit")
    public String  updateRecruit(Recruit recruit){
        recruitService.updateRecruit(recruit);
        return "redirect:/recruit.jsp";
    }

    @RequestMapping("/deleteSelected")
    public @ResponseBody boolean deleteSelected(HttpServletRequest request){
        String[] r_ids = request.getParameterValues("r_id");
        System.out.println("r_ids = " + r_ids);
        recruitService.deleteSelected(r_ids);
        System.out.println("RecruitController.deleteSelected");
        return true;
    }

    @RequestMapping("/search")
    public @ResponseBody List<Recruit> search(String condition){
        List<Recruit> recruits = recruitService.search(condition);
        return recruits;
    }
}
