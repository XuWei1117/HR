package com.sky.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Create by xww
 * 2021/9/28
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Candidate {
    private Integer c_id;
    private String c_name;
    private String c_age;
    private String c_gender;
    private String c_education;
    private String c_school;
    private Integer c_departId;
    private String c_card;
    private Double c_salary;
    private String c_phone;
    private Integer d_id;
    private String d_name;
}
