package com.sky.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sky.domain.Employee;
import com.sky.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    //显示全部员工信息
    @RequestMapping("/selectAll")  //http://localhost:8082/hr/employee/selectAll
    private @ResponseBody Map<String, Object> selectAll(Employee employee) {
        PageHelper.startPage(1,5);
        List<Employee> employees = employeeService.selectAll(employee);
        PageInfo<Employee> info = new PageInfo<>(employees);
        long total = info.getTotal();//多少条记录
        int pages = info.getPages();//共多少页
        int pageNum = info.getPageNum();//第几页
        int pageSize = info.getPageSize();
        HashMap<String, Object> map = new HashMap<>();
        map.put("employees", employees);
        map.put("pages", pages);
        map.put("pageNum", pageNum);
        map.put("total", total);
        map.put("pageSize",pageSize);
        return map;
    }

    /*@RequestMapping("/selectAll")  //http://localhost:8082/hr/employee/selectAll
    private @ResponseBody Map<String, Object> selectAll(Employee employee) {
        HashMap<String, Object> map = new HashMap<>();
        PageInfo<Employee> employeePageInfo = employeeService.selectByPage(employee, 1, 5);
        map.put("employeePageInfo", employeePageInfo);
        return map;
    }*/

    //添加员工信息
    @RequestMapping("/addEmployee")
    private String addEmployee(Employee employee) {
        System.out.println("employee = " + employee);
        employeeService.addEmployee(employee);
        return "redirect:/employee.jsp";
    }

    //删除员工信息
    @RequestMapping("/deleteEmployee")
    private @ResponseBody
    boolean deleteEmployee(Integer e_id) {
        System.out.println("e_id = " + e_id);
        employeeService.deleteEmployee(e_id);
        return true;
    }

    //根据id进行查找将结果返回到修改页面
    @RequestMapping("/selectById")
    private @ResponseBody
    Employee findById(Integer e_id) {
        Employee employee = employeeService.findById(e_id);
        return employee;
    }

    //提交修改的信息
    //http://localhost:8082/hr/employee/updateEmployee?e_id=1&e_name=Anna&e_age=21&e_gender=女&e_education=专科生
    @RequestMapping("/updateEmployee")
    private String updateEmployee(Employee employee) {
        System.out.println("EmployeeController.updateEmployee");
        System.out.println("employee = " + employee);
        employeeService.updateEmployee(employee);
        return "redirect:/employee.jsp";
    }

    //批量删除
    @RequestMapping("/deleteSelected")
    private @ResponseBody boolean deleteSelected(HttpServletRequest request) {
        String[] e_ids = request.getParameterValues("e_id");
        employeeService.deleteSelected(e_ids);
        return true;
    }

    //员工转正
    @RequestMapping("/returnFull")
    private @ResponseBody boolean returnFull(Integer e_id){
        employeeService.returnFull(e_id);
        return true;
    }
    //http://localhost:8082/hr/employee/addEmployee1?e_name=王五&e_age=23&e_gender=男&e_education=本科生&e_school=齐鲁理工学院&e_departId=5&e_phone=13345112345&e_card=371427200011174923&e_salary=3000

    //添加聘用的员工信息
    @RequestMapping("/addEmployee1")
    private String addEmployee1(Employee employee) {
        employeeService.addEmployee1(employee);
        return "redirect:/employee.jsp";
    }

//    @RequestMapping("/export")
//    private @ResponseBody Map<String,String> export(){
//
//    }



}
