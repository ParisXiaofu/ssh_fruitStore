package com.flh.model.dao;

import com.flh.model.entity.*;

import java.util.List;

public interface OrderDao {
    /**
     * 分页查询订单
     * @param pageSize
     * @param custId
     * @return
     */
    public int totalPageOrdersDao(int pageSize,int custId);
public List<Orders> allOrdersDao(int pageSize,int pageIndex,int custId);

    /**
     * 删除订单
     * @param orders
     */
    public void deleteOrdersDao(Orders orders);
public List<Orderdetail> getOrderDetailDao(int ordersId);
    /**
     * 删除订单详情
     * @param orderdetail
     */
    public void deleteOrderDateil(Orderdetail orderdetail);

    /**
     * 查询支付方式
     * @return
     */
    public List<Paytype> allPayTypeDao();

    /**
     * 添加订单
     * @param orders
     */
    public void addOrderDao(Orders orders);

    /**
     * 查询刚创建的订单
     * @param time
     * @return
     */
    public Orders getOrders(String  time);

    /**
     * 添加订单详情
     * @param orderdetail
     */
    public void addOrderDetail(Orderdetail orderdetail);

    /**
     * 为用户添加积分
     * @param custpoint
     */
    public void addCustPoint(Custpoint custpoint);
    /**
     * 清空购物车
     */
    public List<Car> deleteAllCarGoodsDao(int custId);
}
