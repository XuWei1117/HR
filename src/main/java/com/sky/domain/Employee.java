package com.sky.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Create by xww
 * 2021/9/17
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    private Integer e_id;
    private String e_name;
    private Integer e_age;
    private String e_gender;
    private String e_education;
    private String e_school;
    @JsonFormat(pattern = "YYYY-MM-dd",timezone = "GMT+8")
    private Date e_start;
    private Integer e_departId;
    private String e_phone;
    private String e_card;
    private String e_identity;
    private Double e_salary;
    private Integer d_id;
    private String d_name;

}
