package com.qf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 作者：SmallWood
 * 时间：2021/1/19 10:11
 */
@Controller
public class PageController {

    @RequestMapping("/login.html")
    public String loginPage(){
        return "login";
    }

    @RequestMapping("/home.html")
    public String homePage(){
        return "home";
    }



}
