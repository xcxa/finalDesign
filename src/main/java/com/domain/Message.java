package com.domain;

import lombok.Data;

@Data
public class Message {
    private Integer messageId;
    private String userId;
    private String message;
    private String goodsId;
}