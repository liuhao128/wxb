package com.qf.service;

import com.qf.pojo.Module;
import com.qf.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 作者：SmallWood
 * 时间：2021/1/19 8:42
 */
public interface UserInfoService {


    /**
     *  登录
     * @param account 账号
     * @param password 密码
     * @return
     */
    UserInfo login(@Param("account") String account, @Param("password") String password);

    /**
     *  获得所有的菜单
     * @param roleId 角色id
     * @return  返回一个module的list集合
     */
    List<Module> getMenu(String roleId);

    /**
     * 查询用户信息
     * @param userId 用户id
     * @return 用户信息
     */
    UserInfo selectUserInfoByUserId(String userId);

    /**
     * 修改用户密码
     * @param password 用户密码
     * @param userId    用户编号
     */
    void updatePassword(String password, String userId);

    /**
     * 查询所有用户信息
     * @return 返回所有用户信息
     */
    List<UserInfo> selectAllUserInfo();

    /**
     * 增加用户信息
     * @param userInfo 用户信息对象
     */
    void addUserInfo(UserInfo userInfo);

    /**
     * 删除用户信息
     * @param userId 用户编号
     */
    void deleteUserInfo(String userId);

    /**
     * 修改用户信息
     * @param userInfo 用户信息对象
     */
    void updateUserInfo(UserInfo userInfo);

    /**
     * 修改启用状态
     * @param userId 用户id
     * @param enabled 启用状态
     */
    void updateEnable(@Param("userId") String userId, @Param("enabled") Integer enabled);

}
