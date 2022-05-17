package com.sky.dao;

import com.sky.domain.Candidate;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create by xww
 * 2021/9/28
 **/
@Repository
public interface CandidateDao {
    @Select("select * from candidate,department where c_departId =  d_id")
    List<Candidate> selectAll();

    @Insert("insert into candidate values (null,#{c_name},#{c_age},#{c_gender},#{c_education},#{c_school},#{c_departId},#{c_card},#{c_salary},#{c_phone})")
    void addCandidate(Candidate candidate);

    @Delete("delete from candidate where c_id = #{c_id}")
    void deleteCandidate(Integer c_id);


    @Update("<script>update candidate set\n" +
            "    <if test=\"c_name != null and c_name != ''\">c_name=#{c_name},</if>\n" +
            "    <if test=\"c_age != null\">c_age=#{c_age},</if>\n" +
            "    <if test=\"c_gender != null and c_gender != '' \">c_gender=#{c_gender},</if>\n" +
            "    <if test=\"c_education != null and c_education != ''\">c_education=#{c_education},</if>\n" +
            "    <if test=\"c_school != null and c_school != ''\">c_school=#{c_school},</if>\n" +
            "    <if test=\"c_departId != null\">c_departId=#{c_departId},</if>\n" +
            "    <if test=\"c_phone != null and c_phone != ''\">c_phone=#{c_phone},</if>\n" +
            "    <if test=\"c_card != null and c_card != ''\">c_card=#{c_card},</if>\n" +
            "    <if test=\"c_salary != null\">c_salary=#{c_salary},</if>\n" +
            "    c_id = #{c_id}\n" +
            "    <where>c_id = #{c_id}</where></script>")
    void updateCandidate(Candidate candidate);
    @Select("select * from candidate,department where c_departId = d_id and c_id = #{c_id}")
    Candidate selectById(Integer c_id);

    @Select("select * from candidate,department where c_departId = d_id and (c_name like #{r_name} or c_gender like #{c_gender} or d_name like #{d_name})")
    List<Candidate> search(String condition);

}
