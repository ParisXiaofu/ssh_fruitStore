package com.flh.model.service;

import com.flh.model.entity.Goods;

import java.util.List;

public interface IndexGoodsService {
    /**
     * 查询促销商品
     * @return
     */
    public List<Goods> RankGoodsService();

    /**
     * 分类查询最新上架商品
     * @param goodsTypeId
     * @return
     */
    public List<Goods> NewGoodsService(int goodsTypeId);

    /**
     * 查询主站推荐商品
     * @return
     */
    public List<Goods> RecommendGodosService();
}
