package com.flh.model.service;

import com.flh.model.entity.Customer;
import com.flh.model.entity.Customerinfo;
import com.flh.model.entity.Custpoint;

import java.util.List;

public interface CustomerService {
    /**
     * 用户登录
     * @param custId
     * @param custPwd
     * @return
     */
    public Customer loginService(int custId, String  custPwd);
    /**
     * 用户注册
     * @param customer
     * @return
     */
    public void registerService(Customer customer);
    public Customer SelectIdService(String custTel);
    public void registerInfoService(Customerinfo customerinfo);

    /**
     * 用户详情查询
     * @param custId
     * @return
     */
    public Customerinfo custInfoSelectService(int custId);

    /**
     * 用户详情修改
     * @param customerinfo
     * @return
     */
    public void custInfoUpdateService(Customerinfo customerinfo);
    public void custUpdateService(Customer customer);
    /**
     * 用户密码修改
     * @param customer
     * @return
     */
    public void custPwdUpdateService(Customer customer);
    /**
     * 用户积分查询
     * @param custId
     */
    public List<Custpoint> custPointSelectService(int custId);
    /**
     * 用户积分详情查询
     * @param custId
     * @return
     */
    public List<Custpoint> custPointInfoService(int custId);
    /**
     * 用户积分消耗查询
     * @param custId
     * @return
     */
    public List<Custpoint> custPointPayService(int custId);
}
