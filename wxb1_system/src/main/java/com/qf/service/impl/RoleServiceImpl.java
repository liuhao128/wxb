package com.qf.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.qf.dao.RoleDao;
import com.qf.pojo.AuthTreeNode;
import com.qf.pojo.Role;
import com.qf.pojo.TreeModuleVo;
import com.qf.service.RoleService;
import com.qf.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/19 23:25
 */
@Service
public class RoleServiceImpl implements RoleService  {

    @Autowired
    private RoleDao roleDao;
    @Resource
    private RedisTemplate<String, String> redisTemplate; //封装的redis操作类

    @Override
    public List<Role> getAllRole() {
        //定义一个处理json相关的mapper
        ObjectMapper mapper = new ObjectMapper();
        //1、查询缓存
        //定义一个key（唯一、尽量不会被推倒）
        //使用一个唯一的名字 + 参数值 + MD5
        String key = MD5Utils.md5("getAllRole");
        //得到redisTemplate中的操作对象
        BoundValueOperations<String, String> boundValueOps = redisTemplate.boundValueOps(key);
        //得到缓存中的值
        String value = boundValueOps.get();
        System.out.println("value = " + value);
        //2、判断缓存是否有该数据
        if (value != null) {
            //3、如果有则返回该数据
            System.out.println("查询缓存");
            List<Role> list = null;
            try {
                list = mapper.readValue(value, new TypeReference<List<Role>>(){});
            }catch (Exception e){
                e.printStackTrace();
            }
            return list;
        }else {
            // 4、如果没有，则去数据库中查询，并保存到缓存中
            System.out.println("查询数据库");
            List<Role> roleList = roleDao.selectAllRole();
            if (roleList != null && roleList.size() > 0) {
                //转换成json格式
                try {
                    String string = mapper.writeValueAsString(roleList);
                    //保存到缓存中
                    boundValueOps.set(string);
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                }
            }
            return roleList;
        }
    }

    @Override
    public List<AuthTreeNode> getAllAuthTreeNode(String roleId, String parent) {
        //查询所有节点
        List<AuthTreeNode> nodeList = roleDao.selectAllModule(parent);
        //查询角色拥有的节点
        List<String> list = roleDao.selectModuleIdByRoleId(roleId);
        for (AuthTreeNode node : nodeList) {
            if (node.getChildren() != null && node.getChildren().size() > 0) {
                for (AuthTreeNode child : node.getChildren()) {
                    if (list.contains(child.getId())) {
                        child.setChecked(true);
                    }
                }
            }
        }
        return nodeList;
    }

    @Override
    public List<String> getModuleIdByRoleId(String code) {
        return roleDao.selectModuleIdByRoleId(code);
    }

    @Override
    public void updateAuthTree(String roleId, TreeModuleVo vo) {
        roleDao.deleteModuleIdByRoleId(roleId);
        if (vo.getModuleIds() != null || vo.getModuleIds().length > 0) {
            roleDao.insertFun(vo);
        }
    }

    @Override
    public void addRole(Role role) {
        roleDao.addRole(role);
    }

    @Override
    public void deleteRole(String code) {
        roleDao.deleteRole(code);
    }

    @Override
    public Role getRole(String code) {
        return roleDao.getRole(code);
    }

    @Override
    public void updateRole(Role role) {
        roleDao.updateRole(role);
    }
}
