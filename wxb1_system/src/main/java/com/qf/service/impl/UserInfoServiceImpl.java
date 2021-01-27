package com.qf.service.impl;

import com.qf.pojo.Module;
import com.qf.pojo.UserInfo;
import com.qf.dao.UserInfoDao;
import com.qf.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SmallWood
 * 时间：2021/1/19 9:19
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoDao userInfoDao;

    @Override
    public UserInfo login(String account, String password) {
        return userInfoDao.selectUserInfoByAccountAndPassword(account, password);
    }

    @Override
    public List<Module> getMenu(String roleId) {
        //因为默认只显示两级，第一级从0101开始
        return userInfoDao.selectAllModule(roleId, "0101");
    }

    @Override
    public UserInfo selectUserInfoByUserId(String userId) {
        return userInfoDao.selectUserInfoByUserId(userId);
    }

    @Override
    public void updatePassword(String password, String userId) {
        userInfoDao.updatePassword(password, userId);
    }

    @Override
    public List<UserInfo> selectAllUserInfo() {
        return userInfoDao.selectAllUserInfo();
    }

    @Override
    public void addUserInfo(UserInfo userInfo) {
        userInfoDao.addUserInfo(userInfo);
    }

    @Override
    public void deleteUserInfo(String userId) {
        userInfoDao.deleteUserInfo(userId);
    }

    @Override
    public void updateUserInfo(UserInfo userInfo) {
        userInfoDao.updateUserInfo(userInfo);
    }

    @Override
    public void updateEnable(String userId, Integer enabled) {
        userInfoDao.updateEnable(userId, enabled);
    }


}
