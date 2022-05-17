package com.sky.service.impl;

import com.sky.dao.CandidateDao;
import com.sky.domain.Candidate;
import com.sky.domain.Employee;
import com.sky.service.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Create by xww
 * 2021/9/28
 **/
@SuppressWarnings("all")
@Service("applicationService")
public class CandidateServiceImpl implements CandidateService {
    @Autowired
    private CandidateDao candidateDao;
    @Override
    public List<Candidate> selectAll() {
        List<Candidate> candidates = candidateDao.selectAll();
        return candidates;
    }

    @Override
    public void addCandidate(Candidate candidate) {
        candidateDao.addCandidate(candidate);
    }

    @Override
    public void deleteCandidate(Integer c_id) {
        candidateDao.deleteCandidate(c_id);
    }

    @Override
    public void updateCandidate(Candidate candidate) {
        candidateDao.updateCandidate(candidate);
    }

    @Override
    public void deleteSelected(String[] c_ids) {
        for (String c_id : c_ids) {
            candidateDao.deleteCandidate(Integer.parseInt(c_id));
        }
    }

    @Override
    public Candidate selectById(Integer c_id) {
        Candidate candidate = candidateDao.selectById(c_id);
        return candidate;
    }

    @Override
    public List<Candidate> search(String condition) {
        condition = '%' + condition + '%';
        List<Candidate> candidates = candidateDao.search(condition);
        return candidates;
    }
}
