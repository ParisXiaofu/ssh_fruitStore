package com.flh.model.dao.impl;

import com.flh.model.dao.CollectionDao;
import com.flh.model.entity.Collection;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CollectionDaoImpl implements CollectionDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
public Session getSession(){
        return sessionFactory.getCurrentSession();
}
    /**
     * 添加收藏商品
     * @param collection
     */
    @Override
    public void addCollectionDao(Collection collection) {
getSession().save(collection);
    }
    /**
     * 删除收藏商品
     * @param collection
     */
    @Override
    public void deleteCollectionDao(Collection collection) {
getSession().delete(collection);
    }
    /**
     * 查询所有收藏商品数量根据用户
     * @param pageSize
     * @param custId
     * @return
     */
    @Override
    public int totalCollection(int pageSize, int custId) {
        int totalPage=0;
        Query query=getSession().createQuery("from Collection where customer.custId=?");
        query.setParameter(0,custId);
        List<Collection> collectionList=query.list();
        totalPage=(collectionList.size()-1)/pageSize+1;
        return totalPage;
    }
    /**
     * 分页查询收藏夹商品
     * @param pageIndex
     * @param pageSize
     * @param custId
     * @return
     */
    @Override
    public List<Collection> allCollectionDao(int pageIndex, int pageSize, int custId) {
        Query query=getSession().createQuery("from Collection where customer.custId=?");
        query.setParameter(0,custId);
        query.setFirstResult((pageIndex-1)*pageSize);
        query.setMaxResults(pageSize);
        List<Collection> collectionList=query.list();
        return collectionList;
    }
}
