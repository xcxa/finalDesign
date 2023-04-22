package com.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dao.CategoryGoodsDao;
import com.domain.CategoryGoods;
import com.domain.Goods;
import com.service.CategoryGoodsService;
import com.service.GoodsService;

@Service
public class CategoryGoodsServiceImpl extends ServiceImpl<CategoryGoodsDao, CategoryGoods> implements CategoryGoodsService {

    @Autowired
    private GoodsService goodsService;

    private static Goods apply(CategoryGoods categoryGoods) {
        Goods goods = new Goods();
        BeanUtils.copyProperties(categoryGoods, goods);
        return goods;
    }

    public List<Goods> newCategoryGoods(String categoryId) {
        List<Goods> goodsList = this.list(new LambdaQueryWrapper<CategoryGoods>()
                        .eq(CategoryGoods::getCategory, categoryId)
                        .orderByAsc(Goods::getHot)).stream()
                .map(CategoryGoodsServiceImpl::apply)
                .collect(Collectors.toList());
        System.out.println(goodsList);
        return goodsList;
    }

    public List<Goods> bestCategoryGoods(String categoryId) {
        List<Goods> goodsList = this.list(new LambdaQueryWrapper<CategoryGoods>()
                        .eq(CategoryGoods::getCategory, categoryId))
                .stream()
                .filter(categoryGoods -> categoryGoods.getGoodsLevel() >= 9.0)
                .map(CategoryGoodsServiceImpl::apply)
                .collect(Collectors.toList());
        return goodsList;
    }
}
