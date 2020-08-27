package com.flh.model.service;

import com.flh.model.entity.Collection;

import java.util.List;

public interface CollectionService {
    /**
     * 添加收藏商品
     * @param collection
     */
    public void addCollectionService(Collection collection);

    /**
     * 删除收藏商品
     * @param collection
     */
    public void deleteCollectionService(Collection collection);

    /**
     * 查询所有收藏商品数量根据用户
     * @param pageSize
     * @param custId
     * @return
     */
    public int totalCollectionService(int pageSize,int custId);

    /**
     * 分页查询收藏夹商品
     * @param pageIndex
     * @param pageSize
     * @param custId
     * @return
     */
    public List<Collection> allCollectionService(int pageIndex, int pageSize, int custId);
}
