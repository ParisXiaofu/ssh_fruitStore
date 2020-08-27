package com.flh.model.service.impl;

import com.flh.model.dao.CarDao;
import com.flh.model.dao.impl.CarImpl;
import com.flh.model.entity.Car;
import com.flh.model.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CarServiceImpl implements CarService {
@Autowired
private CarDao carDao=new CarImpl();

    public void setCarDao(CarDao carDao) {
        this.carDao = carDao;
    }
    /**
     * 分类查询购物车商品
     * @param goodsTypeId
     * @param custId
     * @return
     */
    @Override
    public List<Car> allCarService( int goodsTypeId, int custId) {
        return carDao.allCarDao(goodsTypeId,custId);
    }

    @Override
    public List<Car> allOrdersGoodsService(int custId) {
        return carDao.allOrdersGoodsDao(custId);
    }

    /**
     * 添加购物车
     * @param car
     */
    @Override
    public void addCarService(Car car) {
carDao.addCarDao(car);
    }
    /**
     * 删除购物车
     * @param car
     */
    @Override
    public void deleteCarService(Car car) {
carDao.deleteCarDao(car);
    }
    /**
     * 修改购物车
     * @param car
     */
    @Override
    public void updateCarService(Car car) {
carDao.updateCarDao(car);
    }
    /**
     * 计算购物车总价
     * @param custId
     * @return
     */
    @Override
    public List<Car> totalMoneyService(int custId) {
        return carDao.totalMoney(custId);
    }
}
