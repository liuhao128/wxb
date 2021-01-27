package com.qf.service.impl;

import com.qf.dao.GoodDao;
import com.qf.pojo.Good;
import com.qf.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author SmallWood
 * @date 2021/1/23 17:35
 */
@Service
public class GoodServiceImpl implements GoodService {

    @Autowired
    GoodDao goodDao;

    @Override
    public List<Good> selectAllGood() {
        return goodDao.selectAllGood();
    }

    @Override
    public void addOneGood(Good good) {
        goodDao.addOneGood(good);
    }

    @Override
    public void deleteOneGood(String goodId) {
        goodDao.deleteOneGood(goodId);
    }

    @Override
    public Good selectOneGood(String goodId) {
        return goodDao.selectOneGood(goodId);
    }

    @Override
    public void updateGood(Good good) {
        goodDao.updateGood(good);
    }

    @Override
    public void updateState(String goodId, Integer state) {
        goodDao.updateState(goodId, state);
    }
}
