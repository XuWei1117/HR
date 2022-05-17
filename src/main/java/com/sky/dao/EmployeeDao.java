package com.sky.dao;

import com.sky.domain.Employee;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create by xww
 * 2021/9/17
 **/
@Repository
public interface EmployeeDao {

    //显示所有员工列表
    @Select("<script>  select * from employee\n" +
            "    <where>\n" +
            "        <if test=\"e_id!=null\">e_id=#{e_id}</if>\n" +
            "        <if test=\"e_name!=null and e_name!=''\">and e_name=#{e_name}</if>\n" +
            "        <if test=\"e_gender!=null and e_gender!=''\">and e_gender=#{e_gender}</if>\n" +
            "        <if test=\"e_identity!=null and e_identity!=''\">and e_identity=#{e_identity}</if>\n" +
            "    </where></script>")
    List<Employee> selectAll(Employee employee);



    //增加员工
    @Insert("insert into employee values (null,#{e_name},#{e_age},#{e_gender},#{e_education},#{e_school},#{e_start},#{e_departId},#{e_phone},#{e_card},#{e_identity},#{e_salary})")
    void addEmployee(Employee employee);
    //根据id删除员工
    @Delete("delete from employee where e_id=#{e_id}")
    void deleteEmployee(Integer e_id);

    //修改前根据id进行查询
    @Select("select * from employee,department where e_id=#{e_id} and e_departId = d_id")
    Employee findById(Integer e_id);

    //修改员工信息
    @Update("<script>update employee set\n" +
            "    <if test=\"e_name != null and e_name != ''\">e_name=#{e_name},</if>\n" +
            "    <if test=\"e_age != null\">e_age=#{e_age},</if>\n" +
            "    <if test=\"e_gender != null and e_gender != '' \">e_gender=#{e_gender},</if>\n" +
            "    <if test=\"e_education != null and e_education != ''\">e_education=#{e_education},</if>\n" +
            "    <if test=\"e_school != null and e_school != ''\">e_school=#{e_school},</if>\n" +
            "    <if test=\"e_departId != null\">e_departId=#{e_departId},</if>\n" +
            "    <if test=\"e_phone != null and e_phone != ''\">e_phone=#{e_phone},</if>\n" +
            "    <if test=\"e_card != null and e_card != ''\">e_card=#{e_card},</if>\n" +
            "    <if test=\"e_identity != null and e_identity != ''\">e_identity=#{e_identity},</if>\n" +
            "    <if test=\"e_salary != null\">e_salary=#{e_salary},</if>\n" +
            "    e_id = #{e_id}\n" +
            "    <where>e_id = #{e_id}</where></script>")
    void updateEmployee(Employee employee);


    @Update("update employee set e_identity = '正式员工' where e_id = #{e_id}")
    void returnFull(Integer e_id);
    @Insert("insert into employee values(null,#{e_name},#{e_age},#{e_gender},#{e_education},#{e_school},NOW(),#{e_departId},#{e_phone},#{e_card},'实习生',#{e_salary})")
    void addEmployee1(Employee employee);


}
