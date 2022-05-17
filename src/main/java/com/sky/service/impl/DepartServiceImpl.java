package com.sky.service.impl;

import com.sky.dao.DepartDao;
import com.sky.domain.Depart;
import com.sky.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Create by xww
 * 2021/9/17
 **/
@SuppressWarnings("all")
@Service("departService")
public class DepartServiceImpl implements DepartService {
    @Autowired
    private DepartDao departDao;
    @Override
    public List<Depart> findAll(Depart depart) {
        List<Depart> list = departDao.findAll(depart);
        return list;
    }

    @Override
    public Integer addDepart(Depart depart) {
        Integer integer = departDao.addDepart(depart);
        return integer;
    }

    @Override
    public void deleteDepart(Integer d_id) {
        System.out.println("DepartServiceImpl.deleteDepart");
        departDao.deleteDepart(d_id);
    }

    @Override
    public Depart selectById(Integer d_id) {
        Depart depart = departDao.selectById(d_id);
        return depart;
    }

    @Override
    public void updateDepart(Depart depart) {
        departDao.updateDepart(depart);
    }

    @Override
    public void deleteSelected(String[] d_ids) {
        for (String d_id : d_ids) {
            departDao.deleteDepart(Integer.parseInt(d_id));
        }
    }

}
