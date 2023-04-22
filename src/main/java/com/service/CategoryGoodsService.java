package com.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.domain.CategoryGoods;
import com.domain.Goods;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public interface CategoryGoodsService extends IService<CategoryGoods> {
    List<Goods> newCategoryGoods(String paramString);

    List<Goods> bestCategoryGoods(String paramString);
}
