package com.flh.model.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Component
public class Customer implements Serializable {
    private int custId;
    private String custName;
    private String custPwd;
    private String custTel;
    private Set<Car> carSet=new HashSet<>();

    public Set<Car> getCarSet() {
        return carSet;
    }

    public void setCarSet(Set<Car> carSet) {
        this.carSet = carSet;
    }

    public Customer(int custId, String custName, String custTel) {
        this.custId = custId;
        this.custName = custName;
        this.custTel = custTel;
    }

    public Customer() {
    }

    public Customer(String custName, String custPwd, String custTel) {
        this.custName = custName;
        this.custPwd = custPwd;
        this.custTel = custTel;
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustPwd() {
        return custPwd;
    }

    public void setCustPwd(String custPwd) {
        this.custPwd = custPwd;
    }

    public String getCustTel() {
        return custTel;
    }

    public void setCustTel(String custTel) {
        this.custTel = custTel;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Customer customer = (Customer) o;

        if (custId != customer.custId) return false;
        if (custName != null ? !custName.equals(customer.custName) : customer.custName != null) return false;
        if (custPwd != null ? !custPwd.equals(customer.custPwd) : customer.custPwd != null) return false;
        if (custTel != null ? !custTel.equals(customer.custTel) : customer.custTel != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = custId;
        result = 31 * result + (custName != null ? custName.hashCode() : 0);
        result = 31 * result + (custPwd != null ? custPwd.hashCode() : 0);
        result = 31 * result + (custTel != null ? custTel.hashCode() : 0);
        return result;
    }
}
