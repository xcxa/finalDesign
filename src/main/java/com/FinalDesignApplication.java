package com;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@MapperScan("com.dao")
public class FinalDesignApplication {

    public static void main(String[] args) {
        SpringApplication.run(FinalDesignApplication.class, args);
    }

}
