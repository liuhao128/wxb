package com.qf.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author SmallWood
 * @date 2021/1/23 14:04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    /**
     * 商户编号
     */
    private String customerId;
    /**
     * 商户名称
     */
    private String customerName;
    /**
     * 商户QQ
     */
    private String qq;
    /**
     * 微信号码
     */
    private String wxh;
    /**
     * 电话
     */
    private String phone;
    /**
     * 创建时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    /**
     * 登录账户
     */
    private String loginName;
    /**
     * 登录密码
     */
    private String loginPwd;
    /**
     *  是否有效 0 无效 1 有效
     */
    private Integer state;
    /**
     * 商户等级 0 非认证商户 1认证商户V1 2认证商户V2  3认证商户V3
     */
    private Integer level;
    /**
     * 账户余额
     */
    private Double accBalance;
    /**
     * 最后登录时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date updateTime;
    /**
     * 商户网址
     */
    private String website;
}
