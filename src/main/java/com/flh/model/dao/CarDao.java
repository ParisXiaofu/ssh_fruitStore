package com.flh.model.dao;

import com.flh.model.entity.Car;

import java.util.List;

public interface CarDao {
    /**
     * 分类查询购物车
     * @param goodsTypeId
     * @param custId
     * @return
     */
    public List<Car> allCarDao(int goodsTypeId,int custId);
    public List<Car> allOrdersGoodsDao(int custId);
    /**
     * 添加购物车
     * @param car
     */
    public void addCarDao(Car car);

    /**
     * 删除购物车
     * @param car
     */
    public void deleteCarDao(Car car);

    /**
     * 修改购物车
     * @param car
     */
    public void updateCarDao(Car car);

    /**
     * 计算购物车总价
     * @param custId
     * @return
     */
    public List<Car> totalMoney(int custId);
}
