package com.qf.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 作者：SmallWood
 * 时间：2021/1/18 18:48
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo {
    /**
     * 用户编号
     */
    private String id;
    /**
     * 用户名
     */
    private String name;
    /**
     * 登录账户
     */
    private String account;
    /**
     * 登录密码
     */
    private String password;
    /**
     * 备注
     */
    private String remark;
    /**
     * 启用状态 1：启用 0：禁用
     */
    private Integer enabled;
    /**
     * 最后登录时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date loginTime;

    /**
     * 一对一的角色
     */
    private Role role;
}
