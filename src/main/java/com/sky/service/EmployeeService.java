package com.sky.service;


import com.sky.domain.Employee;

import java.util.List;

/**
 * Create by xww
 * 2021/9/17
 **/
public interface EmployeeService {
    List<Employee> selectAll(Employee employee);
    void addEmployee(Employee employee);
    void deleteEmployee(Integer id);
    Employee findById(Integer e_id);
    void updateEmployee(Employee employee);
    void deleteSelected(String[] e_ids);
    void returnFull(Integer e_id);
    void addEmployee1(Employee employee);

}
