package com.sky.dao;

import com.sky.domain.Depart;
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
public interface DepartDao {
    @Select("<script>select * from department\n" +
            "    <where>\n" +
            "        <if test=\"d_id != null\">d_id=#{d_id}</if>\n" +
            "        <if test=\"d_name != null and d_name != ''\">d_name=#{d_name}</if>\n" +
            "    </where></script>")
    List<Depart> findAll(Depart depart);
    @Insert("insert into department(d_name,d_phone) values (#{d_name},#{d_phone})")
    Integer addDepart(Depart depart);
    @Delete("delete from department where d_id = #{d_id}")
    void deleteDepart(Integer d_id);
    @Select("select * from department where d_id = #{d_id}")
    Depart selectById(Integer d_id);
    @Update("<script>   update department set\n" +
            "    <if test=\"d_name != null and d_name != ''\">d_name=#{d_name},</if>\n" +
            "    <if test=\"d_phone != null and d_phone != ''\">d_phone=#{d_phone},</if>\n" +
            "    d_id=#{d_id}\n" +
            "    <where>d_id=#{d_id}</where></script>")
    void updateDepart(Depart depart);
}
