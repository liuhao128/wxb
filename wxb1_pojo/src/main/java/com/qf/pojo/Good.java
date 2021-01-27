package com.qf.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author SmallWood
 * @date 2021/1/23 17:12
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Good {
    /**
     * 主键ID
     */
    private String goodId;

    /**
     * 商品名称
     */
    private String goodName;

    /**
     * 商户ID
     */
    private String customerId;

    /**
     * 商品图片1
     */
    private String goodPic1;

    /**
     * 商品图片2
     */
    private String goodPic2;

    /**
     * 商品图片3
     */
    private String goodPic3;

    /**
     * 推广说明
     */
    private String promoteDesc;

    /**
     * 文案ID
     */
    private String copyIds;

    /**
     * 文案说明
     */
    private String copyDesc;

    /**
     * 跳转链接
     */
    private String forwardLink;

    /**
     * 订单编号
     */
    private Integer orderNo;
    /**
     * 类型编号
     */
    private String typeId;
    /**
     * 商品分类
     */
    private String tags;
    /**
     * 是否有效 0 待审核, 1 已上架, 2 已下架
     */
    private Integer state;
    /**
     * 加入时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    /**
     * 是否置顶 0 取消置顶 1 置顶
     */
    private Integer toped;
    /**
     * 是否推荐 0 否 1 是
     */
    private Integer recomed;
    /**
     * 置顶时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date topedTime;
    /**
     * 推荐时间
     */
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date recomedTime;
    /**
     * 站内文案ID
     */
    private String spcId;
    /**
     * 空间文案ID
     */
    private String zonId;
    /**
     * 购买人数作弊值
     */
    private Integer sellNum;
    /**
     * 产品网址
     */
    private String website;
    /**
     * 客服QQ
     */
    private String kfqq;
}
