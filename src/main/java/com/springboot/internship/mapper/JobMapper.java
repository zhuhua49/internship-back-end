package com.springboot.internship.mapper;

import com.springboot.internship.bean.*;
import org.apache.ibatis.annotations.*;

import java.util.*;

public interface JobMapper {
    @Select("select * from job where id=#{id}")
    @Results({
            @Result(property = "enterprise",
                    column = "bossID",
                    one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne"))
    })
    public Job getJob(int id);

    @Select({"<script>",
            "SELECT * FROM job",
            "WHERE 1=1",
            "<when test='name!=null'>",
            "AND name like '%${name}%'",
            "</when>",
            "<when test='type!=null'>",
            "AND type = #{type}",
            "</when>",
            "<when test='area!=null'>",
            "AND area = #{area}",
            "</when>",
            "order by updateTime desc",
            "LIMIT #{skip}, 30",
            "</script>"})
    @Results({
            @Result(property = "enterprise",
                    column = "bossID",
                    one = @One(select = "com.springboot.internship.mapper.EnterpriseMapper.seeOne"))
    })
    public List<Job> seeAll(String name, String type, String area, int skip);

    @Select("select * from job where bossID=#{id} order by updateTime desc")
    public List<Job> seeJobs(int id);

    @Select("select count(*) from job")
    public int countJobs();

    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into job(name,bossID,type,salary,workTime,area,address,introduction,updateTime) " +
            "values(#{name},#{bossID},#{type},#{salary},#{workTime},#{area},#{address},#{introduction},#{updateTime})")
    public int insertJob(Job job);

    @Update("update job set name=#{name},bossID=#{bossID},type=#{type},salary=#{salary},workTime=#{workTime},area=#{area},address=#{address},introduction=#{introduction} where id=#{id}")
    public int updateJob(Job job);

    @Delete("delete from job where id=#{id}")
    public int deleteJob(int id);
}
