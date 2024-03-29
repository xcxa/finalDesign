//package com.utils;
//
//import com.aliyun.oss.ClientException;
//import com.aliyun.oss.OSS;
//import com.aliyun.oss.OSSClientBuilder;
//import com.aliyun.oss.OSSException;
//import com.properties.OssProperties;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import javax.annotation.Resource;
//import java.io.File;
//import java.io.FileInputStream;
//
//public class MyOss {
//    @Resource
//    private OssProperties ossProperties;
//    public static void upload(String name, File file) throws Exception {
//        String endpoint = ossProperties.getEndpoint();
//        // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
//        String accessKeyId = ossProperties.getKeyId();
//        String accessKeySecret = ossProperties.getKeySecret();
//        String bucketName = ossProperties.getBucketName();
//        String objectName = name;
//
//        // 创建OSSClient实例。
//        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
//
//        try {
//            String content = "Hello OSS";
//            ossClient.putObject(bucketName, objectName, new FileInputStream("C:\\Users\\xcx\\Desktop\\bird.jpg"));
//        } catch (OSSException oe) {
//            System.out.println("Caught an OSSException, which means your request made it to OSS, "
//                    + "but was rejected with an error response for some reason.");
//            System.out.println("Error Message:" + oe.getErrorMessage());
//            System.out.println("Error Code:" + oe.getErrorCode());
//            System.out.println("Request ID:" + oe.getRequestId());
//            System.out.println("Host ID:" + oe.getHostId());
//        } catch (ClientException ce) {
//            System.out.println("Caught an ClientException, which means the client encountered "
//                    + "a serious internal problem while trying to communicate with OSS, "
//                    + "such as not being able to access the network.");
//            System.out.println("Error Message:" + ce.getMessage());
//        } finally {
//            if (ossClient != null) {
//                ossClient.shutdown();
//            }
//        }
//    }
//}