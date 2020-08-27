package com.flh.controller.action;

import com.flh.model.entity.Customer;
import com.flh.model.entity.Customerinfo;
import com.flh.model.entity.Custpoint;
import com.flh.model.service.CustomerService;
import com.flh.model.service.impl.CustomerServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.List;


@Namespace("/")
@ParentPackage("struts-default")
@Controller
public class CustomerAction extends ActionSupport {
    @Autowired
    private CustomerService customerService=new CustomerServiceImpl();

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
    private int custId;
    private String custPwd;
    private String custTel;
    private String custName;
    private String custYzm;
    private String custUpPwd;
    private String custTname;
    private String  custEmail;
    private String custSex;
    private String custNames;
    private String file;
    /**
     * 登录
     * @return
     */
    @Action(value = "custLogin",results = {
        @Result(name = "ok",type = "redirect",location = "/index.jsp"),
            @Result(name = "no",location = "/Login.jsp")})
    public String loginAction() {
        Customer customer = customerService.loginService(custId, custPwd);
        if (customer!= null) {
            ActionContext.getContext().getSession().put("custPwd",custPwd);
            ActionContext.getContext().getSession().put("custId",custId);
            ActionContext.getContext().getSession().put("customer",customer);
            return "ok";
        }else {
            return "no";
        }
    }
    /**
     * 注册
     * @return
     */
    @Action(value = "custRegister",results ={
            @Result(name = "success",type = "redirect",location = "/index.jsp"),
                @Result(name = "error",location = "/registered.jsp")
    } )
    public String registerAction(){
        if (custYzm!=null){
        if (custYzm.equalsIgnoreCase(String.valueOf(ActionContext.getContext().getSession().get("yzm")))){
            Customer customer=new Customer(custName,custPwd,custTel);
            customerService.registerService(customer);
            Customer customer1=customerService.SelectIdService(custTel);
            Customerinfo customerinfo=new Customerinfo();
            customerinfo.setCustomer(customer1);
            customerService.registerInfoService(customerinfo);
            return "success";
        }
        else {
            return "error";
        }
        }
       else {
           return "error";
        }
    }
    /**
     * 修改密码
     * @return
     */
    @Action(value = "updatePwd",results = {
            @Result(name = "success",location = "/user_info.jsp"),
                @Result(name = "error",location = "/user_Password.jsp")})
    public String custPwdUpdate(){
        if (ActionContext.getContext().getSession().get("custPwd")!=null){
        if (custPwd.equals(String.valueOf(ActionContext.getContext().getSession().get("custPwd")))){
            Customer customer=new Customer();
            customer.setCustId((Integer) ActionContext.getContext().getSession().get("custId"));
            customer.setCustPwd(custUpPwd);
        customerService.custPwdUpdateService(customer);
        return "success";}
        else
        {
            return "error";
        }
        }else
    {
        return "error";
    }
}
    /**
     * 查询用户详细信息
     * @return
     */
    @Action(value = "custInfoSelect",results = {
            @Result(name = "success",type = "redirect",location = "/user_info.jsp"),
            @Result(name = "error",location = "/Login.jsp")})
    public String selectCustInfo(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
        Customerinfo customerinfo= customerService.custInfoSelectService((Integer) ActionContext.getContext().getSession().get("custId"));
        ActionContext.getContext().getSession().remove("customerInfo");
        ActionContext.getContext().getSession().put("customerInfo",customerinfo);
        return "success";}
        else {
            return "error";
        }
}

    /**
     * 进入会员中心用户详情查询
     * @return
     */
    @Action(value = "custInfoSelects",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","ordersIndex"}),
            @Result(name = "error",location = "/Login.jsp")})
    public String selectCustInfos(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            Customerinfo customerinfo= customerService.custInfoSelectService((Integer) ActionContext.getContext().getSession().get("custId"));
            ActionContext.getContext().getSession().put("customerInfo",customerinfo);
            return "success";}
        else {
            return "error";
        }
    }

    /**
     * 修改用户信息
     * @return
     */
    @Action(value = "updateCustInfo",results = {
        @Result(name = "success",type = "redirectAction",params = {"actionName","custInfoSelect"}),
    @Result(name = "error",location = "/user_info.jsp")
})
public String updateCustInfo() {
        if (ActionContext.getContext().getSession().get("custId")!=null){
            Customer customer=new Customer();
            customer.setCustId((Integer) ActionContext.getContext().getSession().get("custId"));
            Customerinfo customerinfo1=(Customerinfo)ActionContext.getContext().getSession().get("customerInfo");
            Customerinfo customerinfo=new Customerinfo(customerinfo1.getCustInfoId(),file,custTname,custSex,custEmail,customer);
            customerService.custInfoUpdateService(customerinfo);
            customer.setCustName(custNames);
            customer.setCustTel(custTel);
            customerService.custUpdateService(customer);
            ActionContext.getContext().getSession().remove("customer");
            ActionContext.getContext().getSession().put("customer",customer);
            return "success";
        }
        else {
            return "error";
        }
}

    /**
     * 退出登录
     * @return
     */
    @Action(value = "loginOut",results ={@Result(name = "success",location = "/user.jsp")} )
public String LoginOut(){
        ActionContext.getContext().getSession().remove("customer");
        ActionContext.getContext().getSession().remove("customerInfo");
        ActionContext.getContext().getSession().remove("custId");
        ActionContext.getContext().getSession().remove("custPwd");
        ActionContext.getContext().getSession().remove("address");
    ActionContext.getContext().getSession().remove("totalPage");
    ActionContext.getContext().getSession().remove("pageIndex");
    ActionContext.getContext().getSession().remove("addressList");
    ActionContext.getContext().getSession().remove("custpointList");
        String msg="";
        return "success";
}

    /**
     * 用户总积分查询
     * @return
     */
    @Action(value = "custPoint",results = {
        @Result(name = "success",type = "redirectAction",params = {"actionName","custPointPay"}),
        @Result(name = "error",location = "/Login.jsp")})
public String  custPoint(){
    if (ActionContext.getContext().getSession().get("custId")!=null){
        List<Custpoint> custpointList=customerService.custPointSelectService((Integer) ActionContext.getContext().getSession().get("custId"));
        ActionContext.getContext().getSession().put("custpointList",custpointList);
        return "success";
    }
    else {
        return "error";
    }}

    /**
     * 用户积分详情查询
     * @return
     */
    @Action(value = "custPointInfo",results = {
            @Result(name = "success",type = "redirect",location = "/user_integral.jsp")
            })
    public String  custPointInfo(){
            List<Custpoint> custpointList=customerService.custPointInfoService((Integer) ActionContext.getContext().getSession().get("custId"));
            ActionContext.getContext().getSession().put("custpointList1",custpointList);
            return "success";
        }

    /**
     * 用户积分消耗查询
     * @return
     */
    @Action(value = "custPointPay",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","custPointInfo"}),
           })
        public String custPointPay(){
        List<Custpoint> custpointList=customerService.custPointPayService((Integer) ActionContext.getContext().getSession().get("custId"));
        ActionContext.getContext().getSession().put("custpointListPay",custpointList);
        return "success";
        }
    /**
     * 用户首页积分查询
     * @return
     */
        @Action(value = "custPoints",results = {
                @Result(name = "success",type = "redirectAction",params = {"actionName","custPointPays"}),
                @Result(name = "error",location = "/Login.jsp")})
        public String  custPoints(){
            if (ActionContext.getContext().getSession().get("custId")!=null){
                List<Custpoint> custpointList=customerService.custPointSelectService((Integer) ActionContext.getContext().getSession().get("custId"));
                ActionContext.getContext().getSession().put("custpointList",custpointList);
                return "success";
            }
            else {
                return "error";
            }
}
    /**
     * 用户积分消耗查询
     * @return
     */
    @Action(value = "custPointPays",results = {
            @Result(name = "success",type = "redirect",location = "/user.jsp"),
    })
    public String custPointPayIndex(){
        List<Custpoint> custpointList=customerService.custPointPayService((Integer) ActionContext.getContext().getSession().get("custId"));
        ActionContext.getContext().getSession().put("custpointListPay",custpointList);
        return "success";
    }
    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
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

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustYzm() {
        return custYzm;
    }

    public void setCustYzm(String custYzm) {
        this.custYzm = custYzm;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }
    public String getCustUpPwd() {
        return custUpPwd;
    }

    public void setCustUpPwd(String custUpPwd) {
        this.custUpPwd = custUpPwd;
    }

    public String getCustTname() {
        return custTname;
    }

    public void setCustTname(String custTname) {
        this.custTname = custTname;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getCustSex() {
        return custSex;
    }

    public void setCustSex(String custSex) {
        this.custSex = custSex;
    }

    public String getCustNames() {
        return custNames;
    }

    public void setCustNames(String custNames) {
        this.custNames = custNames;
    }
}
