package com.flh.model.service.impl;

import com.flh.model.dao.CollectionDao;
import com.flh.model.dao.impl.CollectionDaoImpl;
import com.flh.model.entity.Collection;
import com.flh.model.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class CollectionServiceImpl implements CollectionService {
    @Autowired
    private CollectionDao collectionDao=new CollectionDaoImpl();

    public void setCollectionDao(CollectionDao collectionDao) {
        this.collectionDao = collectionDao;
    }
    /**
     * 添加收藏商品
     * @param collection
     */
    @Override
    public void addCollectionService(Collection collection) {
        collectionDao.addCollectionDao(collection);
    }
    /**
     * 删除收藏商品
     * @param collection
     */
    @Override
    public void deleteCollectionService(Collection collection) {
collectionDao.deleteCollectionDao(collection);
    }
    /**
     * 查询所有收藏商品数量根据用户
     * @param pageSize
     * @param custId
     * @return
     */
    @Override
    public int totalCollectionService(int pageSize, int custId) {
        return collectionDao.totalCollection(pageSize,custId);
    }
    /**
     * 分页查询收藏夹商品
     * @param pageIndex
     * @param pageSize
     * @param custId
     * @return
     */
    @Override
    public List<Collection> allCollectionService(int pageIndex, int pageSize, int custId) {
        return collectionDao.allCollectionDao(pageIndex,pageSize,custId);
    }
}
