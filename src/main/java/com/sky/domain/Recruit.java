package com.sky.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Create by xww
 * 2021/9/29
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Recruit {
    private Integer r_id;
    private String r_position;
    private Integer r_count;
    private Integer r_departId;
    private String r_experience;
    private String r_gender;
    private Integer min_age;
    private Integer max_age;
    private Double min_salary;
    private Double max_salary;
    private Integer r_empId;
    private Integer d_id;
    private String d_name;
    private Integer e_id;
    private String e_name;

}
