package com.flh.model.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable {
    private int commetId;
    private String commentContext;
    private String commentTime;
    private Goods goods;
    private Customer customer;

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getCommetId() {
        return commetId;
    }

    public void setCommetId(int commetId) {
        this.commetId = commetId;
    }

    public String getCommentContext() {
        return commentContext;
    }

    public void setCommentContext(String commentContext) {
        this.commentContext = commentContext;
    }

    public String  getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment = (Comment) o;

        if (commetId != comment.commetId) return false;
        if (commentContext != null ? !commentContext.equals(comment.commentContext) : comment.commentContext != null)
            return false;
        if (commentTime != null ? !commentTime.equals(comment.commentTime) : comment.commentTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = commetId;
        result = 31 * result + (commentContext != null ? commentContext.hashCode() : 0);
        result = 31 * result + (commentTime != null ? commentTime.hashCode() : 0);
        return result;
    }
}
