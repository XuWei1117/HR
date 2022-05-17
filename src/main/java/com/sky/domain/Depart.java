package com.sky.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Create by xww
 * 2021/9/17
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Depart {
    private Integer d_id;
    private String d_name;
    private String d_phone;
}
