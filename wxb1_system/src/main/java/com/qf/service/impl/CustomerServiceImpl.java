package com.qf.service.impl;

import com.qf.dao.CustomerDao;
import com.qf.pojo.Customer;
import com.qf.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/23 14:31
 */
@Service
public class CustomerServiceImpl  implements CustomerService {

    @Autowired
    CustomerDao customerDao;

    @Override
    public List<Customer> selectAllCustomer() {
        return customerDao.selectAllCustomer();
    }

    @Override
    public void addOneCustomer(Customer customer) {
        customerDao.addOneCustomer(customer);
    }

    @Override
    public void deleteOneCustomer(String customerId) {
        customerDao.deleteOneCustomer(customerId);
    }

    @Override
    public Customer selectOneCustomer(String customerId) {
        return customerDao.selectOneCustomer(customerId);
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerDao.updateCustomer(customer);
    }

    @Override
    public void updateState(String customerId, Integer state) {
        customerDao.updateState(customerId, state);
    }
}
