package com.qf.pojo;

import lombok.Data;

/**
 * @author SmallWood
 * @date 2021/1/20 23:36
 */
@Data
public class TreeModuleVo {
    /**
     * 角色id
     */
    private String roleId;
    /**
     * 节点id
     */
    private String[] moduleIds;
}
