package com.flh.model.dao;

import com.flh.model.entity.Address;

import java.util.List;

public interface AddressDao {
    /**
     * 查询所有地址数量
     * @param pageSize
     * @return
     */
    public int getAddressTotalPage(int pageSize,int custId);

    /**
     * 查询所有地址
     * @param pageIndex
     * @param pageSize
     */
    public List<Address> allAddress(int pageIndex, int pageSize,int custId);

    /**
     * 添加用户地址
     * @param address
     */
    public void addAddressDao(Address address);

    /**
     * 删除用户地址
     * @param address
     */
    public void deleteAddressDao(Address address);

    /**
     * 修改用户地址
     * @param address
     */
    public void updateAddressDao(Address address);

    /**
     * 根据地址Id,查询地址
     * @param addressId
     * @return
     */
    public Address getAddressDao(int addressId);
}
