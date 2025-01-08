package org.example.pottery_admin_back.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.pottery_admin_back.mapper.UserMapper;
import org.example.pottery_admin_back.model.User;
import org.example.pottery_admin_back.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService {
}
