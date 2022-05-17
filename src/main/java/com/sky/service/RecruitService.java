package com.sky.service;

import com.sky.domain.Recruit;

import java.util.List;

/**
 * Create by xww
 * 2021/9/29
 **/
public interface RecruitService {
    List<Recruit> selectAll();
    Recruit selectById(Integer r_id);
    void addRecruit(Recruit recruit);
    void deleteRecruit(Integer r_id);
    void updateRecruit(Recruit recruit);
    void deleteSelected(String[] r_ids);
    List<Recruit> search(String condition);
}
