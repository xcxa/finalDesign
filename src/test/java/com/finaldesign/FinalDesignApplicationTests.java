package com.finaldesign;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dao.MessageDao;
import com.domain.Message;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FinalDesignApplicationTests {

    @Autowired
    MessageDao messageDao;
    @Test
    void test1(){

    }

    @Test
    void test2(){
        Message message = messageDao.selectOne(new QueryWrapper<Message>()
                .eq("created_time", "2023-03-22 17:44:09"));
        System.out.println(message);
    }

}
