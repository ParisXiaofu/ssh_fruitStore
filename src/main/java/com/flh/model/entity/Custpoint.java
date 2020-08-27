package com.flh.model.entity;

import java.io.Serializable;

public class Custpoint implements Serializable {
    private int pointId;
    private int pointNum;
    private Customer customer;
    private Orders orders;
    private int point;

    public Custpoint() {
    }

    public Custpoint(int pointNum, Customer customer, Orders orders, Integer point) {
        this.pointNum = pointNum;
        this.customer = customer;
        this.orders = orders;
        this.point = point;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getPointId() {
        return pointId;
    }

    public void setPointId(int pointId) {
        this.pointId = pointId;
    }

    public int getPointNum() {
        return pointNum;
    }

    public void setPointNum(int pointNum) {
        this.pointNum = pointNum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Custpoint custpoint = (Custpoint) o;

        if (pointId != custpoint.pointId) return false;
        if (pointNum != custpoint.pointNum) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pointId;
        result = 31 * result + pointNum;
        return result;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }
}
