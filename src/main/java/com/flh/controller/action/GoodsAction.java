package com.flh.controller.action;

import com.flh.model.entity.Comment;
import com.flh.model.entity.Goods;
import com.flh.model.service.GoodsService;
import com.flh.model.service.impl.GoodsServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

@Controller
@Namespace("/")
@ParentPackage("json-default")
public class GoodsAction {
    @Autowired
    private GoodsService goodsService=new GoodsServiceImpl();

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }
    private int goodsTypeId;
    private List<Goods> goodsList;
    private List<Goods> goodsList2;
    private List<Goods> goodsListTeam;
    private int pageIndexs;
    private int pageIndexs2;
    private int pageIndexs3;
    private int pageIndexc;
    private int pageIndexp;
    private int pageIndexTeam;
    private int pageSize=8;
    private int goodsId;
    /**
     * 分类查询所有水果
     * @return
     */
    @Action(value ="fruit",results = {@Result(name = "success",type = "json",params = {"root","goodsList"})})
    public String AllFruit(){
        goodsList=goodsService.allGoods(goodsTypeId);
        return "success";
    }
    /**
     * 查询商品销量排行
     * @return
     */
    @Action(value ="sales",results = {
            @Result(name = "success",type = "json",params = {"root","goodsList2"})})
   public String GoodsSales(){
        goodsList2=goodsService.SelectGoodsSalesService(goodsTypeId);
       return "success";
   }
    /**
     * 商品详情
     * @return
     */
   @Action(value = "goodsDetail",results = {@Result(name = "success",type = "redirectAction",params = {"actionName","commentIndex"})})
   public String goodsDetail(){
        Goods goods=goodsService.goodsDetailService(goodsId);
        ActionContext.getContext().getSession().put("goods",goods);
        //购物车和收藏传值
       ActionContext.getContext().getSession().put("goodsId",goodsId);
        return "success";
   }
    /**
     * 分页并分类查询所有水果
     * @return
     */
    @Action(value = "fruitIndex",results = {
            @Result(name = "fruit",type = "redirect",location = "/Product-SGList.jsp"),})
    public String AllFruitIndex() {
            goodsTypeId=101;
            int totalPage = goodsService.totalPageGoodsService(pageSize, goodsTypeId);
            if (pageIndexs < 1) {
                pageIndexs = 1;
            }
            if (pageIndexs > totalPage) {
                pageIndexs = totalPage;
            }
            List<Goods> goodsList = goodsService.getAllGoodsService(pageSize, pageIndexs, goodsTypeId);
            ActionContext.getContext().getSession().put("pageIndexs", pageIndexs);
            ActionContext.getContext().getSession().put("totalPages", totalPage);
            ActionContext.getContext().getSession().put("goodsList", goodsList);
            return "fruit";
        }
    /**
     * 分页并分类查询所有蔬菜
     * @return
     */
    @Action(value = "vegetablesIndex",results = {
            @Result(name = "vagetables",type = "redirect",location = "/Product-SCList.jsp"),})
    public String AllVegetablesIndex() {
        goodsTypeId=102;
        int totalPage = goodsService.totalPageGoodsService(pageSize, goodsTypeId);
        if (pageIndexs2 < 1) {
            pageIndexs2 = 1;
        }
        if (pageIndexs2 > totalPage) {
            pageIndexs2 = totalPage;
        }
        List<Goods> goodsList = goodsService.getAllGoodsService(pageSize, pageIndexs2, goodsTypeId);
        ActionContext.getContext().getSession().put("pageIndexs2", pageIndexs2);
        ActionContext.getContext().getSession().put("totalPages2", totalPage);
        ActionContext.getContext().getSession().put("goodsList2", goodsList);
        return "vagetables";
    }
    /**
     * 分页并分类查询所有坚果
     * @return
     */
    @Action(value = "nutsIndex",results = {
            @Result(name = "nuts",type = "redirect",location = "/Product-JGList.jsp"),})
    public String AllNutsIndex() {
        goodsTypeId=103;
        int totalPage = goodsService.totalPageGoodsService(pageSize, goodsTypeId);
        if (pageIndexs3 < 1) {
            pageIndexs3 = 1;
        }
        if (pageIndexs3 > totalPage) {
            pageIndexs3 = totalPage;
        }
        List<Goods> goodsList = goodsService.getAllGoodsService(pageSize, pageIndexs3, goodsTypeId);
        ActionContext.getContext().getSession().put("pageIndexs3", pageIndexs3);
        ActionContext.getContext().getSession().put("totalPages3", totalPage);
        ActionContext.getContext().getSession().put("goodsList3", goodsList);
        return "nuts";
    }
    /**
     * 分页并分类查询所有评论
     * @return
     */
    @Action(value = "commentIndex",results = {
            @Result(name = "success",type = "redirect",location = "/Product-detailed.jsp"),})
    public String AllCommentIndex() {
        pageSize=5;
        goodsId= (int) ActionContext.getContext().getSession().get("goodsId");
        int totalPage = goodsService.totalPageCommentService(pageSize,goodsId);
        if (pageIndexc < 1) {
            pageIndexc = 1;
        }
        if (pageIndexc > totalPage) {
            pageIndexc = totalPage;
        }
        List<Comment> commentList=goodsService.getAllCommentService(pageSize,pageIndexc,goodsId);
        ActionContext.getContext().getSession().remove("pageIndexc");
        ActionContext.getContext().getSession().remove("totalPagec");
        ActionContext.getContext().getSession().remove("commentList");
        ActionContext.getContext().getSession().put("pageIndexc", pageIndexc);
        ActionContext.getContext().getSession().put("totalPagec", totalPage);
        ActionContext.getContext().getSession().put("commentList", commentList);
        return "success";
    }
    /**
     * 分页并分类查询所有积分商品
     * @return
     */
    @Action(value = "goodsPointIndex",results = {
            @Result(name = "success",type = "redirect",location = "/integral.jsp"),})
    public String AllGoodsPointIndex() {
        pageSize=10;
        int pointBuy=1;
        int totalPage = goodsService.totalPagePointService(pageSize,pointBuy);
        if (pageIndexp< 1) {
            pageIndexp = 1;
        }
        if (pageIndexp > totalPage) {
            pageIndexp = totalPage;
        }
        List<Goods> goodsList=goodsService.getAllPointGoodsService(pageIndexp,pageSize,pointBuy);
        ActionContext.getContext().getSession().put("pageIndexp", pageIndexp);
        ActionContext.getContext().getSession().put("totalPagep", totalPage);
        ActionContext.getContext().getSession().put("goodsListPoint", goodsList);
        return "success";
    }

    /**
     * 分页并查询所有特价商品
     * @return
     */
    @Action(value = "teamBuyIndex",results = {@Result(name = "success",type = "redirect",location = "/Group_buy.jsp")})
    public String teamBuyIndex(){
        pageSize=4;
        int totalPage=goodsService.totalTeamBuyGoodsService(pageSize);
        if (pageIndexTeam<1){
            pageIndexTeam=1;
        }if (pageIndexTeam>totalPage){
            pageIndexTeam=totalPage;
        }
        List TeamtotalPageList=new ArrayList();
        for (int i=1;i<=totalPage;i++){
            TeamtotalPageList.add(i);
        }
        List<Goods> goodsList=goodsService.getAllTeamBuyGoodsService(pageIndexTeam,pageSize);
        ActionContext.getContext().getSession().put("pageIndexTeam",pageIndexTeam);
        ActionContext.getContext().getSession().put("TeamtotalPageList",TeamtotalPageList);
        ActionContext.getContext().getSession().put("TeamGoodsList",goodsList);
        return "success";
    }

    /**
     * 活动商品促销排行榜
     * @return
     */
    @Action(value = "rankTeamGoods",results = {@Result(name = "success",type = "json",params = {"root","goodsListTeam"})})
    public String rankTeamGoods(){
         goodsListTeam=goodsService.getRankingTeamBuyGoodsService();
        return "success";
    }

    public int getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(int goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    public int getPageIndexs() {
        return pageIndexs;
    }

    public void setPageIndexs(int pageIndexs) {
        this.pageIndexs = pageIndexs;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndexs2() {
        return pageIndexs2;
    }

    public void setPageIndexs2(int pageIndexs2) {
        this.pageIndexs2 = pageIndexs2;
    }

    public int getPageIndexs3() {
        return pageIndexs3;
    }

    public void setPageIndexs3(int pageIndexs3) {
        this.pageIndexs3 = pageIndexs3;
    }

    public List<Goods> getGoodsList2() {
        return goodsList2;
    }

    public void setGoodsList2(List<Goods> goodsList2) {
        this.goodsList2 = goodsList2;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public int getPageIndexc() {
        return pageIndexc;
    }

    public void setPageIndexc(int pageIndexc) {
        this.pageIndexc = pageIndexc;
    }

    public int getPageIndexp() {
        return pageIndexp;
    }

    public void setPageIndexp(int pageIndexp) {
        this.pageIndexp = pageIndexp;
    }

    public List<Goods> getGoodsListTeam() {
        return goodsListTeam;
    }

    public void setGoodsListTeam(List<Goods> goodsListTeam) {
        this.goodsListTeam = goodsListTeam;
    }

    public int getPageIndexTeam() {
        return pageIndexTeam;
    }

    public void setPageIndexTeam(int pageIndexTeam) {
        this.pageIndexTeam = pageIndexTeam;
    }
}
