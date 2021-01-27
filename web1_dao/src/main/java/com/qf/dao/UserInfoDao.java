package com.qf.dao;

import com.qf.pojo.Module;
import com.qf.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 作者：SmallWood
 * 时间：2021/1/18 19:34
 */
@Repository
public interface UserInfoDao {
    /**
     * 查询用户信息
     * @param account 账户
     * @param password 密码
     * @return 用户信息
     */
    UserInfo selectUserInfoByAccountAndPassword(@Param("account") String account, @Param("password") String password);

    /**
     * 查询所有模块
     * @param roleId 角色编码
     * @param parent 父节点
     * @return 节点list集合
     */
    List<Module> selectAllModule(@Param("roleId") String roleId, @Param("parent") String parent);

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
    void updatePassword(@Param("password") String password, @Param("userId") String userId);

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
