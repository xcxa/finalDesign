package com.domain;

import lombok.Data;

import java.io.Serializable;
@Data
public class Goods implements Serializable {
    private String userId;
    private String goodsId;
    private String dscrip;
    private double price;
    private double goodsLevel;
    private int upStatus = 1;
    private int useStatus = 1;
    private double hot = 0;
    private String name;

}
