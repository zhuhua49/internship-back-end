package com.springboot.internship.controller;

import com.springboot.internship.bean.*;
import com.springboot.internship.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class AdminController {
    @Autowired
    public AdminMapper adminMapper;

    //管理员登录
    @PostMapping("/getAdmin")
    public Admin getAdmin(@RequestBody Admin admin) {
        return adminMapper.getAdmin(admin);
    }

    //检查用户名重复
    @PostMapping("/checkAdmin")
    public int checkAdmin(@RequestBody Admin admin) {
        return adminMapper.duplicateChecking(admin);
    }

    //添加管理员
    @PostMapping("/insertAdmin")
    public Admin insertAdmin(@RequestBody Admin admin) {
        if (adminMapper.insertAdmin(admin) == 1) {
            return admin;
        } else {
            return null;
        }
    }

    //查看一个管理员
    @GetMapping("/admin")
    public Admin seeOne(int id) {
        return adminMapper.seeOne(id);
    }

    //查看全部管理员
    @GetMapping("/admins")
    public List<Admin> seeAll() {
        return adminMapper.seeAll();
    }

    //删除一个管理员
    @GetMapping("/deleteAdmin")
    public int deleteAdmin(int id) {
        return adminMapper.deleteAdmin(id);
    }
}
