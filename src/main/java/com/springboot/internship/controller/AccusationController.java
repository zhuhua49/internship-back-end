package com.springboot.internship.controller;

import com.springboot.internship.bean.*;
import com.springboot.internship.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class AccusationController {
    @Autowired
    public AccusationMapper accusationMapper;

    //检查重复举报
    @PostMapping("/checkAccusation")
    public int checkAccusation(@RequestBody Accusation accusation) {
        return accusationMapper.duplicateChecking(accusation);
    }

    //新建举报
    @PostMapping("/insertAccusation")
    public Accusation insertAccusation(@RequestBody Accusation accusation) {
        if (accusationMapper.insertAccusation(accusation) == 1) {
            return accusation;
        } else {
            return null;
        }
    }

    //查看职位举报
    @GetMapping("/accusationToJob")
    public List<Accusation> accusationToJob() {
        return accusationMapper.toJob();
    }

    //查看求职者举报
    @GetMapping("/accusationToStudent")
    public List<Accusation> accusationToStudent() {
        return accusationMapper.toStudent();
    }

    //查看公司举报
    @GetMapping("/accusationToEnterprise")
    public List<Accusation> accusationToEnterprise() {
        return accusationMapper.toEnterprise();
    }

    //删除一个举报
    @GetMapping("/deleteAccusation")
    public int deleteAccusation(int id) {
        return accusationMapper.deleteAccusation(id);
    }
}
