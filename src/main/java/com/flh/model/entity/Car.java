package com.flh.model.entity;

import java.io.Serializable;

public class Car implements Serializable {
    private int carId;
    private int goodsNum;
    private double totalPrice;
    private Customer customer;
    private Goods goods;

    public Car() {
    }

    public Car(int goodsNum, double totalPrice, Customer customer, Goods goods) {
        this.goodsNum = goodsNum;
        this.totalPrice = totalPrice;
        this.customer = customer;
        this.goods = goods;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Car car = (Car) o;

        if (carId != car.carId) return false;
        if (goodsNum != car.goodsNum) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = carId;
        result = 31 * result + goodsNum;
        return result;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
