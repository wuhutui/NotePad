package com.ysq.service;

import com.ysq.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface UserService {

    public boolean saveuser(User user);
    public String selectpwdbyaccount(String account);
    public String selectuidbyaccount(String account);

}
