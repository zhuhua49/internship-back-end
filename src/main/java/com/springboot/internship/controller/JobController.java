package com.springboot.internship.controller;

import com.springboot.internship.bean.*;
import com.springboot.internship.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class JobController {
    @Autowired
    public JobMapper jobMapper;

    //职位信息发布
    @PostMapping("/insertJob")
    public Job insertJob(@RequestBody Job job) {
        if (jobMapper.insertJob(job) == 1) {
            return job;
        } else {
            return null;
        }
    }

    //职位信息修改
    @PostMapping("/updateJob")
    public Job updateJob(@RequestBody Job job) {
        if (jobMapper.updateJob(job) == 1) {
            return job;
        } else {
            return null;
        }
    }

    //查看全部职位
    @GetMapping("/jobs")
    public List<Job> seeAll(String name, String type, String area, int skip) {
        if (name.equals("")) {
            name = null;
        }
        if (type.equals("全部")) {
            type = null;
        }
        if (area.equals("全国")) {
            area = null;
        }
        return jobMapper.seeAll(name, type, area, skip);
    }

    //查看职位总数
    @GetMapping("/countJobs")
    public int countJobs() {
        return jobMapper.countJobs();
    }

    //查看一个职位
    @GetMapping("/getJob")
    public Job getJob(int id) {
        return jobMapper.getJob(id);
    }

    //删除一个职位
    @GetMapping("/deleteJob")
    public int deleteJob(int id) {
        return jobMapper.deleteJob(id);
    }
}
