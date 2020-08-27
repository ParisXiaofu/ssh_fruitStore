package com.flh.model.entity;

import java.io.Serializable;

public class Goodstype implements Serializable {
    private int goodsTypeId;
    private String typeName;

    public int getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(int goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Goodstype goodstype = (Goodstype) o;

        if (goodsTypeId != goodstype.goodsTypeId) return false;
        if (typeName != null ? !typeName.equals(goodstype.typeName) : goodstype.typeName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = goodsTypeId;
        result = 31 * result + (typeName != null ? typeName.hashCode() : 0);
        return result;
    }
}
