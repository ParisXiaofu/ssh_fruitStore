package com.flh.model.service;

import com.flh.model.entity.*;

import java.util.List;

public interface OrderService {
    /**
     * 分页查询订单
     * @param pageSize
     * @param custId
     * @return
     */
    public int totalPageOrdersService(int pageSize,int custId);
    public List<Orders> allOrdersService(int pageSize, int pageIndex, int custId);

    /**
     * 删除订单
     * @param orders
     */
    public void deleteOrdersService(Orders orders);
    public List<Orderdetail> getOrderDetailService(int ordersId);
    /**
     * 删除订单详情
     * @param orderdetail
     */
    public void deleteOrderDateilService(Orderdetail orderdetail);
    /**
     * 查询支付方式
     * @return
     */
    public List<Paytype> allPayTypeService();
    /**
     * 添加订单
     * @param orders
     */
    public void addOrderService(Orders orders);

    /**
     * 查询刚创建的订单
     * @param time
     * @return
     */
    public Orders getOrdersService(String  time);

    /**
     * 添加订单详情
     * @param orderdetail
     */
    public void addOrderDetailService(Orderdetail orderdetail);

    /**
     * 为用户添加积分
     * @param custpoint
     */
    public void addCustPointService(Custpoint custpoint);
    /**
     * 清空购物车
     */
    public List<Car> deleteAllCarGoodsService(int custId);
}
