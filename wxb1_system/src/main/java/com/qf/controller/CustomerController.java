package com.qf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.pojo.Customer;
import com.qf.pojo.ResultData;
import com.qf.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/23 14:33
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @RequestMapping("/customerList")
    public String customerList(){
        return "/customer/customerList";
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public ResultData selectAll(Integer page, Integer limit){
        PageHelper.startPage(page,limit);
        List<Customer> customerList = customerService.selectAllCustomer();
        PageInfo<Customer> pageInfo = new PageInfo<>(customerList);
        return new ResultData(0,"查询成功",customerList,Integer.parseInt(String.valueOf(pageInfo.getTotal())));
    }

    @RequestMapping("/addCustomer")
    public String addCustomer(){
        return "/customer/addCustomer";
    }

    @RequestMapping("/addOne")
    @ResponseBody
    public ResultData addOne(@RequestBody Customer customer){
        customerService.addOneCustomer(customer);
        return new ResultData(0,"添加成功");
    }

    @RequestMapping("/deleteOne")
    @ResponseBody
    public ResultData deleteOne(String customerId){
        customerService.deleteOneCustomer(customerId);
        return new ResultData(0,"删除成功");
    }

    @RequestMapping("/editCustomer")
    public String editCustomer(){
        return "/customer/editCustomer";
    }

    @RequestMapping("/selectOne")
    @ResponseBody
    public ResultData selectOne(String customerId){
        Customer customer = customerService.selectOneCustomer(customerId);
        return new ResultData(0,"查询成功",customer,1);
    }

    @RequestMapping("/updateCustomer")
    @ResponseBody
    public ResultData updateCustomer(@RequestBody Customer customer){
        customerService.updateCustomer(customer);
        return new ResultData(0,"修改成功");
    }

    @RequestMapping("/updateState")
    @ResponseBody
    public ResultData updateState(String customerId, Integer state){
        customerService.updateState(customerId, state);
        return new ResultData(0,"启用状态修改成功");
    }


}
