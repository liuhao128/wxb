package com.qf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.pojo.Module;
import com.qf.pojo.ResultData;
import com.qf.pojo.UserInfo;
import com.qf.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 作者：SmallWood
 * 时间：2021/1/19 8:42
 */
@Controller
@SessionAttributes({"userInfo"})
public class UserInfoController {

    @Autowired
    UserInfoService userInfoService;

    @RequestMapping("/login")
    public String login(String account, String password, Model model){
        UserInfo userInfo = userInfoService.login(account, password);
        if (userInfo == null) {
            model.addAttribute("msg","用户名或者密码错误");
            return "login";
        }else {
            model.addAttribute("userInfo",userInfo);
            return "home";
        }
    }

    @RequestMapping("/getMenu")
    @ResponseBody
    public ResultData getMenu(@SessionAttribute(value = "userInfo", required = false) UserInfo userInfo){
        if (userInfo == null) {
            return new ResultData(1,"请先登录");
        }
        List<Module> list = userInfoService.getMenu(userInfo.getRole().getCode());
        if (list == null || list.size() == 0) {
            return new ResultData(2,"你没有权限");
        }else {
            return new ResultData(0,"请进行操作",list,list.size());
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, SessionStatus sessionStatus){
        session.invalidate();
        sessionStatus.setComplete();
        return "/login";
    }

    @RequestMapping("/setting")
    public String setting(){
        return "/user/setting";
    }

    @RequestMapping("/selectUserInfo")
    @ResponseBody
    public ResultData selectUserInfo(String userId){
        UserInfo userInfo = userInfoService.selectUserInfoByUserId(userId);
        return new ResultData(0,"查询成功",userInfo,1);
    }

    @RequestMapping("/updatePassword")
    @ResponseBody
    public ResultData updatePassword(String password, String userId){
        System.out.println(password);
        System.out.println(userId);
        userInfoService.updatePassword(password,userId);
        return new ResultData(0,"修改密码成功");
    }

    @RequestMapping("/user/userInfoList")
    public String userInfoList(){
        return "/user/userInfoList";
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public ResultData selectAll(Integer page, Integer limit){
        PageHelper.startPage(page,limit);
        List<UserInfo> userInfoList = userInfoService.selectAllUserInfo();
        PageInfo<UserInfo> pageInfo = new PageInfo<>(userInfoList);
        return new ResultData(0,"查询成功",userInfoList,Integer.parseInt(String.valueOf(pageInfo.getTotal())));
    }

    @RequestMapping("/user/addUserInfo")
    public String addUserInfo(){
        return "/user/addUserInfo";
    }

    @RequestMapping("/addUserInfo")
    @ResponseBody
    public ResultData addUserInfo(@RequestBody UserInfo userInfo){
        System.out.println(userInfo);
        userInfoService.addUserInfo(userInfo);
        return new ResultData(0,"添加成功");
    }

    @RequestMapping("/deleteUserInfo")
    @ResponseBody
    public ResultData deleteUserInfo(String userId){
        userInfoService.deleteUserInfo(userId);
        return new ResultData(0,"删除成功");
    }

    @RequestMapping("/user/editUserInfo")
    public String updateUserInfo(){
        return "/user/editUserInfo";
    }

    @RequestMapping("/updateUserInfo")
    @ResponseBody
    public ResultData updateUserInfo(@RequestBody UserInfo userInfo){
        userInfoService.updateUserInfo(userInfo);
        return new ResultData(0,"修改成功");
    }

    @RequestMapping("/setEnabled")
    @ResponseBody
    public ResultData setEnabled(String userId, Integer enabled){
        System.out.println(userId);
        System.out.println(enabled);
        userInfoService.updateEnable(userId, enabled);
        return new ResultData(0,"启用状态修改成功");
    }
}
