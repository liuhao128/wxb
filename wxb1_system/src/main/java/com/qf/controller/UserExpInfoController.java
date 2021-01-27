package com.qf.controller;

import com.qf.pojo.ResultData;
import com.qf.pojo.UserExpInfo;
import com.qf.service.UserExpInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author SmallWood
 * @date 2021/1/22 0:03
 */
@Controller
public class UserExpInfoController {

    @Autowired
    UserExpInfoService userExpInfoService;

    @RequestMapping("/baseData")
    public String baseData(){
        return "/user/baseData";
    }

    @RequestMapping("/selectUserExpInfo")
    @ResponseBody
    public ResultData selectUserExpInfo(String userId){
        UserExpInfo userExpInfo = userExpInfoService.selectUserExpInfoByUserId(userId);
        return new ResultData(0,"查询成功",userExpInfo,1);
    }

    @RequestMapping("/updateUserExpInfo")
    @ResponseBody
    public ResultData updateUserExpInfo(@RequestBody UserExpInfo userExpInfo){
        userExpInfoService.updateUserExpInfo(userExpInfo);
        return new ResultData(0,"修改成功");
    }
}
