package com.flh.model.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Goods  implements Serializable {
    private int goodsId;
    private String goodsName;
    private double goodsPrice;
    private String goodsInfo;
    private String goodsPic;
    private Integer teamBuy;
    private Double teamBuyPrice;
    private Timestamp beginTime;
    private Timestamp endTime;
    private Integer pointBuy;
    private Integer pointBuyPrice;
    private Set<Comment> commentSet=new HashSet<>();
    private Goodstype goodstype;
    private Timestamp goodsCreateTime;
    private int goodsSales;
    private Integer goodsInventory;

    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

    public Goodstype getGoodstype() {
        return goodstype;
    }

    public void setGoodstype(Goodstype goodstype) {
        this.goodstype = goodstype;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getGoodsInfo() {
        return goodsInfo;
    }

    public void setGoodsInfo(String goodsInfo) {
        this.goodsInfo = goodsInfo;
    }

    public String getGoodsPic() {
        return goodsPic;
    }

    public void setGoodsPic(String goodsPic) {
        this.goodsPic = goodsPic;
    }

    public Integer getTeamBuy() {
        return teamBuy;
    }

    public void setTeamBuy(Integer teamBuy) {
        this.teamBuy = teamBuy;
    }

    public Double getTeamBuyPrice() {
        return teamBuyPrice;
    }

    public void setTeamBuyPrice(Double teamBuyPrice) {
        this.teamBuyPrice = teamBuyPrice;
    }

    public Timestamp getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Timestamp beginTime) {
        this.beginTime = beginTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Integer getPointBuy() {
        return pointBuy;
    }

    public void setPointBuy(Integer pointBuy) {
        this.pointBuy = pointBuy;
    }

    public Integer getPointBuyPrice() {
        return pointBuyPrice;
    }

    public void setPointBuyPrice(Integer pointBuyPrice) {
        this.pointBuyPrice = pointBuyPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Goods goods = (Goods) o;

        if (goodsId != goods.goodsId) return false;
        if (Double.compare(goods.goodsPrice, goodsPrice) != 0) return false;
        if (goodsName != null ? !goodsName.equals(goods.goodsName) : goods.goodsName != null) return false;
        if (goodsInfo != null ? !goodsInfo.equals(goods.goodsInfo) : goods.goodsInfo != null) return false;
        if (goodsPic != null ? !goodsPic.equals(goods.goodsPic) : goods.goodsPic != null) return false;
        if (teamBuy != null ? !teamBuy.equals(goods.teamBuy) : goods.teamBuy != null) return false;
        if (teamBuyPrice != null ? !teamBuyPrice.equals(goods.teamBuyPrice) : goods.teamBuyPrice != null) return false;
        if (beginTime != null ? !beginTime.equals(goods.beginTime) : goods.beginTime != null) return false;
        if (endTime != null ? !endTime.equals(goods.endTime) : goods.endTime != null) return false;
        if (pointBuy != null ? !pointBuy.equals(goods.pointBuy) : goods.pointBuy != null) return false;
        if (pointBuyPrice != null ? !pointBuyPrice.equals(goods.pointBuyPrice) : goods.pointBuyPrice != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = goodsId;
        result = 31 * result + (goodsName != null ? goodsName.hashCode() : 0);
        temp = Double.doubleToLongBits(goodsPrice);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (goodsInfo != null ? goodsInfo.hashCode() : 0);
        result = 31 * result + (goodsPic != null ? goodsPic.hashCode() : 0);
        result = 31 * result + (teamBuy != null ? teamBuy.hashCode() : 0);
        result = 31 * result + (teamBuyPrice != null ? teamBuyPrice.hashCode() : 0);
        result = 31 * result + (beginTime != null ? beginTime.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        result = 31 * result + (pointBuy != null ? pointBuy.hashCode() : 0);
        result = 31 * result + (pointBuyPrice != null ? pointBuyPrice.hashCode() : 0);
        return result;
    }

    public Timestamp getGoodsCreateTime() {
        return goodsCreateTime;
    }

    public void setGoodsCreateTime(Timestamp goodsCreateTime) {
        this.goodsCreateTime = goodsCreateTime;
    }

    public int getGoodsSales() {
        return goodsSales;
    }

    public void setGoodsSales(int goodsSales) {
        this.goodsSales = goodsSales;
    }

    public Integer getGoodsInventory() {
        return goodsInventory;
    }

    public void setGoodsInventory(Integer goodsInventory) {
        this.goodsInventory = goodsInventory;
    }
}
