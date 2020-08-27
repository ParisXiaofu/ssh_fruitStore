package com.flh.model.dao;

import com.flh.model.entity.Comment;
import com.flh.model.entity.Goods;

import java.util.List;

public interface GoodsDao {
    /**
     * 查询水果，根据水果类型
     * @param goodsTypeId
     * @return
     */
    public List<Goods> allGoods(int goodsTypeId);

    /**
     * 获取水果
     * @param pageSize
     * @param goodsTypeId
     * @return
     */
    public int totalPageGoodsDao(int pageSize,int goodsTypeId);

    /**
     * 水果查询分页
     * @param pageSize
     * @param pageindex
     * @param goodsTyptId
     * @return
     */
    public List<Goods> getAllGoodsDao(int pageSize,int pageindex,int goodsTyptId);

    /**
     * 查询商品排行
     * @param goodsTypeId
     * @return
     */
    public List<Goods> SelectGoodsSales(int goodsTypeId);

    /**
     * 查询水果详情
     * @param goodsId
     * @return
     */
    public Goods goodsDetail(int goodsId);
    /**
     * 获取评论
     * @param pageSize
     * @param goodsId
     * @return
     */
    public int totalPageCommentDao(int pageSize,int goodsId);

    /**
     * 评论查询分页
     * @param pageSize
     * @param pageindex
     * @param goodsId
     * @return
     */
    public List<Comment> getAllCommentDao(int pageSize, int pageindex, int goodsId);

    /**
     * 查询能用积分购买的商品总数
     * @param pageSize
     * @param pointBuy
     * @return
     */
    public int totalPagePointDao(int pageSize,int pointBuy);

    /**
     * 查询能用积分购买的商品
     * @param pageIndex
     * @param pageSize
     * @param pointBuy
     * @return
     */
    public List<Goods> getAllPointGoodsDao(int pageIndex,int pageSize,int pointBuy);

    /**
     * 查询特价商品数量
     * @param pageSize
     * @return
     */
    public int totalTeamBuyGoodsDao(int pageSize);

    /**
     * 对特价商品进行分页查询
     * @param pageIndex
     * @param pageSize

     * @return
     */
    public List<Goods> getAllTeamBuyGoodsDao(int pageIndex,int pageSize);

    /**
     * 获取特价商品销量排行前三的商品
     * @return
     */
    public List<Goods> getRankingTeamBuyGoodsDao();
}
