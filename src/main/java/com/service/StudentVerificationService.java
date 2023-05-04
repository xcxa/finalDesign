package com.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.domain.StudentVerification;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface StudentVerificationService extends IService<StudentVerification> {


    Map<String, String> check(String userId);
}
