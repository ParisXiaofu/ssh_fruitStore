package com.flh.model.service.impl;

import com.flh.model.dao.CustomerDao;
import com.flh.model.dao.impl.CustomerDaoImpl;
import com.flh.model.entity.Customer;
import com.flh.model.entity.Customerinfo;
import com.flh.model.entity.Custpoint;
import com.flh.model.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao =new CustomerDaoImpl();

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }
    /**
     * 用户登录
     * @param custId
     * @param custPwd
     * @return
     */
    @Override
    public Customer loginService(int custId, String custPwd) {
        return customerDao.loginDao(custId, custPwd);
    }

    /**
     * 用户注册
     * @param customer
     */
    @Override
    public void registerService(Customer customer) {
        customerDao.registerDao(customer);
    }

    @Override
    public Customer SelectIdService(String custTel) {
        return customerDao.selectId(custTel);
    }

    @Override
    public void registerInfoService(Customerinfo customerinfo) {
        customerDao.registerInfoDao(customerinfo);
    }

    /**
     * 用户详情查询
     * @param custId
     * @return
     */
    @Override
    public Customerinfo custInfoSelectService(int custId) {
        return customerDao.custInfoSelectDao(custId);
    }



    /**
     * 用户详情修改
     * @param customerinfo
     */
    @Override
    public void custInfoUpdateService(Customerinfo customerinfo) {
        customerDao.custInfoUpdateDao(customerinfo);
    }

    @Override
    public void custUpdateService(Customer customer) {
        customerDao.custUpdateDao(customer);
    }

    /**
     * 用户密码修改
     * @param customer
     */
    @Override
    public void custPwdUpdateService(Customer customer) {
        customerDao.custPwdUpdateDao(customer);
    }
    /**
     * 用户积分查询
     * @param custId
     */
    @Override
    public List<Custpoint> custPointSelectService(int custId) {
        return customerDao.custPointSelectDao(custId);
    }
    /**
     * 用户积分详情查询
     * @param custId
     * @return
     */
    @Override
    public List<Custpoint> custPointInfoService(int custId) {
        return customerDao.custPointInfoDao(custId);
    }
    /**
     * 用户积分消耗查询
     * @param custId
     * @return
     */
    @Override
    public List<Custpoint> custPointPayService(int custId) {
        return customerDao.custPointPay(custId);
    }
}
