package com.controller;

import com.domain.Message;
import com.domain.MessageDto;
import com.service.MessageService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
@RequestMapping("/message")
@CrossOrigin
public class MessageController {
    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    @PostMapping("/send")
    @ResponseBody
    public Message snedMessage(@RequestBody Message message){

        return messageService.saveMessage(message);
    }
    @PostMapping("/reply")
    @ResponseBody
    public Message replyMessage(@RequestBody MessageDto messageDto){
        System.out.println(messageDto);
        return messageService.replyMessage(messageDto);
    }
    @GetMapping("/getPage")
    @ResponseBody
    public Map getPage(
            @RequestParam("userId") String userId,
               @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
                @RequestParam(value = "pageSize", defaultValue = "10") int pageSize
    ){

        return messageService.getPages(userId, currentPage, pageSize);
    }
}
