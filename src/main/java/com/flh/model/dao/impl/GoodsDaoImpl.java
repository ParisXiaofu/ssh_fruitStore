package com.flh.model.dao.impl;

import com.flh.model.dao.GoodsDao;
import com.flh.model.entity.Comment;
import com.flh.model.entity.Goods;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class GoodsDaoImpl implements GoodsDao {
    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
public Session getSession(){
      return   sessionFactory.getCurrentSession();
}
    /**
     * 查询水果,根据水果类型
     * @param goodsTypeId
     * @return
     */
    @Override
    public List<Goods> allGoods(int goodsTypeId) {
        Query query=getSession().createQuery("from Goods where goodstype.goodsTypeId=?");
        query.setParameter(0,goodsTypeId);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
    /**
     * 获取水果
     * @param pageSize
     * @param goodsTypeId
     * @return
     */
    @Override
    public int totalPageGoodsDao(int pageSize, int goodsTypeId) {
        int totalPage=0;
        Query query=getSession().createQuery("from Goods where goodstype.goodsTypeId=?");
        query.setParameter(0,goodsTypeId);
       List<Goods> goodsList=query.list();
        totalPage=(goodsList.size()-1)/pageSize+1;
        return totalPage;
    }
    /**
     * 水果查询分页
     * @param pageSize
     * @param pageindex
     * @param goodsTyptId
     * @return
     */
    @Override
    public List<Goods> getAllGoodsDao(int pageSize, int pageindex, int goodsTyptId) {
        Query query=getSession().createQuery("from Goods where goodstype.goodsTypeId=?");
        query.setParameter(0,goodsTyptId);
        query.setFirstResult((pageindex-1)*pageSize);
        query.setMaxResults(pageSize);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
    /**
     * 查询商品销量排行
     * @param goodsTypeId
     * @return
     */
    @Override
    public List<Goods> SelectGoodsSales(int goodsTypeId) {
        Query query=getSession().createQuery("from Goods where goodstype.goodsTypeId=? order by goodsSales desc");
        query.setParameter(0,goodsTypeId);
        query.setMaxResults(5);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
    /**
     * 查询水果详情
     * @param goodsId
     * @return
     */
    @Override
    public Goods goodsDetail(int goodsId) {
        Query query=getSession().createQuery("from Goods where goodsId=?");
        query.setParameter(0,goodsId);
        Goods goods=(Goods) query.uniqueResult();
        return goods;
    }

    /**
     * 获取评论
     * @param pageSize
     * @param goodsId
     * @return
     */
    @Override
    public int totalPageCommentDao(int pageSize, int goodsId) {
        int totalPage=0;
        Query query=getSession().createQuery("from Comment where goods.goodsId=?");
        query.setParameter(0,goodsId);
        List<Goods> goodsList=query.list();
        totalPage=(goodsList.size()-1)/pageSize+1;
        return totalPage;
    }

    /**
     * 评论分页
     * @param pageSize
     * @param pageindex
     * @param goodsId
     * @return
     */
    @Override
    public List<Comment> getAllCommentDao(int pageSize, int pageindex, int goodsId) {
        Query query=getSession().createQuery("from Comment where goods.goodsId=?");
        query.setParameter(0,goodsId);
        query.setFirstResult((pageindex-1)*pageSize);
        query.setMaxResults(pageSize);
        List<Comment> commentList=query.list();
        return commentList;
    }
    /**
     * 查询能用积分购买的商品总数
     * @param pageSize
     * @param pointBuy
     * @return
     */
    @Override
    public int totalPagePointDao(int pageSize, int pointBuy) {
        int totalPage=0;
        Query query=getSession().createQuery("from Goods where pointBuy=?");
        query.setParameter(0,pointBuy);
        List<Goods> goodsList=query.list();
        totalPage=(goodsList.size()-1)/ pageSize+1;
        return totalPage;
    }
    /**
     * 查询能用积分购买的商品
     * @param pageIndex
     * @param pageSize
     * @param pointBuy
     * @return
     */
    @Override
    public List<Goods> getAllPointGoodsDao(int pageIndex, int pageSize, int pointBuy) {
        Query query=getSession().createQuery(" from Goods where pointBuy=?");
        query.setParameter(0,pointBuy);
        query.setFirstResult((pageIndex-1)*pageSize);
        query.setMaxResults(pageSize);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
    /**
     * 查询特价商品数量
     * @param pageSize
     * @return
     */
    @Override
    public int totalTeamBuyGoodsDao(int pageSize) {
        int totalPage=0;
        Query query=getSession().createQuery("from Goods where teamBuy=1");
        List<Goods> goodsList=query.list();
        totalPage=(goodsList.size()-1)/pageSize+1;
        return totalPage;
    }
    /**
     * 对特价商品进行分页查询
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @Override
    public List<Goods> getAllTeamBuyGoodsDao(int pageIndex, int pageSize) {
        Query query=getSession().createQuery("from Goods where teamBuy=1");
        query.setFirstResult((pageIndex-1)*pageSize);
        query.setMaxResults(pageSize);
        List<Goods> goodsList=query.list();
        return goodsList;
    }
    /**
     * 获取特价商品销量排行前三的商品
     * @return
     */
    @Override
    public List<Goods> getRankingTeamBuyGoodsDao() {
        Query query=getSession().createQuery("from Goods where teamBuy=1 order by goodsSales desc");
        query.setMaxResults(3);
        List<Goods> goodsList=query.list();
        return goodsList;
    }

}
