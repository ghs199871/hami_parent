package cn.tx.dao;

import cn.tx.model.Song;
import cn.tx.query.SongQuery;

import java.util.List;

public interface SongMapper extends BaseDao<SongQuery, Song> {

    List<Song> selectSong(List<Integer> sids);

    Song getSong(Integer sid);
}