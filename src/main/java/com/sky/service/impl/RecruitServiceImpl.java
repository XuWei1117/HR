package com.sky.service.impl;

import com.sky.dao.RecruitDao;
import com.sky.domain.Recruit;
import com.sky.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Create by xww
 * 2021/9/29
 **/
@SuppressWarnings("all")
@Service("recruitService")
public class RecruitServiceImpl implements RecruitService {
    @Autowired
    private RecruitDao recruitDao;
    @Override
    public List<Recruit> selectAll() {
        List<Recruit> recruits = recruitDao.selectAll();
        return recruits;
    }

    @Override
    public Recruit selectById(Integer r_id) {
        Recruit recruit = recruitDao.selectById(r_id);
        return recruit;
    }

    @Override
    public void addRecruit(Recruit recruit) {
        recruitDao.addRecruit(recruit);
    }

    @Override
    public void deleteRecruit(Integer r_id) {
        recruitDao.deleteRecruit(r_id);
    }

    @Override
    public void updateRecruit(Recruit recruit) {
        recruitDao.updateRecruit(recruit);
    }

    @Override
    public void deleteSelected(String[] r_ids) {
        for (String r_id : r_ids) {
            recruitDao.deleteRecruit(Integer.parseInt(r_id));
        }
    }

    @Override
    public List<Recruit> search(String condition) {
        condition = '%' + condition + '%';
        List<Recruit> recruits = recruitDao.search(condition);
        return recruits;
    }
}
