package com.flh.controller.action;

import com.flh.model.entity.Collection;
import com.flh.model.entity.Customer;
import com.flh.model.entity.Goods;
import com.flh.model.service.CollectionService;
import com.flh.model.service.impl.CollectionServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Namespace("/")
@ParentPackage("struts-default")
@Controller
public class CollectionAction {
    @Autowired
    private CollectionService collectionService=new CollectionServiceImpl();

    public void setCollectionService(CollectionService collectionService) {
        this.collectionService = collectionService;
    }
    private int goodsId;
    private int collectionId;
    private int pageSize=8;
    private int pageIndexcoll;
    /**
     * 添加收藏
     */
    @Action(value = "addCollection1",results = {
            @Result(name = "success",type = "redirect",location = "/Products.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCollection1(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custd= (int) ActionContext.getContext().getSession().get("custId");
            Customer customer=new Customer();
            customer.setCustId(custd);
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            Collection collection=new Collection(customer,goods);
            collectionService.addCollectionService(collection);
            return "success";
        }else {
            return "error";
        }
    }
    @Action(value = "addCollection2",results = {
            @Result(name = "success",type = "redirect",location = "/Product-JGList.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCollection2(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custd= (int) ActionContext.getContext().getSession().get("custId");
            Customer customer=new Customer();
            customer.setCustId(custd);
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            Collection collection=new Collection(customer,goods);
            collectionService.addCollectionService(collection);
            return "success";
        }else {
            return "error";
        }
    }
    @Action(value = "addCollection3",results = {
            @Result(name = "success",type = "redirect",location = "/Product-SCList.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCollection3(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custd= (int) ActionContext.getContext().getSession().get("custId");
            Customer customer=new Customer();
            customer.setCustId(custd);
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            Collection collection=new Collection(customer,goods);
            collectionService.addCollectionService(collection);
            return "success";
        }else {
            return "error";
        }
    }
    @Action(value = "addCollection4",results = {
            @Result(name = "success",type = "redirect",location = "/Product-SGList.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCollection4(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custd= (int) ActionContext.getContext().getSession().get("custId");
            Customer customer=new Customer();
            customer.setCustId(custd);
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            Collection collection=new Collection(customer,goods);
            collectionService.addCollectionService(collection);
            return "success";
        }else {
            return "error";
        }
    }
    @Action(value = "addCollection5",results = {
            @Result(name = "success",type = "redirect",location = "/Product-detailed.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCollection5(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custd= (int) ActionContext.getContext().getSession().get("custId");
            Customer customer=new Customer();
            customer.setCustId(custd);
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            Collection collection=new Collection(customer,goods);
            collectionService.addCollectionService(collection);
            return "success";
        }else {
            return "error";
        }
    }
    @Action(value = "addCollection6",results = {
            @Result(name = "success",type = "redirect",location = "/Group_buy.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCollection6(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custd= (int) ActionContext.getContext().getSession().get("custId");
            Customer customer=new Customer();
            customer.setCustId(custd);
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            Collection collection=new Collection(customer,goods);
            collectionService.addCollectionService(collection);
            return "success";
        }else {
            return "error";
        }
    }
    @Action(value = "addCollection7",results = {
            @Result(name = "success",type = "redirect",location = "/integral.jsp"),
            @Result(name = "error",location = "/Login.jsp")
    })
    public String addCollection7(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custd= (int) ActionContext.getContext().getSession().get("custId");
            Customer customer=new Customer();
            customer.setCustId(custd);
            Goods goods=new Goods();
            goods.setGoodsId(goodsId);
            Collection collection=new Collection(customer,goods);
            collectionService.addCollectionService(collection);
            return "success";
        }else {
            return "error";
        }
    }
    /**
     * 查询收藏
     * @return
     */
    @Action(value = "allCollection",results = {@Result(name = "success",type = "redirect",location = "/user_Collect.jsp"),
    @Result(name = "error",location = "/Login.jsp")
    })
    public String allCollection(){
        if (ActionContext.getContext().getSession().get("custId")!=null){
            int custId= (int) ActionContext.getContext().getSession().get("custId");
        int totalPage=collectionService.totalCollectionService(pageSize,custId);
        List totalPageList=new ArrayList();
        for (int i=1;i<=totalPage;i++){
           totalPageList.add(i);
        }
        if (pageIndexcoll<1){
            pageIndexcoll=1;
        }
        if (pageIndexcoll>totalPage){
            pageIndexcoll=totalPage;
        }
            List<Collection> collectionList=collectionService.allCollectionService(pageIndexcoll,pageSize,custId);
        ActionContext.getContext().getSession().put("pageIndexcoll",pageIndexcoll);
        ActionContext.getContext().getSession().put("totalPageList",totalPageList);
        ActionContext.getContext().getSession().put("collectionList",collectionList);
        return "success";}else {
            return "error";
        }
    }

    /**
     * 删除收藏
     * @return
     */
    @Action(value = "deleteCollection",results = {@Result(name = "success",type = "redirectAction",params = {"actionName","allCollection"})})
    public String delete(){
        Collection collection=new Collection();
        collection.setCollectionId(collectionId);
        collectionService.deleteCollectionService(collection);
        return "success";
    }
    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(int collectionId) {
        this.collectionId = collectionId;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndexcoll() {
        return pageIndexcoll;
    }

    public void setPageIndexcoll(int pageIndexcoll) {
        this.pageIndexcoll = pageIndexcoll;
    }
}
