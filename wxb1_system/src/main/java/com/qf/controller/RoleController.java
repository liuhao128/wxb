package com.qf.controller;

import com.qf.pojo.AuthTreeNode;
import com.qf.pojo.ResultData;
import com.qf.pojo.Role;
import com.qf.pojo.TreeModuleVo;
import com.qf.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/19 20:54
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    public String list(Model model){
        //调用roleService里面的得到所有角色的方法
        List<Role> roleList = roleService.getAllRole();
        //将查询的结果放到model里面
        Model roleList1 = model.addAttribute("roleList", roleList);
        return "/role/list";
    }

    @RequestMapping("/funcTree")
    public String funcTree(){
        return "/role/funcTree";
    }

    @RequestMapping("/getTree")
    @ResponseBody
    public ResultData getTree(String roleId){
        List<AuthTreeNode> nodeList = roleService.getAllAuthTreeNode(roleId,"0101");
        if (nodeList == null || nodeList.size() == 0) {
            return new ResultData(500,"查询失败");
        }else {
            return new ResultData(0,"查询成功",nodeList,nodeList.size());
        }
    }

    @RequestMapping("/updateAuth")
    @ResponseBody
    public ResultData updateAuth(@RequestBody TreeModuleVo vo){
        roleService.updateAuthTree(vo.getRoleId(), vo);
        return new ResultData(0,"授权成功");
    }

    @RequestMapping("/addRole")
    public String addRole(){
        return "/role/addRole";
    }

    @RequestMapping("/addOneRole")
    @ResponseBody
    public ResultData addOneRole(@RequestBody Role role){
        roleService.addRole(role);
        return new ResultData(0,"添加成功");
    }

    @RequestMapping("/deleteOne")
    @ResponseBody
    public ResultData deleteOne(String code){
        roleService.deleteRole(code);
        return new ResultData(0,"删除成功");
    }

    @RequestMapping("/editRole")
    public String oneRoleList(){
        return "/role/editRole";
    }

    @RequestMapping("/getRole")
    @ResponseBody
    public ResultData getRole(String code){
        Role role = roleService.getRole(code);
        return new ResultData(0,"查询成功",role,1);
    }

    @RequestMapping("/updateRole")
    @ResponseBody
    public ResultData updateRole(@RequestBody Role role){
        roleService.updateRole(role);
        return new ResultData(0,"修改成功");
    }
}
