package cn.tx.service;


import cn.tx.model.Album;
import cn.tx.model.Songer;
import cn.tx.query.SongerQuery;

import java.util.List;

public interface SongerService extends BaseService<SongerQuery, Songer>{

    List<Songer> selectObjectAll();

    Songer selectByKey(Integer srid);
}
