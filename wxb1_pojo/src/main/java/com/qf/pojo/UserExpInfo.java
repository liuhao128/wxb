package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author SmallWood
 * @date 2021/1/21 23:05
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserExpInfo {

    /**
     * 用户编号
     */
    private String userId;
    /**
     * 用户性别 0:男 1:女
     */
    private String sex;
    /**
     * 用户昵称
     */
    private String nickName;
    /**
     * 邮箱地址
     */
    private String email;
    /**
     * 用户QQ号码
     */
    private String qqNum;
    /**
     * 用户手机号码
     */
    private String telephone;
    /**
     * 账号登录次数
     */
    private Integer loginNum;
}
