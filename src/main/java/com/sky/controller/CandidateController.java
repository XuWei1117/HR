package com.sky.controller;

import com.sky.domain.Candidate;
import com.sky.service.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Create by xww
 * 2021/9/28
 **/
@SuppressWarnings("all")
@Controller
@RequestMapping("/candidate")
public class CandidateController {
    @Autowired
    private CandidateService candidateService;

    //http://localhost:8082/hr/candidate/selectAll
    @RequestMapping("/selectAll")
    public @ResponseBody List<Candidate> selectAll(){
        List<Candidate> candidates = candidateService.selectAll();
        return candidates;
    }

    //http://localhost:8082/hr/application/addApplication?a_name=李四&a_age=25&a_gender=男&a_education=本科生&a_school=齐鲁理工学院&a_departId=1&a_card=371427200312123789&a_salary=4000
    @RequestMapping("/addCandidate")
    public String  addCandidate(Candidate candidate){
        candidateService.addCandidate(candidate);
        return "redirect:/candidate.jsp";
    }

    // http://localhost:8082/hr/application/deleteApplication?a_id=2
    @RequestMapping("/deleteCandidate")
    public @ResponseBody boolean deleteCandidate(Integer c_id){
        candidateService.deleteCandidate(c_id);
        return true;
    }

    @RequestMapping("/updateCandidate")
    public String updateCandidate(Candidate candidate){
        candidateService.updateCandidate(candidate);
        return "redirect:/candidate.jsp";
    }

    @RequestMapping("/selectById")
    public @ResponseBody Candidate selectById(Integer c_id){
        Candidate candidate = candidateService.selectById(c_id);
        return candidate;
    }
    @RequestMapping("deleteSelected")
    public @ResponseBody boolean deleteSelected(HttpServletRequest request){
        String[] c_ids = request.getParameterValues("c_id");
        candidateService.deleteSelected(c_ids);
        return true;
    }

    @RequestMapping("/search")
    public @ResponseBody List<Candidate> search(String condition){
        List<Candidate> candidates = candidateService.search(condition);
        return candidates;
    }

}
