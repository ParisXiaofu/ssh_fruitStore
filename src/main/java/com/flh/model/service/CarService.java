package com.flh.model.service;

import com.flh.model.entity.Car;

import java.util.List;

public interface CarService {
    /**
     * 分类查询购物车商品
     * @param goodsTypeId
     * @param custId
     * @return
     */
    public List<Car> allCarService( int goodsTypeId, int custId);
    public List<Car> allOrdersGoodsService(int custId);
    /**
     * 添加购物车
     * @param car
     */
    public void addCarService(Car car);

    /**
     * 删除购物车
     * @param car
     */
    public void deleteCarService(Car car);

    /**
     * 修改购物车
     * @param car
     */
    public void updateCarService(Car car);
    /**
     * 计算购物车总价
     * @param custId
     * @return
     */
    public List<Car> totalMoneyService(int custId);
}
