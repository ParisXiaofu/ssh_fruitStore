package com.flh.model.entity;

import java.io.Serializable;

public class Collection implements Serializable {
    private int collectionId;
    private Customer customer;
    private Goods goods;

    public Collection() {
    }

    public Collection(Customer customer, Goods goods) {
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
    public int getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(int collectionId) {
        this.collectionId = collectionId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Collection that = (Collection) o;

        if (collectionId != that.collectionId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return collectionId;
    }
}
