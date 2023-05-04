package com.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.apache.ibatis.type.JdbcType;

import java.io.Serializable;

@Data
@TableName("student_verification")

public class StudentVerification implements Serializable {
    @TableId
    private String userid;
    @TableField("isStudent")
    private String isStudent;
    @TableField(value = "verificationPicUrl", jdbcType = JdbcType.VARCHAR)
    private String verificationPicUrl;


    private String applying;

    public StudentVerification(String userid, String verificationPicUrl,String applying,String isStudent) {
        this.userid = userid;
        this.verificationPicUrl = verificationPicUrl;
        this.applying = applying;
        this.isStudent = isStudent;
    }

}
