package org.example.pottery_admin_back.controller;


import org.example.pottery_admin_back.model.User;
import org.example.pottery_admin_back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;


    @RequestMapping("/login")
    public String login() {
        User user = userService.getById(1);

        return "login";
    }
}
