package com.qf.dao;

import com.qf.pojo.AuthTreeNode;
import com.qf.pojo.Role;
import com.qf.pojo.TreeModuleVo;

import java.util.List;

/**
 * @author SmallWood
 * 时间：2021/1/18 21:09
 */
public interface RoleDao {

    /**
     * 查询所有角色的信息
     * @return  返回一个角色的list集合
     */
    List<Role> selectAllRole();

    /**
     *  查询所有的权限节点，封装成一个AuthTreeNode
     * @param parent 父节点默认为‘0101’
     * @return 返回一个AuthTreeNode的list结果集
     */
    List<AuthTreeNode> selectAllModule(String parent);

    /**
     * 查询所有角色拥有的权限节点的id
     * @param code 角色的编号
     * @return 权限节点id的list集合
     */
    List<String> selectModuleIdByRoleId(String code);

    /**
     * 根据角色id删除节点id
     * @param roleId 角色id
     */
    void deleteModuleIdByRoleId(String roleId);

    /**
     * 批量插入角色权限节点
     * @param vo 后端所需要的的节点封装成的实体类
     */
    void insertFun(TreeModuleVo vo);

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
