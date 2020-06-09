package com.springboot.internship.controller;

import com.springboot.internship.bean.*;
import com.springboot.internship.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.*;

@RestController
public class StudentController {
    @Autowired
    public StudentMapper studentMapper;

    //学生登录
    @PostMapping("/getStudent")
    public Student getStudent(@RequestBody Student student) {
        return studentMapper.getStudent(student);
    }

    //检查用户名重复
    @PostMapping("/checkStudent")
    public int checkStudent(@RequestBody Student student) {
        return studentMapper.duplicateChecking(student);
    }

    //学生注册
    @PostMapping("/insertStudent")
    public Student insertStudent(@RequestBody Student student) {
        if (studentMapper.insertStudent(student) == 1) {
            return student;
        } else {
            return null;
        }
    }

    //学生信息修改
    @PostMapping("/updateStudent")
    public Student updateStudent(@RequestBody Student student) {
        if (studentMapper.updateStudent(student) == 1) {
            return student;
        } else {
            return null;
        }
    }

    //查看全部学生
    @GetMapping("/students")
    public List<Student> seeAll() {
        return studentMapper.seeAll();
    }

    //查看一个学生
    @GetMapping("/student")
    public Student seeOne(int id) {
        return studentMapper.seeOne(id);
    }

    //删除一个学生
    @GetMapping("/deleteStudent")
    public int deleteStudent(int id, String username) {
        String avatarPath = "D:\\IDEA\\workspace\\internship\\fileBase\\avatar\\" + id + username + ".jpg";
        File avatar = new File(avatarPath);
        if (avatar.exists()) {//文件是否存在
            avatar.delete();
        }
        String cvPath = "D:\\IDEA\\workspace\\internship\\fileBase\\CV\\" + id + username + ".pdf";
        File CV = new File(cvPath);
        if (CV.exists()) {//文件是否存在
            CV.delete();
        }
        return studentMapper.deleteStudent(id);
    }
}
