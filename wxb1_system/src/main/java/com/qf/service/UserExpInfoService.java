package com.qf.service;

import com.qf.pojo.UserExpInfo;

/**
 * @author SmallWood
 * @date 2021/1/21 23:50
 */
public interface UserExpInfoService {

    /**
     * 查询用户详细信息
     * @param userId 用户编号
     * @return 返回一个用户的详细信息
     */
    UserExpInfo selectUserExpInfoByUserId(String userId);

    /**
     * 修改用户详细信息
     * @param userExpInfo 用户详细信息对象
     */
    void updateUserExpInfo(UserExpInfo userExpInfo);
}
