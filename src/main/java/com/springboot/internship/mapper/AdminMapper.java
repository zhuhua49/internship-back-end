package com.springboot.internship.mapper;

import com.springboot.internship.bean.*;
import org.apache.ibatis.annotations.*;

import java.util.*;

public interface AdminMapper {
    @Select("select * from admin where username=#{username} and pw=#{pw}")
    public Admin getAdmin(Admin admin);

    @Select("select count(*) from admin where username=#{username}")
    public int duplicateChecking(Admin admin);

    @Select("select * from admin where id=#{id}")
    public Admin seeOne(int id);

    @Select("select * from admin order by id desc")
    public List<Admin> seeAll();

    @Options(useGeneratedKeys = true,keyProperty = "id")
    @Insert("insert into admin(username,pw,realname,telephone,level) " +
            "values(#{username},#{pw},#{realname},#{telephone},#{level})")
    public int insertAdmin(Admin admin);

    @Update("update admin set username=#{username},pw=#{pw},realname=#{realname},telephone=#{telephone} where id=#{id}")
    public int updateAdmin(Admin admin);

    @Delete("delete from admin where id=#{id}")
    public int deleteAdmin(int id);
}
