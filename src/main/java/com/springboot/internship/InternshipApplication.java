package com.springboot.internship;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(value = "com.springboot.internship.mapper")
@SpringBootApplication
public class InternshipApplication {

    public static void main(String[] args) {
        SpringApplication.run(InternshipApplication.class, args);
    }

}
