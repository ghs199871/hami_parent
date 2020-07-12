package cn.tx.dao;

import cn.tx.model.Mtype;
import cn.tx.model.Songer;
import cn.tx.query.SongerQuery;

import java.util.List;

public interface SongerMapper extends BaseDao<SongerQuery, Songer> {
    List<Songer> selectObjectAll();

    Songer selectByKey(Integer srid);
}
