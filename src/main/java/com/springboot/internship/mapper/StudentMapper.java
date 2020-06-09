package com.springboot.internship.mapper;

import com.springboot.internship.bean.*;
import org.apache.ibatis.annotations.*;

import java.util.*;

public interface StudentMapper {
    @Select("select * from student where username=#{username} and pw=#{pw}")
    public Student getStudent(Student student);

    @Select("select count(*) from student where username=#{username}")
    public int duplicateChecking(Student student);

    @Select("select * from student where id=#{id}")
    public Student seeOne(int id);

    @Select("select * from student order by updateTime desc")
    public List<Student> seeAll();

    @Options(useGeneratedKeys = true,keyProperty = "id")
    @Insert("insert into student(username,pw) values(#{username},#{pw})")
    public int insertStudent(Student student);

    @Update("update student set username=#{username},pw=#{pw},realname=#{realname},sex=#{sex},age=#{age},Email=#{Email},telephone=#{telephone},QQ=#{QQ},area=#{area},politic=#{politic},education=#{education},career=#{career},introduction=#{introduction},CV=#{CV} where id=#{id}")
    public int updateStudent(Student student);

    @Delete("delete from student where id=#{id}")
    public int deleteStudent(int id);
}
