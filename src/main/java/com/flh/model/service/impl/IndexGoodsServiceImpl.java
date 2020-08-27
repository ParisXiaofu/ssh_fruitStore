package com.flh.model.service.impl;

import com.flh.model.dao.IndexGoodsDao;
import com.flh.model.dao.impl.IndexDaoImpl;
import com.flh.model.entity.Goods;
import com.flh.model.service.IndexGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class IndexGoodsServiceImpl implements IndexGoodsService {
    @Autowired
    private IndexGoodsDao indexGoodsDao=new IndexDaoImpl();

    public void setIndexGoodsDao(IndexGoodsDao indexGoodsDao) {
        this.indexGoodsDao = indexGoodsDao;
    }
    /**
     * 查询促销商品
     * @return
     */
    @Override
    public List<Goods> RankGoodsService() {
        return indexGoodsDao.RankGoodsDao();
    }
    /**
     * 分类查询最新上架商品
     * @param goodsTypeId
     * @return
     */
    @Override
    public List<Goods> NewGoodsService(int goodsTypeId) {
        return indexGoodsDao.NewGoodsDao(goodsTypeId);
    }
    /**
     * 查询主站推荐商品
     * @return
     */
    @Override
    public List<Goods> RecommendGodosService() {
        return indexGoodsDao.RecommendGodosDao();
    }
}
