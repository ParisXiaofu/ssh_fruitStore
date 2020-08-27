package com.flh.model.dao.impl;

import com.flh.model.dao.CarDao;
import com.flh.model.entity.Car;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CarImpl implements CarDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    /**
     * 分类查询购物车商品
     * @param goodsTypeId
     * @param custId
     * @return
     */
    @Override
    public List<Car> allCarDao( int goodsTypeId, int custId) {
        Query query=getSession().createQuery("from Car where customer.custId=? and goods.goodstype.goodsTypeId=?");
        query.setParameter(0,custId);
        query.setParameter(1,goodsTypeId);
        List<Car> carList=query.list();
        return carList;
    }

    @Override
    public List<Car> allOrdersGoodsDao(int custId) {
        Query query=getSession().createQuery("from Car where customer.custId=? ");
        query.setParameter(0,custId);
        List<Car> carList=query.list();
        return carList;
    }

    /**
     * 添加购物车
     * @param car
     */
    @Override
    public void addCarDao(Car car) {
        getSession().save(car);
    }
    /**
     * 删除购物车
     * @param car
     */
    @Override
    public void deleteCarDao(Car car) {
getSession().delete(car);
    }
    /**
     * 修改购物车
     * @param car
     */
    @Override
    public void updateCarDao(Car car) {
        Query query=getSession().createQuery("update from Car set goodsNum=?,totalPrice=? where carId=?");
        query.setParameter(0,car.getGoodsNum());
        query.setParameter(1,car.getTotalPrice());
        query.setParameter(2,car.getCarId());
        query.executeUpdate();
    }

    @Override
    public List<Car> totalMoney(int custId) {
        Query query=getSession().createQuery("select sum(totalPrice) from Car where customer.custId=?");
        query.setParameter(0,custId);
        List<Car> carList=query.list();
        return carList;
    }
}
