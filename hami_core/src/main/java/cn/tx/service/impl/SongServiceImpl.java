package cn.tx.service.impl;

import cn.tx.dao.SongMapper;
import cn.tx.model.Song;
import cn.tx.query.SongQuery;
import cn.tx.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongServiceImpl extends BaseServiceImpl<SongQuery, Song> implements SongService {


    private SongMapper songMapper;

    @Autowired
    public void setSongMapper(SongMapper songMapper) {
        this.songMapper = songMapper;
        this.baseDao = songMapper;
    }

    @Override
    public List<Song> selectSong(List<Integer> sids) {
        return songMapper.selectSong(sids);
    }

    @Override
    public Song getSong(Integer sid) {
        return songMapper.getSong(sid);
    }
}
