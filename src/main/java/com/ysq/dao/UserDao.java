package com.ysq.dao;

import com.ysq.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface UserDao {
    @Insert("insert into user(uaccount,password) values (#{uaccount},#{password})")
    public void save(User user);
    @Select("select password from user where uaccount=#{uaccount} ")
    public String selectpwdbyaccount(String account);
    @Select("select uid from user where uaccount=#{uaccount} ")
    public String selectuidbyaccount(String account);

}
