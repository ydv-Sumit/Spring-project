package com.sumit.dao;

import com.sumit.model.User;

public interface UserDao {

    User getUserByEmail(String email);

    int registerUser(User user);
}