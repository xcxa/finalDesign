package com.domain;

import lombok.Data;

@Data
public class StudentVerification {
    private int userid;
    private boolean isStudent;
    private String verificationPicUrl;
}
