package com.springboot.internship.mapper;

import com.springboot.internship.bean.*;
import org.apache.ibatis.annotations.*;

import java.util.*;

public interface TestMapper {

    @Select("select * from test")
    public List<Test> getTest();

    @Select("select count(*) from test")
    public int duplicateChecking();

    @Options(useGeneratedKeys = true,keyProperty = "id")
    @Insert("insert into test(name) values(#{name})")
    public int insertTest(Test test);
}
