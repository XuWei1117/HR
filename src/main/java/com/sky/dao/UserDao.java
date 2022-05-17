package com.sky.dao;

import com.sky.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * Create by xww
 * 2021/9/27
 **/
@Repository
public interface UserDao {
    @Select("select * from user where u_name = #{u_name} and u_password = #{u_password}")
    User login(User user);
    @Insert("insert into user values (null,#{u_name},#{u_password},null)")
    void register(User user);
}
