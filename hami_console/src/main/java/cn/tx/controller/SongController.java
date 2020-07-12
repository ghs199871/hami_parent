package cn.tx.controller;

import cn.tx.model.Album;
import cn.tx.model.Mtype;
import cn.tx.model.Song;
import cn.tx.model.Songer;
import cn.tx.query.SongQuery;
import cn.tx.query.SongerQuery;
import cn.tx.service.AlbumService;
import cn.tx.service.MtypeService;
import cn.tx.service.SongService;
import cn.tx.service.SongerService;
import cn.tx.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("song")
public class SongController {

    @Autowired
    private SongerService songerService;

    @Autowired
    private SongService songService;

    @Autowired
    private MtypeService mtypeService;

    @Autowired
    private AlbumService albumService;

    @RequestMapping("list")
    public String list(SongQuery mq, Model model) {
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }
        Page<Song> page = songService.selectByConditionPage(mq);
        List<Mtype> mtypes = mtypeService.selectObjectAll();
        List<Songer> songers = songerService.selectObjectAll();
        List<Album> albums = albumService.selectObjectAll();
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);
        model.addAttribute("mtypes", mtypes);
        model.addAttribute("songers", songers);
        model.addAttribute("albums", albums);
        return "song";

    }

    @RequestMapping("toAdd")
    public String toAdd(Model model) {
        List<Songer> songers = songerService.selectObjectAll();
        List<Album> albums = albumService.selectObjectAll();
        List<Mtype> mtypes = mtypeService.selectObjectAll();
        model.addAttribute("mtypes", mtypes);
        model.addAttribute("songers", songers);
        model.addAttribute("albums", albums);
        return "addSong";
    }

    @RequestMapping("addSong")
    public String addSong(Song song) {
        songService.insert(song);
        return "redirect:list";
    }


    @ResponseBody
    @RequestMapping("delSong")
    public String delSong(Integer sid) {
        songService.deleteByPrimaryKey(sid);
        return "success";
    }
}
