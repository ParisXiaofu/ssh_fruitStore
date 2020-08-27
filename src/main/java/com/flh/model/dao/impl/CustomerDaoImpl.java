package com.flh.model.dao.impl;

import com.flh.model.dao.CustomerDao;
import com.flh.model.entity.Customer;
import com.flh.model.entity.Customerinfo;
import com.flh.model.entity.Custpoint;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
public Session getSession(){
        return sessionFactory.getCurrentSession();
}

    /**
     * 用户登录
     * @param custId
     * @param custPwd
     * @return
     */
    @Override
    public Customer loginDao(int custId,String custPwd) {
        Query query=getSession().createQuery("from Customer  where custId=? and custPwd=?");
        query.setParameter(0,custId);
        query.setParameter(1,custPwd);
        Customer customer=(Customer) query.uniqueResult();
        return customer;
    }

    /**
     * 用户注册
     * @param customer
     */
    @Override
    public void registerDao(Customer customer) {
        getSession().save(customer);

    }

    /**
     * 查询用户id
     * @param custTel
     * @return
     */
    @Override
    public Customer selectId(String custTel) {
        Query query=getSession().createQuery("from Customer  where custTel=?");
        query.setParameter(0,custTel);
        Customer customer=(Customer) query.uniqueResult();
        return customer;
    }

    /**
     * 用户详情注册
     * @param customerinfo
     */
    @Override
    public void registerInfoDao(Customerinfo customerinfo) {
        getSession().save(customerinfo);
    }

    /**
     *用户详情查询
     * @param custId
     * @return
     */
    @Override
    public Customerinfo custInfoSelectDao(int custId) {
        Query query=getSession().createQuery("from Customerinfo where customer.custId=?");
        query.setParameter(0,custId);
        Customerinfo customerinfo=(Customerinfo) query.uniqueResult();
        return customerinfo;
    }


    /**
     * 用户详情修改
     * @param customerinfo
     * @return
     */
    @Override
    public void custInfoUpdateDao(Customerinfo customerinfo) {
        String hql="update Customerinfo set custPic=?,custTname=?,custSex=?,custEmail=? where customer.custId=?";
        Query query=getSession().createQuery(hql);
        query.setParameter(0,customerinfo.getCustPic());
        query.setParameter(1,customerinfo.getCustTname());
        query.setParameter(2,customerinfo.getCustSex());
        query.setParameter(3,customerinfo.getCustEmail());
        query.setParameter(4,customerinfo.getCustomer().getCustId());
        query.executeUpdate();
    }

    /**
     * 用户修改
     * @param customer
     */
    @Override
    public void custUpdateDao(Customer customer) {
        Query query=getSession().createQuery("update Customer set custName=?,custTel=? where custId=?");
        query.setParameter(0,customer.getCustName());
        query.setParameter(1,customer.getCustTel());
        query.setParameter(2,customer.getCustId());
        query.executeUpdate();
    }

    /**
     * 用户密码修改
     * @param customer
     * @return
     */
    @Override
    public void custPwdUpdateDao(Customer customer) {
        String hql="update Customer set custPwd=? where custId=?";
        Query query=getSession().createQuery(hql);
        query.setParameter(0,customer.getCustPwd());
        query.setParameter(1,customer.getCustId());
        query.executeUpdate();
    }
    /**
     * 用户积分查询
     * @param custId
     */
    @Override
    public List<Custpoint> custPointSelectDao(int custId) {
        Query query=getSession().createQuery("SELECT  sum(pointNum)from Custpoint WHERE customer.custId=?and point=1");
        query.setParameter(0,custId);
        List<Custpoint> custpointList=query.list();

        return custpointList;
    }
    /**
     * 用户积分详情查询
     * @param custId
     * @return
     */
    @Override
    public List<Custpoint> custPointInfoDao(int custId) {
        Query query=getSession().createQuery("from Custpoint WHERE customer.custId=?and point=1");
        query.setParameter(0,custId);
        List<Custpoint> custpointList=query.list();
        return custpointList;
    }
    /**
     * 用户积分消耗查询
     * @param custId
     * @return
     */
    @Override
    public List<Custpoint> custPointPay(int custId) {
        Query query=getSession().createQuery("SELECT  sum(pointNum)from Custpoint WHERE customer.custId=?and point=0");
        query.setParameter(0,custId);
        List<Custpoint> custpointList=query.list();
        return custpointList;
    }
}
