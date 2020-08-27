package com.flh.model.entity;

import java.io.Serializable;

public class Orderdetail implements Serializable {
    private int orderdetailId;
    private int orderFruitNum;
    private double orderFruitMoney;
    private Goods goods;
    private Orders orders;

    public Orderdetail() {
    }

    public Orderdetail(int orderFruitNum, double orderFruitMoney, Goods goods, Orders orders) {
        this.orderFruitNum = orderFruitNum;
        this.orderFruitMoney = orderFruitMoney;
        this.goods = goods;
        this.orders = orders;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getOrderdetailId() {
        return orderdetailId;
    }

    public void setOrderdetailId(int orderdetailId) {
        this.orderdetailId = orderdetailId;
    }

    public int getOrderFruitNum() {
        return orderFruitNum;
    }

    public void setOrderFruitNum(int orderFruitNum) {
        this.orderFruitNum = orderFruitNum;
    }

    public double getOrderFruitMoney() {
        return orderFruitMoney;
    }

    public void setOrderFruitMoney(double orderFruitMoney) {
        this.orderFruitMoney = orderFruitMoney;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orderdetail that = (Orderdetail) o;

        if (orderdetailId != that.orderdetailId) return false;
        if (orderFruitNum != that.orderFruitNum) return false;
        if (Double.compare(that.orderFruitMoney, orderFruitMoney) != 0) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = orderdetailId;
        result = 31 * result + orderFruitNum;
        temp = Double.doubleToLongBits(orderFruitMoney);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
