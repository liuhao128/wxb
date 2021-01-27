package com.qf.service.impl;

import com.qf.dao.UserExpInfoDao;
import com.qf.pojo.UserExpInfo;
import com.qf.service.UserExpInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author SmallWood
 * @date 2021/1/21 23:52
 */
@Service
public class UserExpInfoServiceImpl implements UserExpInfoService {

    @Autowired
    UserExpInfoDao userExpInfoDao;

    @Override
    public UserExpInfo selectUserExpInfoByUserId(String userId) {
        return userExpInfoDao.selectUserExpInfoByUserId(userId);
    }

    @Override
    public void updateUserExpInfo(UserExpInfo userExpInfo) {
        userExpInfoDao.updateUserExpInfo(userExpInfo);
    }
}
