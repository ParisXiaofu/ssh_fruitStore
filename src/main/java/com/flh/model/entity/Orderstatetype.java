package com.flh.model.entity;

import java.io.Serializable;

public class Orderstatetype implements Serializable {
    private int orderStateTypeId;
    private String orderStateTypeName;

    public int getOrderStateTypeId() {
        return orderStateTypeId;
    }

    public void setOrderStateTypeId(int orderStateTypeId) {
        this.orderStateTypeId = orderStateTypeId;
    }

    public String getOrderStateTypeName() {
        return orderStateTypeName;
    }

    public void setOrderStateTypeName(String orderStateTypeName) {
        this.orderStateTypeName = orderStateTypeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orderstatetype that = (Orderstatetype) o;

        if (orderStateTypeId != that.orderStateTypeId) return false;
        if (orderStateTypeName != null ? !orderStateTypeName.equals(that.orderStateTypeName) : that.orderStateTypeName != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = orderStateTypeId;
        result = 31 * result + (orderStateTypeName != null ? orderStateTypeName.hashCode() : 0);
        return result;
    }
}
