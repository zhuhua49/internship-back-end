package com.springboot.internship;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;

@SpringBootTest
class InternshipApplicationTests {

    @Autowired
    DataSource dataSource;

    public String aaa(String bbb){
        return bbb;
    }

    @Test
    void contextLoads() {
        System.out.println(aaa(null));
    }

}
