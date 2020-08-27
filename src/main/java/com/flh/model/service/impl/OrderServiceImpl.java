package com.flh.model.service.impl;

import com.flh.model.dao.OrderDao;
import com.flh.model.dao.impl.OrderDaoImpl;
import com.flh.model.entity.*;
import com.flh.model.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao=new OrderDaoImpl();

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    /**
     * 分页查询订单
     * @param pageSize
     * @param custId
     * @return
     */
    @Override
    public int totalPageOrdersService(int pageSize, int custId) {
        return orderDao.totalPageOrdersDao(pageSize,custId);
    }

    @Override
    public List<Orders> allOrdersService(int pageSize, int pageIndex, int custId) {
        return orderDao.allOrdersDao(pageSize,pageIndex,custId);
    }

    /**
     * 删除订单
     * @param orders
     */
    @Override
    public void deleteOrdersService(Orders orders) {
orderDao.deleteOrdersDao(orders);
    }

    @Override
    public List<Orderdetail> getOrderDetailService(int ordersId) {
        return orderDao.getOrderDetailDao(ordersId);
    }

    /**
     * 删除订单详情
     * @param orderdetail
     */
    @Override
    public void deleteOrderDateilService(Orderdetail orderdetail) {
        orderDao.deleteOrderDateil(orderdetail);
    }

    /**
     * 查询支付方式
     * @return
     */
    @Override
    public List<Paytype> allPayTypeService() {
        return orderDao.allPayTypeDao();
    }
    /**
     * 添加订单
     * @param orders
     */
    @Override
    public void addOrderService(Orders orders) {
        orderDao.addOrderDao(orders);
    }
    /**
     * 查询刚创建的订单
     * @param time
     * @return
     */
    @Override
    public Orders getOrdersService(String time) {
        return orderDao.getOrders(time);
    }
    /**
     * 添加订单详情
     * @param orderdetail
     */
    @Override
    public void addOrderDetailService(Orderdetail orderdetail) {
orderDao.addOrderDetail(orderdetail);
    }
    /**
     * 为用户添加积分
     * @param custpoint
     */
    @Override
    public void addCustPointService(Custpoint custpoint) {
orderDao.addCustPoint(custpoint);
    }
    /**
     * 清空购物车
     */

    @Override
    public List<Car> deleteAllCarGoodsService(int custId) {
        return orderDao.deleteAllCarGoodsDao(custId);
    }
}
