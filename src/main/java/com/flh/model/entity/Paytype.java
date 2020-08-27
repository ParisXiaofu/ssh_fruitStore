package com.flh.model.entity;

import java.io.Serializable;

public class Paytype implements Serializable {
    private int payTypeId;
    private String payTypeName;

    public int getPayTypeId() {
        return payTypeId;
    }

    public void setPayTypeId(int payTypeId) {
        this.payTypeId = payTypeId;
    }

    public String getPayTypeName() {
        return payTypeName;
    }

    public void setPayTypeName(String payTypeName) {
        this.payTypeName = payTypeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Paytype paytype = (Paytype) o;

        if (payTypeId != paytype.payTypeId) return false;
        if (payTypeName != null ? !payTypeName.equals(paytype.payTypeName) : paytype.payTypeName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = payTypeId;
        result = 31 * result + (payTypeName != null ? payTypeName.hashCode() : 0);
        return result;
    }
}
