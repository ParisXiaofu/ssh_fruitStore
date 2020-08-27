package com.flh.model.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Orders implements Serializable {
    private int ordersId;
    private double ordersTotalPage;
    private String  ordersCreateTime;
    private Integer invoice;
    private String ordersMessage;
    private int pointget;
    private Customer customer;
    private Address address;
    private Paytype paytype;
    private Orderstatetype orderstatetype;
    private Set<Orderdetail> orderdetailSet=new HashSet<>();


    public Orders() {
    }

    public Set<Orderdetail> getOrderdetailSet() {
        return orderdetailSet;
    }

    public void setOrderdetailSet(Set<Orderdetail> orderdetailSet) {
        this.orderdetailSet = orderdetailSet;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Paytype getPaytype() {
        return paytype;
    }

    public void setPaytype(Paytype paytype) {
        this.paytype = paytype;
    }

    public Orderstatetype getOrderstatetype() {
        return orderstatetype;
    }

    public void setOrderstatetype(Orderstatetype orderstatetype) {
        this.orderstatetype = orderstatetype;
    }

    public int getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }

    public double getOrdersTotalPage() {
        return ordersTotalPage;
    }

    public void setOrdersTotalPage(double ordersTotalPage) {
        this.ordersTotalPage = ordersTotalPage;
    }

    public String getOrdersCreateTime() {
        return ordersCreateTime;
    }

    public void setOrdersCreateTime(String ordersCreateTime) {
        this.ordersCreateTime = ordersCreateTime;
    }

    public Integer getInvoice() {
        return invoice;
    }

    public void setInvoice(Integer invoice) {
        this.invoice = invoice;
    }



    public String getOrdersMessage() {
        return ordersMessage;
    }

    public void setOrdersMessage(String ordersMessage) {
        this.ordersMessage = ordersMessage;
    }

    public int getPointget() {
        return pointget;
    }

    public void setPointget(int pointget) {
        this.pointget = pointget;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orders orders = (Orders) o;

        if (ordersId != orders.ordersId) return false;
        if (Double.compare(orders.ordersTotalPage, ordersTotalPage) != 0) return false;
        if (pointget != orders.pointget) return false;
        if (ordersCreateTime != null ? !ordersCreateTime.equals(orders.ordersCreateTime) : orders.ordersCreateTime != null)
            return false;
        if (invoice != null ? !invoice.equals(orders.invoice) : orders.invoice != null) return false;
        if (ordersMessage != null ? !ordersMessage.equals(orders.ordersMessage) : orders.ordersMessage != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = ordersId;
        temp = Double.doubleToLongBits(ordersTotalPage);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (ordersCreateTime != null ? ordersCreateTime.hashCode() : 0);
        result = 31 * result + (invoice != null ? invoice.hashCode() : 0);
        result = 31 * result + (ordersMessage != null ? ordersMessage.hashCode() : 0);
        result = 31 * result + pointget;
        return result;
    }
}
