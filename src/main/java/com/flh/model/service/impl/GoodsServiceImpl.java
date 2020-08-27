package com.flh.model.service.impl;

import com.flh.model.dao.GoodsDao;
import com.flh.model.dao.impl.GoodsDaoImpl;
import com.flh.model.entity.Comment;
import com.flh.model.entity.Goods;
import com.flh.model.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao=new GoodsDaoImpl();

    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    /**
     * 根据水果类型查询水果
     * @param goodsTypeId
     * @return
     */
    @Override
    public List<Goods> allGoods(int goodsTypeId) {
        return goodsDao.allGoods(goodsTypeId);
    }
    /**
     * 获取水果
     * @param pageSize
     * @param goodsTypeId
     * @return
     */
    @Override
    public int totalPageGoodsService(int pageSize, int goodsTypeId) {
        return goodsDao.totalPageGoodsDao(pageSize,goodsTypeId);
    }
    /**
     * 水果查询分页
     * @param pageSize
     * @param pageindex
     * @param goodsTyptId
     * @return
     */
    @Override
    public List<Goods> getAllGoodsService(int pageSize, int pageindex, int goodsTyptId) {
        return goodsDao.getAllGoodsDao(pageSize,pageindex,goodsTyptId);
    }
    /**
     * 查询商品排行
     * @param goodsTypeId
     * @return
     */
    @Override
    public List<Goods> SelectGoodsSalesService(int goodsTypeId) {
        return goodsDao.SelectGoodsSales(goodsTypeId);
    }
    /**
     * 查询水果详情
     * @param goodsId
     * @return
     */
    @Override
    public Goods goodsDetailService(int goodsId) {
        return goodsDao.goodsDetail(goodsId);
    }
    /**
     * 获取评论
     * @param pageSize
     * @param goodsId
     * @return
     */
    @Override
    public int totalPageCommentService(int pageSize, int goodsId) {
        return goodsDao.totalPageCommentDao(pageSize,goodsId);
    }
    /**
     * 评论查询分页
     * @param pageSize
     * @param pageindex
     * @param goodsId
     * @return
     */
    @Override
    public List<Comment> getAllCommentService(int pageSize, int pageindex, int goodsId) {
        return goodsDao.getAllCommentDao(pageSize,pageindex,goodsId);
    }
    /**
     * 查询能用积分购买的商品总数
     * @param pageSize
     * @param pointBuy
     * @return
     */
    @Override
    public int totalPagePointService(int pageSize, int pointBuy) {
        return goodsDao.totalPagePointDao(pageSize,pointBuy);
    }
    /**
     * 查询能用积分购买的商品
     * @param pageIndex
     * @param pageSize
     * @param pointBuy
     * @return
     */
    @Override
    public List<Goods> getAllPointGoodsService(int pageIndex, int pageSize, int pointBuy) {
        return goodsDao.getAllPointGoodsDao(pageIndex,pageSize,pointBuy);
    }
    /**
     * 查询特价商品数量
     * @param pageSize
     * @return
     */
    @Override
    public int totalTeamBuyGoodsService(int pageSize) {
        return goodsDao.totalTeamBuyGoodsDao(pageSize);
    }
    /**
     * 对特价商品进行分页查询
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @Override
    public List<Goods> getAllTeamBuyGoodsService(int pageIndex, int pageSize) {
        return goodsDao.getAllTeamBuyGoodsDao(pageIndex,pageSize);
    }
    /**
     * 获取特价商品销量排行前三的商品
     * @return
     */
    @Override
    public List<Goods> getRankingTeamBuyGoodsService() {
        return goodsDao.getRankingTeamBuyGoodsDao();
    }
}
