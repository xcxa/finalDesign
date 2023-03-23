package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.domain.Message;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageDao extends BaseMapper<Message> {

}
