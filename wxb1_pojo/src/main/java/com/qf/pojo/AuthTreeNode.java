package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/20 19:30
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthTreeNode {
    /**
     * 节点名称
     */
    private String title;
    /**
     * 节点编号
     */
    private String id;
    /**
     * 节点是否被选中 true/false
     */
    private Boolean checked;
    /**
     * 节点下的子节点
     */
    private List<AuthTreeNode> children;
}
