package com.sky.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sky.dao.EmployeeDao;
import com.sky.domain.Employee;
import com.sky.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Create by xww
 * 2021/9/17
 **/
@SuppressWarnings("all")
@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public List<Employee> selectAll(Employee employee) {
        List<Employee> employees = employeeDao.selectAll(employee);
        return employees;
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeDao.addEmployee(employee);
    }

    @Override
    public void deleteEmployee(Integer id) {
        employeeDao.deleteEmployee(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeDao.updateEmployee(employee);
    }


    @Override
    public Employee findById(Integer e_id) {
        Employee employee = employeeDao.findById(e_id);
        return employee;
    }

    @Override
    public void deleteSelected(String[] e_ids) {
        System.out.println("ServiceImpl中的e_ids = " + e_ids);
        for (String e_id : e_ids) {
            employeeDao.deleteEmployee(Integer.parseInt(e_id));
        }
    }

    @Override
    public void returnFull(Integer e_id) {
        employeeDao.returnFull(e_id);
    }


    public PageInfo<Employee> selectByPage(Employee employee, int start, int row) {
        return PageHelper.startPage(start,row).doSelectPageInfo(()->{
            employeeDao.selectAll(employee);
        });
    }

    @Override
    public void addEmployee1(Employee employee) {
        employeeDao.addEmployee1(employee);
    }
}
