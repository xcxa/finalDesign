package com.service;

import com.domain.tablereflect.Goodsurl;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface GoodsUrlService {

    String getGoodsIdByImgUrl(String imgUrl);


    /**
     * 保存商品图片链接信息
     * @param goodsurl
     * @return
     */


    public int saveGoodsUrl(Goodsurl goodsurl);

    String upload(InputStream inputStream, String orginalFileName);


    /**
     * 获取商品主要图片链接信息
     * @param goodsId
     * @return
     */
    Goodsurl getGoodsMainImg(String goodsId);

    /**
     * 获取商品全部图片链接信息
     * @param goodsId
     * @return
     */
    List<Goodsurl> getGoodsImgs(String goodsId);

    /**
     * 获取商品全部图片信息Map
     * @param goodsId
     * @return
     */
    Map<String,String> getGoodsImgMap(String goodsId);

    /**
     * 删除某个商品的所有对应图片数据
     * @param goodsId
     * @return
     * @throws Exception
     */
    int deleteAllGoodsImgsById(String goodsId) throws Exception;
}
