package com.controller;

import com.dao.StudentVerificationDao;
import com.domain.StudentVerification;
import com.domain.tablereflect.Goodsurl;
import com.service.GoodsUrlService;
import com.service.StudentVerificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/upload")
@CrossOrigin
public class UpFileController {
    @Autowired
    private GoodsUrlService goodsUrlService;
    @Autowired
    private  StudentVerificationDao studentVerificationDao;
    @Autowired
    private StudentVerificationService studentVerificationService;
    @GetMapping("/isStudent")
    @ResponseBody
    public Map<String, String> checkStudent(@RequestParam String userId) {

        return studentVerificationService.check(userId);
    }


    @PostMapping(value = "/uploadVerificationFile")
    @ResponseBody
    public void uploadVerificationFile(@RequestParam Map<String,String> map, @RequestParam("file") MultipartFile[] files) throws Exception {
        System.out.println("开始上传");
        String userId = map.get("userId");
        for(MultipartFile file : files) {
            String originalFilename = file.getOriginalFilename();
            //新的图片名称
            assert originalFilename != null;
            String newFileName =  userId + UUID.randomUUID().toString() +originalFilename.substring(originalFilename.lastIndexOf("."));
            InputStream fileInputStream = file.getInputStream();

            String fileUrl = goodsUrlService.upload(fileInputStream, newFileName);
            //此处代码在大数据情况下有逻辑错误，后期应该解决维护
            int count = studentVerificationDao.insert(new StudentVerification(userId, fileUrl,"1","0"));
            if (count == 0)
                throw new Exception("图片保存失败");
        }
    }

    @RequestMapping(value = "/uploadFile.do",method = RequestMethod.POST)
    @ResponseBody
    public void uploadFile(@RequestParam Map<String,String> map, @RequestParam("file") MultipartFile[] files) throws Exception {
        String goodsId = map.get("goodsId");

        for(MultipartFile file : files) {
            String originalFilename = file.getOriginalFilename();
            //新的图片名称
            assert originalFilename != null;
            System.out.println(originalFilename);
            String newFileName =  goodsId + UUID.randomUUID().toString() +originalFilename.substring(originalFilename.lastIndexOf("."));
            System.out.println(newFileName);
            InputStream fileInputStream = file.getInputStream();
            String fileUrl = goodsUrlService.upload(fileInputStream, newFileName);
            //此处代码在大数据情况下有逻辑错误，后期应该解决维护
            int count = goodsUrlService.saveGoodsUrl(new Goodsurl(goodsId, fileUrl, UUID.randomUUID().toString()));
            if (count == 0)
                throw new Exception("图片保存失败");
        }
    }
}