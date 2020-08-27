package com.flh.controller.action;

import com.flh.model.entity.*;
import com.flh.model.service.CarService;
import com.flh.model.service.OrderService;
import com.flh.model.service.impl.CarServiceImpl;
import com.flh.model.service.impl.OrderServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("json-default")
public class OrdersAction {
    @Autowired
    private OrderService orderService=new OrderServiceImpl();
@Autowired
private CarService carService=new CarServiceImpl();
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setCarService(CarService carService) {
        this.carService = carService;
    }

    private int ordersId;
    private int pageSize=2;
    private int pageIndexOrder;
    private int payTypeId;
    private int invoice;
    private int orderStateTypeId=1;
    private double ordersTotalPage;
    private String ordersMessage;
    private int pointGet= (int) ordersTotalPage;

    /**
     * 查询订单
     * @return
     */
    @Action(value = "ordersIndex",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","custPoints"}),
            @Result(name = "error",location = "/Login.jsp")})
    public String allOrders(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custId=(int) ActionContext.getContext().getSession().get("custId");
            int totalPage=orderService.totalPageOrdersService(pageSize,custId);
            List totalPageList=new ArrayList();
            for (int i=1;i<=totalPage;i++){
                totalPageList.add(i);
            }
            if (pageIndexOrder<1){
                pageIndexOrder=1;
            }
            if (pageIndexOrder>totalPage){
                pageIndexOrder=totalPage;
            }
            List<Orders> ordersList=orderService.allOrdersService(pageSize,pageIndexOrder,custId);
            ActionContext.getContext().getSession().put("totalPageOrderList",totalPageList);
            ActionContext.getContext().getSession().put("pageIndexOrder",pageIndexOrder);
            ActionContext.getContext().getSession().put("ordersList",ordersList);


        return "success";}else {
            return "error";
        }
    }

    /**
     * 删除订单
     * @return
     */
    @Action(value = "deleteOrders",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","ordersIndex"})})
    public String deleteOrders(){
        Orders orders=new Orders();
        orders.setOrdersId(ordersId);
        List<Orderdetail> orderdetailList=orderService.getOrderDetailService(ordersId);
        for (Orderdetail orderdetail:orderdetailList){
            orderService.deleteOrderDateilService(orderdetail);
        }
        orderService.deleteOrdersService(orders);

        return "success";
    }

    /**
     * 查询订单的支付方式
     * @return
     */
    @Action(value = "payType",results = {@Result(name = "success",type = "redirect",location = "/Orders.jsp")})
    public  String allPayType(){
         List<Paytype> paytypeList=orderService.allPayTypeService();
         ActionContext.getContext().getSession().put("payTypeList",paytypeList);
        return "success";
    }

    /**
     * 查询订单里的商品
     * @return
     */
    @Action(value = "allGoods",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","allAddressOrder"}),
    })
    public String allCarvegetablesGoodsIndex(){
            int custId= (int) ActionContext.getContext().getSession().get("custId");
            List<Car> carList=carService.allOrdersGoodsService(custId);
            ActionContext.getContext().getSession().put("OrderGoodsList",carList);
            return "success";

    }

    /**
     * 添加订单
     * @return
     */
    @Action(value = "addOrders",results = {@Result(name = "success",type = "redirect",location = "/user.jsp")})
public String addOrders(){
    Customer customer=new Customer();
    customer.setCustId((Integer) ActionContext.getContext().getSession().get("custId"));
    Address address= (Address) ActionContext.getContext().getSession().get("addressOrder");
    Orderstatetype orderstatetype=new Orderstatetype();
    orderstatetype.setOrderStateTypeId(orderStateTypeId);
    Paytype paytype=new Paytype();
    paytype.setPayTypeId(payTypeId);
    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date=new Date();
    String  time= simpleDateFormat.format(date);
    Orders orders=new Orders();
    orders.setAddress(address);
    orders.setCustomer(customer);
    orders.setOrderstatetype(orderstatetype);
    orders.setOrdersTotalPage(ordersTotalPage);
    orders.setOrdersCreateTime(time);
    orders.setPaytype(paytype);
    orders.setInvoice(invoice);
    orders.setOrdersMessage(ordersMessage);
    orders.setPointget(pointGet);
        /**
         * 添加订单
         */
    orderService.addOrderService(orders);
        /**
         * 根据添加时间查询刚刚添加的订单
         */
    Orders orders1=orderService.getOrdersService(String.valueOf(time));
    List<Car> carList= (List<Car>) ActionContext.getContext().getSession().get("OrderGoodsList");
        /**
         * 循环添加订单详情
         */
    for (Car car:carList){
        Goods goods=new Goods();
        goods.setGoodsId(car.getGoods().getGoodsId());
        Orderdetail orderdetail=new Orderdetail(car.getGoodsNum(),car.getTotalPrice(),goods,orders1);
        orderService.addOrderDetailService(orderdetail);
    }
    int point=1;
Custpoint custpoint=new Custpoint(pointGet,customer,orders1,point);
/**
 * 给用户添加积分
 */
    orderService.addCustPointService(custpoint);
        /**
         * 删除购物车物品
         */
    List<Car> carList1=orderService.deleteAllCarGoodsService((Integer) ActionContext.getContext().getSession().get("custId"));
    for (Car car:carList1){
        carService.deleteCarService(car);
    }
        return "success";
}
    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndexOrder() {
        return pageIndexOrder;
    }

    public void setPageIndexOrder(int pageIndexOrder) {
        this.pageIndexOrder = pageIndexOrder;
    }

    public int getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }

    public int getPayTypeId() {
        return payTypeId;
    }

    public void setPayTypeId(int payTypeId) {
        this.payTypeId = payTypeId;
    }

    public int getInvoice() {
        return invoice;
    }

    public void setInvoice(int invoice) {
        this.invoice = invoice;
    }

    public int getOrderStateTypeId() {
        return orderStateTypeId;
    }

    public void setOrderStateTypeId(int orderStateTypeId) {
        this.orderStateTypeId = orderStateTypeId;
    }

    public double getOrdersTotalPage() {
        return ordersTotalPage;
    }

    public void setOrdersTotalPage(double ordersTotalPage) {
        this.ordersTotalPage = ordersTotalPage;
    }

    public String getOrdersMessage() {
        return ordersMessage;
    }

    public void setOrdersMessage(String ordersMessage) {
        this.ordersMessage = ordersMessage;
    }

    public int getPointGet() {
        return pointGet;
    }

    public void setPointGet(int pointGet) {
        this.pointGet = pointGet;
    }
}
