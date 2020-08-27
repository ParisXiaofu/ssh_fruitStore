package com.flh.model.dao.impl;

import com.flh.model.dao.OrderDao;
import com.flh.model.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return   sessionFactory.getCurrentSession();
    }

    /**
     * 分页查询订单
     * @param pageSize
     * @param custId
     * @return
     */
    @Override
    public int totalPageOrdersDao(int pageSize, int custId) {
        int totalPage=0;
        Query query=getSession().createQuery("from Orders where customer.custId=?");
        query.setParameter(0,custId);
        List<Orders> ordersList=query.list();
        totalPage=(ordersList.size()-1)/pageSize+1;
        return totalPage;
    }

    @Override
    public List<Orders> allOrdersDao(int pageSize, int pageIndex, int custId) {
        Query query=getSession().createQuery("from Orders where customer.custId=? ");
        query.setParameter(0,custId);
        query.setFirstResult((pageIndex-1)*pageSize);
        query.setMaxResults(pageSize);
        List<Orders> ordersList=query.list();
        return ordersList;
    }

    /**
     * 删除订单
     * @param orders
     */
    @Override
    public void deleteOrdersDao(Orders orders) {
getSession().delete(orders);
    }

    @Override
    public List<Orderdetail> getOrderDetailDao(int ordersId) {
        Query query=getSession().createQuery("from  Orderdetail where orders.ordersId=?");
        query.setParameter(0,ordersId);
        List<Orderdetail> orderdetailList=query.list();
        return orderdetailList;
    }

    /**
     * 删除订单详情
     * @param orderdetail
     */
    @Override
    public void deleteOrderDateil(Orderdetail orderdetail) {
        getSession().delete(orderdetail);
    }

    /**
     * 查询支付方式
     * @return
     */
    @Override
    public List<Paytype> allPayTypeDao() {
        Query query=getSession().createQuery("from Paytype ");
        List<Paytype> paytypeList=query.list();
        return paytypeList;
    }

    /**
     * 添加订单
     * @param orders
     */
    @Override
    public void addOrderDao(Orders orders) {
        getSession().save(orders);
    }
    /**
     * 查询刚创建的订单
     * @param time
     * @return
     */
    @Override
    public Orders getOrders(String time) {
        Query query=getSession().createQuery("from Orders where ordersCreateTime=?");
        query.setParameter(0,time);
        Orders orders=(Orders)query.uniqueResult();
        return orders;
    }
    /**
     * 添加订单详情
     * @param orderdetail
     */
    @Override
    public void addOrderDetail(Orderdetail orderdetail) {
getSession().save(orderdetail);
    }
    /**
     * 为用户添加积分
     * @param custpoint
     */
    @Override
    public void addCustPoint(Custpoint custpoint) {
getSession().save(custpoint);
    }

    /**
     * 清空购物车
     * @param custId
     * @return
     */
    @Override
    public List<Car> deleteAllCarGoodsDao(int custId) {
        Query query=getSession().createQuery("from Car where customer.custId=?");
        query.setParameter(0,custId);
        List<Car> carList=query.list();
        return carList;
    }
}
