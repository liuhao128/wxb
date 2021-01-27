package com.qf.service;

import com.qf.pojo.AuthTreeNode;
import com.qf.pojo.Role;
import com.qf.pojo.TreeModuleVo;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/19 23:06
 */

public interface RoleService {

    /**
     * 得到所有角色信息
     * @return role的list集合
     */
    List<Role> getAllRole();

    /**
     * 得到所有的权限树节点
     * @param roleId 角色的id
     * @param parent 默认为‘0101’的节点
     * @return 返货一个list集合类型的AuthTreeNode
     */
    List<AuthTreeNode> getAllAuthTreeNode(String roleId,String parent);

    /**
     * 查询所有角色拥有的权限节点的id
     * @param code 角色的编号
     * @return 权限节点id的list集合
     */
    List<String> getModuleIdByRoleId(String code);

    /**
     * 修改权限树，包括删除和添加
     * @param roleId 角色id
     * @param  vo 后端所需要的的节点封装成的实体类
     */
    void updateAuthTree(String roleId, TreeModuleVo vo);

    /**
     * 添加一个角色
     * @param role 角色对象
     */
    void addRole(Role role);

    /**
     * 删除一个角色
     * @param code 角色code
     */
    void deleteRole(String code);

    /**
     * 查询一个角色
     * @param code 角色code
     * @return 返回一个角色信息
     */
    Role getRole(String code);

    /**
     * 修改一个角色
     * @param role 角色对象
     */
    void updateRole(Role role);

}
