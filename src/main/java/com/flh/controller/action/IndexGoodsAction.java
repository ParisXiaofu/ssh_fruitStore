package com.flh.controller.action;

import com.flh.model.entity.Goods;
import com.flh.model.service.IndexGoodsService;
import com.flh.model.service.impl.IndexGoodsServiceImpl;
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
public class IndexGoodsAction {
    @Autowired
    private IndexGoodsService  indexGoodsService=new IndexGoodsServiceImpl();

    public void setIndexGoodsService(IndexGoodsService indexGoodsService) {
        this.indexGoodsService = indexGoodsService;
    }
    private List<Goods> goodsListCenter;
    private int goodsTypeId;
    /**
     * 查询促销商品
     * @return
     */
@Action(value = "rankGoods",results = {@Result(name = "success",type = "redirect",location = "/index.jsp")})
    public String RankGoods(){
       List<Goods> goodsListTop=indexGoodsService.RankGoodsService();
    ActionContext.getContext().getSession().put("goodsListTop",goodsListTop);
        return "success";
    }

    /**
     * 分类查询最新上架商品
     * @return
     */
    @Action(value = "newGoods",results = {@Result(name = "success",type = "json",params = {"root","goodsListCenter"})})
    public String newGoods(){
        goodsListCenter=indexGoodsService.NewGoodsService(goodsTypeId);

        return "success";
    }

    /**
     * 查询主站推荐商品
     * @return
     */
    @Action(value = "RecommendGoods",results = {@Result(name = "success",type = "redirect",location = "/index.jsp")})
    public String RecommendGoods(){
        List<Goods> goodsListBu=indexGoodsService.RecommendGodosService();
        ActionContext.getContext().getSession().put("goodsListBu",goodsListBu);
        return "success";
    }


    public List<Goods> getGoodsListCenter() {
        return goodsListCenter;
    }

    public void setGoodsListCenter(List<Goods> goodsListCenter) {
        this.goodsListCenter = goodsListCenter;
    }



    public int getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(int goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }
}
