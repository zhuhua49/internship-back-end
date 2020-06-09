package com.springboot.internship.mapper;

import com.springboot.internship.bean.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CandidateMapper {
    @Select("select * from candidate where jobID=#{id} order by updateTime desc")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "jobID", property = "job", one = @One(select = "com.springboot.internship.mapper.JobMapper.getJob")),
            @Result(column = "studentID", property = "student", one = @One(select = "com.springboot.internship.mapper.StudentMapper.seeOne")),
            @Result(column = "bossID", property = "enterprise", one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne")),
    })
    public List<Candidate> byJob(int id);

    @Select("select * from candidate where studentID=#{id} order by updateTime desc")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "jobID", property = "job", one = @One(select = "com.springboot.internship.mapper.JobMapper.getJob")),
            @Result(column = "studentID", property = "student", one = @One(select = "com.springboot.internship.mapper.StudentMapper.seeOne")),
            @Result(column = "bossID", property = "enterprise", one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne")),
    })
    public List<Candidate> byStudent(int id);

    @Select("select * from candidate where bossID=#{id} order by updateTime desc")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "jobID", property = "job", one = @One(select = "com.springboot.internship.mapper.JobMapper.getJob")),
            @Result(column = "studentID", property = "student", one = @One(select = "com.springboot.internship.mapper.StudentMapper.seeOne")),
            @Result(column = "bossID", property = "enterprise", one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne")),
    })
    public List<Candidate> byEnterprise(int id);

    @Select("select count(*) from candidate where jobID=#{jobID} and studentID=#{studentID}")
    public int duplicateChecking(Candidate candidate);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into candidate(jobID,studentID,bossID,updateTime) values(#{jobID},#{studentID},#{bossID},#{updateTime})")
    public int insertCandidate(Candidate candidate);

    @Update("update candidate set state=#{state},schedule=#{schedule},area=#{area},address=#{address},note=#{note},reason=#{reason} where id=#{id}")
    public int updateCandidate(Candidate candidate);

    @Delete("delete from candidate where id=#{id}")
    public int deleteCandidate(int id);
}
