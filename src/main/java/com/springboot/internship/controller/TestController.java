package com.springboot.internship.controller;

import com.springboot.internship.bean.*;
import com.springboot.internship.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class TestController {

    @Autowired
    public TestMapper testMapper;

    @GetMapping("/getTest")
    public List<Test> getTest(){
        return testMapper.getTest();
    }

    @GetMapping("/111duplicateChecking")
    public int duplicateChecking(){
        return testMapper.duplicateChecking();
    }

    @PostMapping("/insertTest")
    public Test insertTest(@RequestBody Test test){
        System.out.println(test);
        testMapper.insertTest(test);
        return test;
    }
}
