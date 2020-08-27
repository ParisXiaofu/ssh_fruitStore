package com.flh.controller.action;

import com.flh.model.entity.Address;
import com.flh.model.entity.Customer;
import com.flh.model.service.AddressService;
import com.flh.model.service.impl.AddressServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("struts-default")
public class AddressAction {
    @Autowired
    private AddressService addressService=new AddressServiceImpl();

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    private int pageIndex;
    private int pageSize=3;
    private int pageIndexOrder;
    private int custId;
    private int addressId;
    private String addressRecName;
    private String addressArea;
    private String addressCity;
    private int addressEmail;
    private String addressPhone;
    private String addressTel;
    private String buttom;
    /**
     * 地址查询
     * @return
     */
    @Action(value = "allAddress",results = {
            @Result(name = "success",type = "redirect",location = "/user_address.jsp"),
                @Result(name = "error",location = "/user.jsp")
    })
    public  String allAddress() {
        if (ActionContext.getContext().getSession().get("custId") == null) {
            return "error";
        } else {
            custId = (int) ActionContext.getContext().getSession().get("custId");
            int totalPage = addressService.getAddressTotalPageService(pageSize, custId);
            if (pageIndex < 1) {
                pageIndex = 1;
            }
            if (pageIndex > totalPage) {
                pageIndex = totalPage;
            }
            List<Address> addressList = addressService.allAddressService(pageIndex, pageSize, custId);
            ActionContext.getContext().getSession().put("totalPage", totalPage);
            ActionContext.getContext().getSession().put("pageIndex", pageIndex);
            ActionContext.getContext().getSession().put("addressList", addressList);
            return "success";
        }
    }

    /**
     * 订单里的地址查询
     * @return
     */
        @Action(value = "allAddressOrder",results = {
                @Result(name = "success",type = "redirect",location = "/Orders.jsp"),
                @Result(name = "error",location = "/user.jsp")
        })
        public  String allAddressOrder(){
            if (ActionContext.getContext().getSession().get("custId")==null){
                return "error";
            }else{
                custId=(int) ActionContext.getContext().getSession().get("custId");
                int totalPage=addressService.getAddressTotalPageService(pageSize,custId);
                if (pageIndexOrder<1){
                    pageIndexOrder=1;
                }
                if (pageIndexOrder>totalPage){
                    pageIndexOrder=totalPage;
                }
                List<Address> addressList=addressService.allAddressService(pageIndexOrder,pageSize,custId);
                ActionContext.getContext().getSession().put("totalPageOrder",totalPage);
                ActionContext.getContext().getSession().put("pageIndexOrder",pageIndexOrder);
                ActionContext.getContext().getSession().put("addressList",addressList);
                return "success";}
    }

    /**
     * 地址删除
     * @return
     */
    @Action(value = "deleteAddress",results = {@Result(name = "success",type = "redirectAction",params={"actionName" ,"allAddress"})})
    public  String deleteAddress(){
        Address address=new Address();
        address.setAddressId(addressId);
        addressService.deleteAddressService(address);
        return "success";
    }

    /**
     * 订单里的地址删除
     * @return
     */
    @Action(value = "deletesAddress",results = {@Result(name = "success",type = "redirectAction",params={"actionName" ,"allAddressOrder"})})
    public  String deletesAddress(){
        Address address=new Address();
        address.setAddressId(addressId);
        addressService.deleteAddressService(address);
        return "success";
    }
    /**
     * 地址添加
     * @return
     */
    @Action(value = "addAddress",results = {
            @Result(name = "success",type = "redirectAction",params={"actionName" ,"allAddress"}),
                @Result(name = "error",location = "/user_address.jsp")
    })
    public String addAddress(){
        if (ActionContext.getContext().getSession().get("custId")==null){
            return "error";
        }else{
            if (buttom.equals("确认添加")){
            Customer customer=new Customer();
            customer.setCustId((int) ActionContext.getContext().getSession().get("custId"));
            Address address=new Address(addressRecName,addressArea,addressCity,addressEmail,addressTel,addressPhone,customer);
            addressService.addAddressService(address);
            return "success";
            }else{
                return "error";
            }
        }
    }

    /**
     * 查询地址
     * @return
     */
    @Action(value = "getAddress",results = {@Result(name = "success",location = "/user_address.jsp")})
    public String getAddress(){
        Address address=addressService.getAddressService(addressId);
        ActionContext.getContext().getSession().remove("addressId");
        ActionContext.getContext().getSession().remove("address");
        ActionContext.getContext().getSession().put("addressId",addressId);
        ActionContext.getContext().getSession().put("address",address);
        return "success";
    }

    /**
     * 订单里的地址查询
     * @return
     */
    @Action(value = "getAddressOrder",results = {@Result(name = "success",type = "redirectAction",params={"actionName" ,"allAddressOrder"})})
    public String getAddressorder(){
        Address address=addressService.getAddressService(addressId);
        ActionContext.getContext().getSession().remove("addressOrder");
        ActionContext.getContext().getSession().put("addressOrder",address);
        return "success";
    }
    /**
     * 修改地址
     * @return
     */
    @Action(value = "updateAddress",results = {
            @Result(name = "success",type = "redirectAction",params={"actionName" ,"allAddress"}),
            @Result(name = "error",location = "/user_address.jsp")
    })
public String update(){
        if (buttom.equals("确认修改")){
            int addressId=(int)ActionContext.getContext().getSession().get("addressId");
            Address address=new Address(addressId,addressRecName,addressArea,addressCity,addressEmail,addressTel,addressPhone);
            addressService.updateAddressService(address);
            ActionContext.getContext().getSession().remove("address");
            return "success";
        }else{
            return "error";
        }
}

    public int getPageIndexOrder() {
        return pageIndexOrder;
    }

    public void setPageIndexOrder(int pageIndexOrder) {
        this.pageIndexOrder = pageIndexOrder;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
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

    public String getAddressPhone() {
        return addressPhone;
    }

    public void setAddressPhone(String addressPhone) {
        this.addressPhone = addressPhone;
    }

    public String getAddressTel() {
        return addressTel;
    }

    public void setAddressTel(String addressTel) {
        this.addressTel = addressTel;
    }

    public String getButtom() {
        return buttom;
    }

    public void setButtom(String buttom) {
        this.buttom = buttom;
    }

}
