package com.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

@Data
public class Message {
    @TableId(type = IdType.AUTO)
    private Integer messageId;
    private String userId;
    private String message;
    private String goodsId;
    @TableField(value = "created_time")
    private Date time;
    @TableField(value = "recipient_id")
    private String recipientId;
    @TableField(value = "sender_id")
    private String senderId;
}
