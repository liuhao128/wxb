package com.qf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.pojo.Good;
import com.qf.pojo.ResultData;
import com.qf.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/23 17:38
 */
@Controller
@RequestMapping("/good")
public class GoodController {

    @Autowired
    GoodService goodService;

    @RequestMapping("/goodList")
    public String goodList(){
        return "/good/goodList";
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public ResultData selectAll(Integer page, Integer limit){
        PageHelper.startPage(page,limit);
        List<Good> goodList = goodService.selectAllGood();
        PageInfo<Good> pageInfo = new PageInfo<>(goodList);
        return new ResultData(0,"查询成功",goodList,Integer.parseInt(String.valueOf(pageInfo.getTotal())));
    }

    @RequestMapping("/detailList")
    public String detailList(){
        return "/good/detailList";
    }

    @RequestMapping("/selectOne")
    @ResponseBody
    public ResultData selectOne(String goodId){
        Good good = goodService.selectOneGood(goodId);
        return new ResultData(0,"查询成功",good,1);
    }

    @RequestMapping("/updateState")
    @ResponseBody
    public ResultData updateState(String goodId, Integer state){
        goodService.updateState(goodId, state);
        return new ResultData(0,"状态修改成功");
    }

}
