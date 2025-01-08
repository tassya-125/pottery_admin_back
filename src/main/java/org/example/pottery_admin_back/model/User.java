package org.example.pottery_admin_back.model;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("user")
public class User {
   @TableId(type = IdType.AUTO)
   private int id;
   private String username;
   private String password;
   private String email;
   private String phone;
   private int type;
}
