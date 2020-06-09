package com.springboot.internship.mapper;

import com.springboot.internship.bean.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface AccusationMapper {
    @Select("select * from accusation where target='toJob' order by id desc")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "jobID", property = "job", one = @One(select = "com.springboot.internship.mapper.JobMapper.getJob")),
            @Result(column = "studentID", property = "student", one = @One(select = "com.springboot.internship.mapper.StudentMapper.seeOne")),
            @Result(column = "bossID", property = "enterprise", one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne")),
    })
    public List<Accusation> toJob();

    @Select("select * from accusation where target='toStudent' order by id desc")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "studentID", property = "student", one = @One(select = "com.springboot.internship.mapper.StudentMapper.seeOne")),
            @Result(column = "bossID", property = "enterprise", one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne")),
    })
    public List<Accusation> toStudent();

    @Select("select * from accusation where target='toEnterprise' order by id desc")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "studentID", property = "student", one = @One(select = "com.springboot.internship.mapper.StudentMapper.seeOne")),
            @Result(column = "bossID", property = "enterprise", one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne")),
    })
    public List<Accusation> toEnterprise();

    @Select({"<script>",
            "select count(*) from accusation",
            "WHERE bossID=#{bossID} and studentID=#{studentID} and target=#{target}",
            "<when test='jobID!=null'>",
            "AND jobID=#{jobID}",
            "</when>",
            "</script>"})
    public int duplicateChecking(Accusation accusation);

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into accusation(jobID,studentID,bossID,target,description) " +
            "values(#{jobID},#{studentID},#{bossID},#{target},#{description})")
    public int insertAccusation(Accusation accusation);

    @Delete("delete from accusation where id=#{id}")
    public int deleteAccusation(int id);
}
