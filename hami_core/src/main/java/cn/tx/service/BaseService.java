package cn.tx.service;

import cn.tx.util.Page;

import java.util.List;

public interface BaseService<Q, T> {

    int deleteByPrimaryKey(Integer tid);

    int insert(T record);

    T selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(T record);

    List<T> selectByCondition(Q q);

    Integer selectByConditionCount(Q q);

    Page<T> selectByConditionPage(Q q);

}
