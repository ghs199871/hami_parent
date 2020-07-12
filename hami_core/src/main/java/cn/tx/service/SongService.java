package cn.tx.service;


import cn.tx.dao.SongMapper;
import cn.tx.model.Song;
import cn.tx.query.SongQuery;

import java.util.List;

public interface SongService extends BaseService<SongQuery, Song>{

    List<Song> selectSong(List<Integer> sids);

    Song getSong(Integer sid);
}
