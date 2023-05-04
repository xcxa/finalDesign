package com.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dao.StudentVerificationDao;
import com.domain.StudentVerification;
import com.service.StudentVerificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class StudentVerificationServiceImpl extends ServiceImpl<StudentVerificationDao, StudentVerification> implements StudentVerificationService {

    @Autowired
    private StudentVerificationDao studentVerificationDao;
    @Override
    public Map<String, String> check(String userId) {
        Map<String, String> result = new HashMap<>();
        StudentVerification studentVerification = studentVerificationDao.selectOne(new QueryWrapper<StudentVerification>()
                .eq("userid", userId));

        if (studentVerification == null) {
            result.put("isStudent", "0");
            result.put("applying", "0");
        } else {
            result.put("isStudent", studentVerification.getIsStudent().toString());
            result.put("applying", studentVerification.getApplying());
        }
        return result;
    }


}
