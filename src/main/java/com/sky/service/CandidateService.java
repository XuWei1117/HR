package com.sky.service;

import com.sky.domain.Candidate;
import com.sky.domain.Employee;

import java.util.List;

/**
 * Create by xww
 * 2021/9/28
 **/
public interface CandidateService {
    List<Candidate> selectAll();

    void addCandidate(Candidate candidate);

    void deleteCandidate(Integer c_id);
    void updateCandidate(Candidate candidate);
    void deleteSelected(String[] c_ids);
    Candidate selectById(Integer c_id);

    List<Candidate> search(String condition);


}
