package com.qf.dao;

import com.qf.pojo.Good;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/23 17:24
 */
public interface GoodDao {

    /**
     * 查询全部商品
     * @return 全部的商品的list集合
     */
    List<Good> selectAllGood();

    /**
     * 增加一个商品
     * @param good 商品对象
     */
    void addOneGood(Good good);

    /**
     * 删除一个商品
     * @param goodId 商品id
     */
    void deleteOneGood(String goodId);

    /**
     * 根据id查询一个商品
     * @param goodId 商品id
     * @return 商品信息
     */
    Good selectOneGood(String goodId);

    /**
     * 修改一个商品
     * @param good 商品对象
     */
    void updateGood(Good good);

    /**
     * 修改商品状态
     * @param goodId 商品id
     * @param state 状态
     */
    void updateState(@Param("goodId") String goodId, @Param("state") Integer state);

}
