package com.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dao.MessageDao;
import com.domain.Message;
import com.domain.MessageDto;
import com.domain.User;
import com.service.GoodsService;
import com.service.GoodsUrlService;
import com.service.MessageService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;
@Service
public class MessageServiceImpl extends ServiceImpl<MessageDao,Message> implements MessageService {
    @Autowired
    GoodsService goodsService;
    @Autowired
    UserService userService;

    @Autowired
    GoodsUrlService goodsUrlService;
    private  static int currentPage;
  //  @Cacheable(value = "messagePageCache", key = "#userId + ':' + #currentPage")
    @Override
    public Map getPages(String userId, int currentPage, int pageSize) {
        this.currentPage = currentPage;
        System.out.println(this.currentPage);

        //2 根据user id查询所有消息
        List<Message> messageList = this.query()
                .eq("recipient_id", userId).list();
        int total = messageList.size();
        //3 封装成MessageDtoList 根据goodsid查询imgURl 按时间排序
        List<MessageDto> messageDtoList = messageList.stream().map(message -> {
                    MessageDto messageDto = new MessageDto();
                    messageDto.setMessage(message.getMessage());
//            messageDto.setTime(message.getTime());
                    messageDto.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                            .format(message.getTime()));
                    messageDto.setUserName(message.getUserId());
                    messageDto.setImgUrl("https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/"+goodsUrlService.getGoodsMainImg(message.getGoodsId()).getImgUrl());
                    return messageDto;
                }).sorted(Comparator.comparing(MessageDto::getTime).reversed())
                .collect(Collectors.toList());
        //4  分页处理
        int start = (currentPage - 1) * pageSize;
        int end = Math.min(start + pageSize, messageDtoList.size());
        ArrayList<MessageDto> pageList = new ArrayList<>(messageDtoList.subList(start, end));
        HashMap<String, Object> map = new HashMap<>();
        map.put("data",pageList);
        map.put("total",total);
        map.put("currentPage", currentPage);
        map.put("pageSize", pageSize);
        return map;
    }
    @CacheEvict(value = "messagePageCache", key = "#message.getUserId() + ':' + #currentPage")
    @Override
    public Message saveMessage(Message message) {
        System.out.println(message.getUserId()+":"+currentPage);
        message.setSenderId(message.getUserId());
        User user = userService.getInfo(message.getUserId());

        message.setUserId(user.getUsername());
        message.setTime(new Date());
        System.out.println("time:"+message.getTime());
        message.setRecipientId(goodsService.getGoodsDscrip(message.getGoodsId()).getUserId());
        this.save(message);
        return message;
    }

    @Override
    public Message replyMessage(MessageDto messageDto) {

        Message message = new Message();
        Message oldMessage = this.getOne(new QueryWrapper<Message>()
                .eq("created_time", messageDto.getTime()));
        message.setMessage(messageDto.getMessage());
        message.setTime(new Date());
        message.setRecipientId(oldMessage.getSenderId());
        message.setGoodsId(oldMessage.getGoodsId());
        message.setSenderId(messageDto.getUserName());
        message.setUserId(userService.getInfo(message.getSenderId()).getUsername());
        System.out.println(message);
        this.save(message);
        return message;
    }

    @Override
    public Map<String, Object> getInfoPages(String goodsId, int currentPage, int pageSize) {
        // Calculate start index based on current page and page size
        int startIndex = (currentPage - 1) * pageSize;

        // Perform a query to get the total count of messages for the given goodsId
        Long totalCount = query().eq("goods_id", goodsId).count();

        // Query for a page of messages sorted by time in descending order
        List<Message> list = query()
                .eq("goods_id", goodsId)
                .orderByDesc("created_time")
                .last("LIMIT " + startIndex + ", " + pageSize)
                .list();

        // Calculate total page count based on total count and page size
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // Store the results in a map
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data", list);
        resultMap.put("currentPage", currentPage);
        resultMap.put("pageSize", pageSize);
        resultMap.put("total", totalCount);

        return resultMap;
    }


}

