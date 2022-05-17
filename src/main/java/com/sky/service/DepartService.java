package com.sky.service;

import com.sky.domain.Depart;

import java.util.List;

/**
 * Create by xww
 * 2021/9/17
 **/
public interface DepartService {
    List<Depart> findAll(Depart depart);
    Integer addDepart(Depart depart);
    void deleteDepart(Integer d_id);
    Depart selectById(Integer d_id);
    void updateDepart(Depart depart);
    void deleteSelected(String[] d_ids);


}
