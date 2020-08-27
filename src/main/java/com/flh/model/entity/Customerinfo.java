package com.flh.model.entity;

import java.io.Serializable;

public class Customerinfo implements Serializable {
    private int custInfoId;
    private String custPic;
    private String custTname;
    private String custSex;
    private String custEmail;
    private Customer customer;


    public Customerinfo() {
    }

    public Customerinfo(int custInfoId, String custPic, String custTname, String custSex, String custEmail, Customer customer) {
        this.custInfoId = custInfoId;
        this.custPic = custPic;
        this.custTname = custTname;
        this.custSex = custSex;
        this.custEmail = custEmail;
        this.customer = customer;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getCustInfoId() {
        return custInfoId;
    }

    public void setCustInfoId(int custInfoId) {
        this.custInfoId = custInfoId;
    }

    public String getCustPic() {
        return custPic;
    }

    public void setCustPic(String custPic) {
        this.custPic = custPic;
    }

    public String getCustTname() {
        return custTname;
    }

    public void setCustTname(String custTname) {
        this.custTname = custTname;
    }

    public String getCustSex() {
        return custSex;
    }

    public void setCustSex(String custSex) {
        this.custSex = custSex;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customerinfo that = (Customerinfo) o;

        if (custInfoId != that.custInfoId) return false;
        if (custPic != null ? !custPic.equals(that.custPic) : that.custPic != null) return false;
        if (custTname != null ? !custTname.equals(that.custTname) : that.custTname != null) return false;
        if (custSex != null ? !custSex.equals(that.custSex) : that.custSex != null) return false;
        if (custEmail != null ? !custEmail.equals(that.custEmail) : that.custEmail != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = custInfoId;
        result = 31 * result + (custPic != null ? custPic.hashCode() : 0);
        result = 31 * result + (custTname != null ? custTname.hashCode() : 0);
        result = 31 * result + (custSex != null ? custSex.hashCode() : 0);
        result = 31 * result + (custEmail != null ? custEmail.hashCode() : 0);
        return result;
    }
}
