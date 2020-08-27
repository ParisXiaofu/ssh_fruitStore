package com.flh.model.dao;

import com.flh.model.entity.Goods;

import java.util.List;

public interface IndexGoodsDao {
    /**
     * 查询促销商品
     * @return
     */
    public List<Goods> RankGoodsDao();

    /**
     * 分类查询最新上架商品
     * @param goodsTypeId
     * @return
     */
    public List<Goods> NewGoodsDao(int goodsTypeId);

    /**
     * 查询主站推荐商品
     * @return
     */
   public List<Goods> RecommendGodosDao();
}
