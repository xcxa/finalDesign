package com.controller;

import com.domain.CategoryGoods;
import com.domain.Goods;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.service.CategoryGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/category"})
@CrossOrigin
public class CategoryGoodsController {
    @Autowired
    CategoryGoodsService categoryGoodsService;

    @PostMapping({"/create"})
    public void createCategoryGoods(@RequestBody CategoryGoods categoryGoods, HttpServletResponse response) throws IOException {
        this.categoryGoodsService.save(categoryGoods);
    }

    @GetMapping({"/newCategoryGoods/{categoryId}"})
    @ResponseBody
    public List<Goods> newCategoryGoods(@PathVariable String categoryId) {
        return this.categoryGoodsService.newCategoryGoods(categoryId);
    }

    @GetMapping({"/bestCategoryGoods/{categoryId}"})
    @ResponseBody
    public List<Goods> bestCategoryGoods(@PathVariable String categoryId) {
        return this.categoryGoodsService.bestCategoryGoods(categoryId);
    }
}
