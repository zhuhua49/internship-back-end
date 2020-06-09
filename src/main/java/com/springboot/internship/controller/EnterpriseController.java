package com.springboot.internship.controller;

import com.springboot.internship.bean.*;
import com.springboot.internship.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.*;

@RestController
public class EnterpriseController {
    @Autowired
    public EnterpriseMapper enterpriseMapper;

    //企业登录
    @PostMapping("/getEnterprise")
    public Enterprise getEnterprise(@RequestBody Enterprise enterprise) {
        return enterpriseMapper.getEnterprise(enterprise);
    }

    //检查用户名重复
    @PostMapping("/checkEnterprise")
    public Boolean checkEnterprise(@RequestBody Enterprise Enterprise) {
        return enterpriseMapper.duplicateChecking(Enterprise) != 0;
    }

    //企业注册
    @PostMapping("/insertEnterprise")
    public Enterprise insertEnterprise(@RequestBody Enterprise enterprise) {
        if (enterpriseMapper.duplicateChecking(enterprise) == 0 && enterpriseMapper.insertEnterprise(enterprise) == 1) {
            return enterprise;
        } else {
            return null;
        }
    }

    //企业信息修改
    @PostMapping("/updateEnterprise")
    public Enterprise updateEnterprise(@RequestBody Enterprise enterprise) {
        if (enterpriseMapper.updateEnterprise(enterprise) == 1) {
            return enterprise;
        } else {
            return null;
        }
    }

    //查看全部企业
    @GetMapping("/enterprises")
    public List<Enterprise> seeAll() {
        return enterpriseMapper.seeAll();
    }

    //查看一个企业
    @GetMapping("/enterprise")
    public Enterprise seeOne(int id) {
        return enterpriseMapper.seeOne(id);
    }

    //删除一个公司
    @GetMapping("/deleteEnterprise")
    public int deleteEnterprise(int id, String username) {
        String logoPath = "D:\\IDEA\\workspace\\internship\\fileBase\\logo\\" + id + username + ".jpg";
        File logo = new File(logoPath);
        if (logo.exists()) {//文件是否存在
            logo.delete();
        }
        return enterpriseMapper.deleteEnterprise(id);
    }
}
