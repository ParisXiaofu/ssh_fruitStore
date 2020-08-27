package com.flh.model.dao;

import com.flh.model.entity.Customer;
import com.flh.model.entity.Customerinfo;
import com.flh.model.entity.Custpoint;

import java.util.List;

public interface CustomerDao {
    /**
     * 用户登录
     * @param custId
     * @param custPwd
     * @return
     */
    public Customer loginDao(int custId,String custPwd);

    /**
     * 用户注册
     * @param customer
     * @return
     */
    public void registerDao(Customer customer);

    /**
     * 查询用户id
     * @param custTel
     * @return
     */
    public Customer selectId(String custTel);

    /**
     * 用户详情注册
     * @param customerinfo
     */
    public void registerInfoDao(Customerinfo customerinfo);
    /**
     * 用户详情查询
     * @param custId
     * @return
     */
    public Customerinfo custInfoSelectDao(int custId);


    /**
     * 用户详情修改
     * @param customerinfo
     * @return
     */
    public void custInfoUpdateDao(Customerinfo customerinfo);

    /**
     * 用户修改
     * @param customer
     */
    public void custUpdateDao(Customer customer);

    /**
     * 用户密码修改
     * @param customer
     * @return
     */
    public void custPwdUpdateDao(Customer customer);

    /**
     * 用户积分查询
     * @param custId
     */
    public List<Custpoint> custPointSelectDao(int custId);

    /**
     * 用户积分详情查询
      * @param custId
     * @return
     */
    public List<Custpoint> custPointInfoDao(int custId);

    /**
     * 用户积分消耗查询
     * @param custId
     * @return
     */
    public List<Custpoint> custPointPay(int custId);
}
