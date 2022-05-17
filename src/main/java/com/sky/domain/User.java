package com.sky.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Create by xww
 * 2021/9/27
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer u_id;
    private String u_name;
    private String u_password;
    private Integer u_identity;
}
