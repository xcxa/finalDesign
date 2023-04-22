package com.finaldesign;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dao.MessageDao;
import com.domain.Message;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashSet;

@SpringBootTest
class FinalDesignApplicationTests {

    @Autowired
    MessageDao messageDao;
    @Test
    void test1(){
        HashSet<Integer> set = new HashSet<>();
        set.add(1);
        set.add(2);
        set.add(3);
        set.add(4);
        System.out.println(set);
    }

    @Test
    void test2(){
        Message message = messageDao.selectOne(new QueryWrapper<Message>()
                .eq("created_time", "2023-03-22 17:44:09"));
        System.out.println(message);
    }

}
