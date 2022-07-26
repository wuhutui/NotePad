package com.ysq.service.impl;

import com.ysq.dao.UserDao;
import com.ysq.domain.User;
import com.ysq.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public boolean saveuser(User user) {
        userDao.save(user);
        return true;
    }


    public String selectpwdbyaccount(String account) {
        return userDao.selectpwdbyaccount(account);
    }


    public String selectuidbyaccount(String account) {
        return userDao.selectuidbyaccount(account);
    }
}
