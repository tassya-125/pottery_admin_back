package org.example.pottery_admin_back.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Mapper;
import org.example.pottery_admin_back.model.User;

@Mapper
public  interface UserMapper extends BaseMapper<User> {

}
