package com.flh.model.service.impl;

import com.flh.model.dao.AddressDao;
import com.flh.model.dao.impl.AddressDaoImpl;
import com.flh.model.entity.Address;
import com.flh.model.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressDao addressDao=new AddressDaoImpl();

    public void setAddressService(AddressDao addressDao) {
        this.addressDao = addressDao;
    }
    /**
     * 查询所有地址数量
     * @param pageSize
     * @return
     */
    @Override
    public int getAddressTotalPageService(int pageSize,int custId) {
        return addressDao.getAddressTotalPage(pageSize,custId);
    }
    /**
     * 查询所有地址
     * @param pageIndex
     * @param pageSize
     */
    @Override
    public List<Address> allAddressService(int pageIndex, int pageSize,int custId) {
        return addressDao.allAddress(pageIndex,pageSize,custId);
    }

    /**
     * 用户地址添加
     * @param address
     */
    @Override
    public void addAddressService(Address address) {
addressDao.addAddressDao(address);
    }

    /**
     * 用户地址删除
     * @param address
     */
    @Override
    public void deleteAddressService(Address address) {
addressDao.deleteAddressDao(address);
    }

    /**
     * 用户地址修改
     * @param address
     */
    @Override
    public void updateAddressService(Address address) {
addressDao.updateAddressDao(address);
    }

    /**
     * 根据地址Id，查询地址
     * @param addressId
     * @return
     */
    @Override
    public Address getAddressService(int addressId) {
        return addressDao.getAddressDao(addressId);
    }
}
