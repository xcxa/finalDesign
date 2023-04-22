package com.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.domain.Message;
import com.domain.MessageDto;

import java.util.Map;

public interface MessageService extends IService<Message> {

    Map getPages(String userId, int currentPage, int pageSize);

    Message saveMessage(Message message);

    Message replyMessage(MessageDto messageDto);

    Map getInfoPages(String goodsId, int currentPage, int pageSize);
}
