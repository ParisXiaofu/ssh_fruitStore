package com.flh.model.dao.impl;

import com.flh.model.dao.IndexGoodsDao;
import com.flh.model.entity.Goods;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class IndexDaoImpl implements IndexGoodsDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    public Session getSession(){
        return   sessionFactory.getCurrentSession();
    }
    /**
     * 查询促销商品
     * @return
     */
    @Override

    public List<Goods> RankGoodsDao() {
        Query query=getSession().createQuery("from Goods where teamBuy=1 order by goodsSales desc");
        query.setMaxResults(10);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
    /**
     * 分类查询最新上架商品
     * @param goodsTypeId
     * @return
     */
    @Override
    public List<Goods> NewGoodsDao(int goodsTypeId) {
        Query query=getSession().createQuery("from Goods where goodstype.goodsTypeId=? order by goodsCreateTime desc ");
        query.setParameter(0,goodsTypeId);
        query.setMaxResults(8);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
    /**
     * 查询主站推荐商品
     * @return
     */
    @Override
    public List<Goods> RecommendGodosDao() {
        Query query=getSession().createQuery("from  Goods  order by goodsSales desc");
        query.setMaxResults(10);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
}
