package com.flh.controller.action;


import com.flh.model.entity.Car;
import com.flh.model.entity.Customer;
import com.flh.model.entity.Goods;
import com.flh.model.service.CarService;
import com.flh.model.service.impl.CarServiceImpl;
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
@ParentPackage("json-default")
public class CarAction {
    @Autowired
    private CarService carService=new CarServiceImpl();

    public void setCarService(CarService carService) {
        this.carService = carService;
    }
    private int goodsId;
    private double goodsPrice;
    private int goodsNum;
    private int carId;
    /**
     * 添加购物车
     * @return
     */
    @Action(value = "addCar1",results = {
            @Result(name = "success",type = "redirect",location = "/Products.jsp"),
                @Result(name = "error",location = "/Login.jsp")
    })
    public String addCarService(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            Customer customer=new Customer();
            customer.setCustId((int) ActionContext.getContext().getSession().get("custId"));
        Goods goods=new Goods();
        goods.setGoodsId(goodsId);
        int goodsNum=1;
        double totalPrice=goodsNum*goodsPrice;
        Car car=new Car(goodsNum,totalPrice,customer,goods);
        carService.addCarService(car);
        return "success";}
        else {
            return "error";
        }
    }
    @Action(value = "addCar2",results = {
            @Result(name = "success",type = "redirect",location = "/Product-SGList.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCarService2(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            Customer customer=new Customer();
            customer.setCustId((int) ActionContext.getContext().getSession().get("custId"));
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            int goodsNum=1;
            double totalPrice=goodsNum*goodsPrice;
            Car car=new Car(goodsNum,totalPrice,customer,goods);
            carService.addCarService(car);
            return "success";}
        else {
            return "error";
        }
    }
    @Action(value = "addCar3",results = {
            @Result(name = "success",type = "redirect",location = "/Product-JGList.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCarService3(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            Customer customer=new Customer();
            customer.setCustId((int) ActionContext.getContext().getSession().get("custId"));
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            int goodsNum=1;
            double totalPrice=goodsNum*goodsPrice;
            Car car=new Car(goodsNum,totalPrice,customer,goods);
            carService.addCarService(car);
            return "success";}
        else {
            return "error";
        }
    }
    @Action(value = "addCar4",results = {
            @Result(name = "success",type = "redirect",location = "/Product-SCList.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCarService4(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            Customer customer=new Customer();
            customer.setCustId((int) ActionContext.getContext().getSession().get("custId"));
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            int goodsNum=1;
            double totalPrice=goodsNum*goodsPrice;
            Car car=new Car(goodsNum,totalPrice,customer,goods);
            carService.addCarService(car);
            return "success";}
        else {
            return "error";
        }
    }
    @Action(value = "addCarS",results = {
            @Result(name = "success",type = "redirect",location = "/Product-detailed.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCarServiceS(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            Customer customer=new Customer();
            customer.setCustId((int) ActionContext.getContext().getSession().get("custId"));
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            double totalPrice=goodsNum*goodsPrice;
            Car car=new Car(goodsNum,totalPrice,customer,goods);
            carService.addCarService(car);
            return "success";}
        else {
            return "error";
        }
    }

    /**
     * 分类查询购物车--水果
     * @return
     */
    @Action(value = "allCarfruit",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","allCarvegetables.action"}),
    @Result(name = "error",location = "/Login.jsp")
    })
    public String allCarfruitGoodsIndex(){
        if (ActionContext.getContext().getSession().get("custId")==null){
            return "error";
        }else{
            int custId= (int) ActionContext.getContext().getSession().get("custId");
            int goodsTypeId=101;
            List<Car> carList=carService.allCarService(goodsTypeId,custId);
            ActionContext.getContext().getSession().put("carList",carList);
            return "success";
        }
    }
    /**
     * 分类查询购物车--蔬菜
     * @return
     */
    @Action(value = "allCarvegetables",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","allCarnuts.action"}),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String allCarvegetablesGoodsIndex(){
        if (ActionContext.getContext().getSession().get("custId")==null){
            return "error";
        }else{
            int custId= (int) ActionContext.getContext().getSession().get("custId");
            int goodsTypeId=102;
            List<Car> carList=carService.allCarService(goodsTypeId,custId);
            ActionContext.getContext().getSession().put("carList1",carList);
            return "success";
        }
    }
    /**
     * 分类查询购物车--坚果
     * @return
     */
    @Action(value = "allCarnuts",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","totalMoney"}),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String allCarnutsGoodsIndex(){
        if (ActionContext.getContext().getSession().get("custId")==null){
            return "error";
        }else{
            int custId= (int) ActionContext.getContext().getSession().get("custId");
            int goodsTypeId=103;
            List<Car> carList=carService.allCarService(goodsTypeId,custId);
            ActionContext.getContext().getSession().put("carList2",carList);
            return "success";
        }
    }
    /**
     * 删除购物车-水果
     */
    @Action(value = "deleteCar1",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","allCarfruit.action"}),
    })
    public String deleteCar1(){
        Car car=new Car();
        car.setCarId(carId);
        carService.deleteCarService(car);
        return "success";
    }
    /**
     * 删除购物车-蔬菜
     */
    @Action(value = "deleteCar2",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","allCarvegetables.action"}),
    })
    public String deleteCar2(){
        Car car=new Car();
        car.setCarId(carId);
        carService.deleteCarService(car);
        return "success";
    }
    /**
     * 删除购物车-坚果
     */
    @Action(value = "deleteCar3",results = {
            @Result(name = "success",type = "redirectAction",params = {"actionName","allCarnuts.action"}),
    })
    public String deleteCar3(){
        Car car=new Car();
        car.setCarId(carId);
        carService.deleteCarService(car);
        return "success";
    }
    /**
     * 修改商品数量
     */
    @Action(value = "updateCar",results = {
            @Result(name = "success",type = "redirectAction",params= {"actionName","allCarfruit"})})
    public String updateCar1(){
        Car car=new Car();
        car.setCarId(carId);
        car.setGoodsNum(goodsNum);
        double totalPrice=goodsPrice*goodsNum;
        car.setTotalPrice(totalPrice);
        carService.updateCarService(car);
        return "success";
    }
    @Action(value = "totalMoney",results = {
            @Result(name = "success",type = "redirect",location = "/shopping_cart.jsp")})
    public String totalMoney(){
        int custId= (int) ActionContext.getContext().getSession().get("custId");
        List<Car> totalMoney=carService.totalMoneyService(custId);
        ActionContext.getContext().getSession().put("totalMoney",totalMoney);
        return "success";
    }
    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }
}
