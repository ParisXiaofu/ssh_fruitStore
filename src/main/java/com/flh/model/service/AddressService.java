package com.flh.model.service;

import com.flh.model.entity.Address;

import java.util.List;

public interface AddressService {
    /**
     * 查询所有地址数量
     * @param pageSize
     * @return
     */
    public int getAddressTotalPageService(int pageSize,int custId);

    /**
     * 查询所有地址
     * @param pageIndex
     * @param pageSize
     */
    public List<Address> allAddressService(int pageIndex, int pageSize,int custId);
    /**
     * 添加用户地址
     * @param address
     */
    public void addAddressService(Address address);

    /**
     * 删除用户地址
     * @param address
     */
    public void deleteAddressService(Address address);

    /**
     * 修改用户地址
     * @param address
     */
    public void updateAddressService(Address address);

    /**
     * 根据地址Id，查询地址
     * @param addressId
     * @return
     */
    public Address getAddressService(int addressId);
}
