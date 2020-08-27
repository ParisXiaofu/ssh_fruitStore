package com.flh.model.entity;

import java.io.Serializable;

public class Address implements Serializable {
    private int addressId;
    private String addressRecName;
    private String addressArea;
    private String addressCity;
    private int addressEmail;
    private String addressTel;
    private String addressPhone;
    private Customer customer;

    public Address() {
    }

    public Address(int addressId, String addressRecName, String addressArea, String addressCity, int addressEmail, String addressTel, String addressPhone) {
        this.addressId = addressId;
        this.addressRecName = addressRecName;
        this.addressArea = addressArea;
        this.addressCity = addressCity;
        this.addressEmail = addressEmail;
        this.addressTel = addressTel;
        this.addressPhone = addressPhone;
    }

    public Address(String addressRecName, String addressArea, String addressCity, int addressEmail, String addressTel, String addressPhone, Customer customer) {
        this.addressRecName = addressRecName;
        this.addressArea = addressArea;
        this.addressCity = addressCity;
        this.addressEmail = addressEmail;
        this.addressTel = addressTel;
        this.addressPhone = addressPhone;
        this.customer = customer;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getAddressRecName() {
        return addressRecName;
    }

    public void setAddressRecName(String addressRecName) {
        this.addressRecName = addressRecName;
    }

    public String getAddressArea() {
        return addressArea;
    }

    public void setAddressArea(String addressArea) {
        this.addressArea = addressArea;
    }

    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }

    public int getAddressEmail() {
        return addressEmail;
    }

    public void setAddressEmail(int addressEmail) {
        this.addressEmail = addressEmail;
    }

    public String getAddressTel() {
        return addressTel;
    }

    public void setAddressTel(String addressTel) {
        this.addressTel = addressTel;
    }

    public String getAddressPhone() {
        return addressPhone;
    }

    public void setAddressPhone(String addressPhone) {
        this.addressPhone = addressPhone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Address address = (Address) o;

        if (addressId != address.addressId) return false;
        if (addressEmail != address.addressEmail) return false;
        if (addressRecName != null ? !addressRecName.equals(address.addressRecName) : address.addressRecName != null)
            return false;
        if (addressArea != null ? !addressArea.equals(address.addressArea) : address.addressArea != null) return false;
        if (addressCity != null ? !addressCity.equals(address.addressCity) : address.addressCity != null) return false;
        if (addressTel != null ? !addressTel.equals(address.addressTel) : address.addressTel != null) return false;
        if (addressPhone != null ? !addressPhone.equals(address.addressPhone) : address.addressPhone != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = addressId;
        result = 31 * result + (addressRecName != null ? addressRecName.hashCode() : 0);
        result = 31 * result + (addressArea != null ? addressArea.hashCode() : 0);
        result = 31 * result + (addressCity != null ? addressCity.hashCode() : 0);
        result = 31 * result + addressEmail;
        result = 31 * result + (addressTel != null ? addressTel.hashCode() : 0);
        result = 31 * result + (addressPhone != null ? addressPhone.hashCode() : 0);
        return result;
    }
}
