package com.sky.dao;

import com.sky.domain.Recruit;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create by xww
 * 2021/9/29
 **/
@Repository
public interface RecruitDao {
    @Select("select * from recruit,employee,department where r_departId = d_id and r_empId = e_id")
    List<Recruit> selectAll();
    @Select("select * from recruit,employee,department where r_departId = d_id and r_empId = e_id and r_id = #{r_id}")
    Recruit selectById(Integer r_id);
    @Insert("insert into recruit values (null,#{r_position},#{r_count},#{r_departId},#{r_experience},#{r_gender},#{min_age},#{max_age},#{min_salary},#{max_salary},#{r_empId})")
    void addRecruit(Recruit recruit);
    @Delete("delete from recruit where r_id = #{r_id}")
    void deleteRecruit(Integer r_id);
    @Update("<script>   update recruit set\n" +
            "    <if test=\"r_position != null and r_position != ''\">r_position=#{r_position},</if>\n" +
            "    <if test=\"r_count != null\">r_count=#{r_count},</if>\n" +
            "    <if test=\"r_departId != null \">r_departId=#{r_departId},</if>\n" +
            "    <if test=\"r_experience != null and r_experience != ''\">r_experience=#{r_experience},</if>\n" +
            "    <if test=\"r_gender != null and r_gender != ''\">r_gender=#{r_gender},</if>\n" +
            "    <if test=\"r_gender != null and r_gender != ''\">r_gender=#{r_gender},</if>\n" +
            "    <if test=\"min_age!= null \">min_age=#{min_age},</if>\n" +
            "    <if test=\"max_age != null\">max_age=#{max_age},</if>\n" +
            "    <if test=\"min_salary!= null \">min_salary=#{min_salary},</if>\n" +
            "    <if test=\"max_salary != null\">max_salary=#{max_salary},</if>\n" +
            "    <if test=\"r_empId != null\">r_empId=#{r_empId},</if>\n" +
            "    r_id=#{r_id}\n" +
            "    <where>r_id=#{r_id}</where></script>")
    void updateRecruit(Recruit recruit);

    @Select("select * from recruit,department where r_departId = d_id and (r_position like #{r_position} or d_name like #{d_name} or r_experience like #{r_experience} or r_gender like #{r_gender})")
    List<Recruit> search(String condition);
}
