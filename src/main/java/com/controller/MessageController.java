package com.controller;


import com.dao.GoodsurlDao;
import com.domain.Message;
import com.domain.tablereflect.Goodsurl;
import com.service.GoodsUrlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/message")
@CrossOrigin
public class MessageController {
    @Autowired
    private GoodsUrlService goodsUrlService;
    @PostMapping("/send")
    @ResponseBody
    public int snedMessage(@RequestBody Message message){
        System.out.println(message);
        return 1;
    }
}