package com.qf.service;

import com.qf.pojo.Customer;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/23 14:30
 */
public interface CustomerService {

    /**
     * 查询全部商户
     * @return 全部的商户的list集合
     */
    List<Customer> selectAllCustomer();

    /**
     * 增加一个商户
     * @param customer 商户对象
     */
    void addOneCustomer(Customer customer);

    /**
     * 删除一个商户
     * @param customerId 商户id
     */
    void deleteOneCustomer(String customerId);

    /**
     * 根据id查询一个商户
     * @param customerId 商户id
     * @return 商户信息
     */
    Customer selectOneCustomer(String customerId);

    /**
     * 修改一个商户
     * @param customer 商户对象
     */
    void updateCustomer(Customer customer);

    /**
     * 修改商户状态
     * @param customerId 商户id
     * @param state 状态
     */
    void updateState(String customerId, Integer state);
}
