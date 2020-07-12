package cn.tx.service.impl;

import cn.tx.dao.SongerMapper;
import cn.tx.model.Songer;
import cn.tx.query.SongerQuery;
import cn.tx.service.SongerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongerServiceImpl extends BaseServiceImpl<SongerQuery, Songer> implements SongerService {


    private SongerMapper songerMapper;

    @Autowired
    public void setSongerMapper(SongerMapper songerMapper) {
        this.songerMapper = songerMapper;
        this.baseDao = songerMapper;
    }

    @Override
    public List<Songer> selectObjectAll() {
        return songerMapper.selectObjectAll();
    }

    @Override
    public Songer selectByKey(Integer srid) {
        return songerMapper.selectByKey(srid);
    }
}
