package com.qf.service.impl;

import com.qf.dao.RoleDao;
import com.qf.pojo.AuthTreeNode;
import com.qf.pojo.Role;
import com.qf.pojo.TreeModuleVo;
import com.qf.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/19 23:25
 */
@Service
public class RoleServiceImpl implements RoleService  {

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> getAllRole() {
        return roleDao.selectAllRole();
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
