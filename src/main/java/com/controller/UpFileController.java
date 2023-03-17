package com.controller;

import com.dao.GoodsurlDao;
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
@RequestMapping("/upload")
@CrossOrigin
public class UpFileController {
    @Autowired
    private GoodsUrlService goodsUrlService;

    @RequestMapping(value = "/uploadFile.do",method = RequestMethod.POST)
    @ResponseBody
    public void uploadFile(@RequestParam Map<String,String> map, @RequestParam("file") MultipartFile[] files) throws Exception {
        String goodsId = map.get("goodsId");
        //存储图片的物理路径
//        String pic_path = "H:/imgUpload/";
//        File f = new File(pic_path);
//        if(!(f.exists() && f.isDirectory())) {
//            boolean mkdir = f.mkdir();
//            if(!mkdir){
//                throw new Exception("图片上传文件夹创建失败");
//            }
//        }
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