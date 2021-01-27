package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author SmallWood
 * 时间：2021/1/18 19:11
 * 66952
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Module {
    /**
     * 菜单编码
     */
    private String code;
    /**
     * 功能名称
     */
    private String name;
    /**
     * 请求路径
     */
    private String url;
    /**
     * 排序编号
     */
    private Integer order;
    /**
     * 上级功能
     */
    private String parent;
    /**
     * 权限描述
     */
    private String desc;
    /**
     * 是否展开
     */
    private String expanded;
    /**
     * 是否叶子节点
     */
    private String leaf;
    /**
     * 角色id
     */
    private String roleId;
    /**
     * 模块下的子模块
     */
    private List<Module> childModuleList;
}
