package com.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.dao.GoodsurlDao;
import com.domain.tablereflect.Goodsurl;
import com.properties.OssProperties;
import com.service.GoodsUrlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class GoodsUrlServiceImpl implements GoodsUrlService {
    @Autowired
    private GoodsurlDao goodsurlDao;
    @Autowired
    private OssProperties ossProperties;

    @Override
    public int saveGoodsUrl(Goodsurl goodsurl) {
        return goodsurlDao.createGoodsurl(goodsurl);
    }

    @Override
    public String upload(InputStream inputStream, String orginalFileName) {
        // yourEndpoint填写Bucket所在地域对应的Endpoint。以华东1（杭州）为例，Endpoint填写为https://oss-cn-hangzhou.aliyuncs.com。
        String endpoint = ossProperties.getEndpoint();
        // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
        String accessKeyId = ossProperties.getKeyId();
        String accessKeySecret = ossProperties.getKeySecret();
        String bucketName = ossProperties.getBucketName();

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 依次填写Bucket名称（例如examplebucket）和Object完整路径（例如exampledir/exampleobject.txt）。Object完整路径中不能包含Bucket名称。
//        String folder = new DateTime().toString("yyyy/MM/dd");
        // 文件名
        String fileName = UUID.randomUUID().toString();
        //文件扩展名
        String fileExtention = orginalFileName.substring(orginalFileName.lastIndexOf("."));
        //最终的路径 类似avatar/2021/12/05/xxxxxxxxx.jpg
        String objectName = fileName+fileExtention;
        ossClient.putObject(bucketName, objectName, inputStream);
        // 关闭OSSClient。
        ossClient.shutdown();
        return "https://"+bucketName+"."+endpoint+"/"+objectName;
    }

    @Override
    public Goodsurl getGoodsMainImg(String goodsId) {
        List<Goodsurl> goodsurls = goodsurlDao.findAllByGoodsId(goodsId);

        //默认第一张图作为主图
        Goodsurl goodsurl = goodsurls.get(0);
        String imgUrl = goodsurl.getImgUrl();
        String[] strings = imgUrl.split("/");
        goodsurl.setImgUrl(strings[strings.length - 1]);
        return goodsurls.get(0);
    }

    @Override
    public List<Goodsurl> getGoodsImgs(String goodsId) {
        List<Goodsurl> goodsurls = goodsurlDao.findAllByGoodsId(goodsId);
        for(Goodsurl goodsurl : goodsurls){
            String imgUrl = goodsurl.getImgUrl();
            String[] strings = imgUrl.split("/");
            goodsurl.setImgUrl(strings[strings.length - 1]);
        }
        return goodsurls;
    }

    @Override
    public int deleteAllGoodsImgsById(String goodsId) throws Exception {
        List<Goodsurl> goodsurls = goodsurlDao.findAllByGoodsId(goodsId);
        for(Goodsurl goodsurl : goodsurls){
            File file = new File(goodsurl.getImgUrl());
            if(file.exists())
                if(!file.delete())
                    throw new Exception("文件删除异常");
        }
        return goodsurlDao.deleteAllByGoodsId(goodsId);
    }

    @Override
    public Map<String, String> getGoodsImgMap(String goodsId) {
        List<Goodsurl> list = goodsurlDao.findAllByGoodsId(goodsId);
        HashMap<String, String> map = new HashMap<>();
        int i = 1;
        for(Goodsurl goodsurl : list){
            String[] strings = goodsurl.getImgUrl().split("/");
            map.put("img"+i,"https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/"+strings[strings.length - 1]);
            i++;
        }
        return map;
    }
}
