package com.springboot.internship.mapper;

import com.springboot.internship.bean.*;
import org.apache.ibatis.annotations.*;

import java.util.*;

public interface EnterpriseMapper {
    @Select("select count(*) from enterprise where username=#{username}")
    public int duplicateChecking(Enterprise enterprise);

    @Select("select * from enterprise where username=#{username} and pw=#{pw}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "id",property = "jobs", many = @Many(select = "com.springboot.internship.mapper.JobMapper.seeJobs"))
    })
    public Enterprise getEnterprise(Enterprise enterprise);

    @Select("select * from enterprise where id=#{bossID}")
    @Results({
            @Result(id=true,column="id",property="id"),
            @Result(column = "id",property = "jobs", many = @Many(select = "com.springboot.internship.mapper.JobMapper.seeJobs"))
    })
    public Enterprise seeOne(int bossID);

    @Select("select * from enterprise order by updateTime desc")
    public List<Enterprise> seeAll();

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into enterprise(username,pw) values(#{username},#{pw})")
    public int insertEnterprise(Enterprise enterprise);

    @Update("update enterprise set username=#{username},pw=#{pw},name=#{name},Email=#{Email},telephone=#{telephone},QQ=#{QQ},area=#{area},address=#{address},founded=#{founded},scale=#{scale},introduction=#{introduction} where id=#{id}")
    public int updateEnterprise(Enterprise enterprise);

    @Delete("delete from enterprise where id=#{id}")
    public int deleteEnterprise(int id);
}
