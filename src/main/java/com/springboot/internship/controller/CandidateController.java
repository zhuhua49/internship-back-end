package com.springboot.internship.controller;

import com.springboot.internship.bean.*;
import com.springboot.internship.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class CandidateController {
    @Autowired
    public CandidateMapper candidateMapper;

    //检查重复申请职位
    @PostMapping("/checkCandidate")
    public int checkCandidate(@RequestBody Candidate candidate) {
        return candidateMapper.duplicateChecking(candidate);
    }

    //申请职位
    @PostMapping("/insertCandidate")
    public Candidate insertCandidate(@RequestBody Candidate candidate) {
        if (candidateMapper.insertCandidate(candidate) == 1) {
            return candidate;
        } else {
            return null;
        }
    }

    //修改申请状态和面试信息
    @PostMapping("/updateCandidate")
    public Candidate updateCandidate(@RequestBody Candidate candidate) {
        if (candidateMapper.updateCandidate(candidate) == 1) {
            return candidate;
        } else {
            return null;
        }
    }

    //根据职位查看职位申请
    @GetMapping("/candidateByJob")
    public List<Candidate> candidateByJob(int id) {
        return candidateMapper.byJob(id);
    }

    //根据学生查看职位申请
    @GetMapping("/candidateByStudent")
    public List<Candidate> candidateByStudent(int id) {
        return candidateMapper.byStudent(id);
    }

    //根据公司查看职位申请
    @GetMapping("/candidateByEnterprise")
    public List<Candidate> candidateByEnterprise(int id) {
        return candidateMapper.byEnterprise(id);
    }
}
