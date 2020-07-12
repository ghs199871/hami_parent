package cn.tx.dao;

import cn.tx.model.Mtype;
import cn.tx.query.MtypeQuery;

import java.util.List;

public interface MtypeMapper extends BaseDao<MtypeQuery, Mtype> {
    List<Mtype> selectObjectAll();
}
