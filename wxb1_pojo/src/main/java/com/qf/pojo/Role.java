package com.qf.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author SmallWood
 * 时间：2021/1/18 19:04
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {
    private String code;//角色编码
    private String name;//角色名称
    private String desc;//角色描述
    private Integer order;//角色排序
    private Integer type;//角色类型 1:业务角色;2:管理角色;

}
