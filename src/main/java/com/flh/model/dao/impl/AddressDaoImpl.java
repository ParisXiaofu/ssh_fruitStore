package com.flh.model.dao.impl;

import com.flh.model.dao.AddressDao;
import com.flh.model.entity.Address;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AddressDaoImpl implements AddressDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }

    /**
     * 查询所有地址数量
     * @param pageSize
     * @return
     */
    @Override
    public int getAddressTotalPage(int pageSize,int custId) {
        int totalPage=0;
        Query query=getSession().createQuery("from Address where customer.custId=?");
        query.setParameter(0,custId);
        List<Address> addressList=query.list();
        totalPage=(addressList.size()-1)/pageSize+1;
        return totalPage;
    }

    /**
     * 查询所有地址
     * @param pageIndex
     * @param pageSize
     */
    @Override
    public List<Address> allAddress(int pageIndex, int pageSize,int custId) {
    Query query=getSession().createQuery("from Address where customer.custId=? ");
    query.setParameter(0,custId);
    query.setFirstResult((pageIndex-1)*pageSize);
    query.setMaxResults(pageSize);
    List<Address> addressList=query.list();
    return addressList;
    }
    /**
     * 添加用户地址
     * @param address
     */
    @Override
    public void addAddressDao(Address address) {
    getSession().save(address);
    }


    /**
     * 删除用户地址
     * @param address
     */
    @Override
    public void deleteAddressDao(Address address) {
        getSession().delete(address);
    }

    /**
     * 修改用户地址
     * @param address
     */
    @Override
    public void updateAddressDao(Address address) {
        String hql="update Address set addressRecName=?,addressArea=?,addressCity=?,addressEmail=?,addressPhone=?,addressTel=? where addressId=?";
        Query query=getSession().createQuery(hql);
        query.setParameter(0,address.getAddressRecName());
        query.setParameter(1,address.getAddressArea());
        query.setParameter(2,address.getAddressCity());
        query.setParameter(3,address.getAddressEmail());
        query.setParameter(4,address.getAddressPhone());
        query.setParameter(5,address.getAddressTel());
        query.setParameter(6,address.getAddressId());
        query.executeUpdate();
    }

    /**
     * 根据地址Id，查询地址
     * @param addressId
     * @return
     */
    @Override
    public Address getAddressDao(int addressId) {
        Query query=getSession().createQuery("from Address where addressId=?");
        query.setParameter(0,addressId);
        Address address=(Address) query.uniqueResult();
        return address;
    }
}
