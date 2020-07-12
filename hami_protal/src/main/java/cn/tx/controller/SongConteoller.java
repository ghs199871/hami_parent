package cn.tx.controller;

import cn.tx.model.Album;
import cn.tx.model.Mtype;
import cn.tx.model.Song;
import cn.tx.model.Songer;
import cn.tx.query.SongQuery;
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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("song")
public class SongConteoller {


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
        return "search";
    }

    @RequestMapping("play")
    public String play(String sid, Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String[] sids = null;
        String result = "";
        List<Integer> ids = new ArrayList<>();
        if (sid != null && sid != "") {
            sids = sid.split(",");
            if (sids != null) {
                for (String s : sids) {
                    ids.add(new Integer(s));
                    result = result + s + ",";
                }
            }
        }
        String value = null;
        String[] sidsCookie = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            String name = cookie.getName();
            if (name.equals("songs")) {
                value = cookie.getValue();
                //解码
                value = URLDecoder.decode(value, "UTF-8");
            }
        }

        if (value != null && value != "") {
            sidsCookie = value.split(",");
            if (sidsCookie != null) {
                for (String s : sidsCookie) {
                    Integer id = new Integer(s);
                    boolean fa = false;
                    for (Integer integer : ids) {
                        if (integer.equals(id)) {
                            fa = true;
                            break;
                        }
                    }
                    if (!fa) {
                        ids.add(id);
                        result = result + s + ",";
                    }
                }
            }
        }
        Cookie cookie = new Cookie("songs", URLEncoder.encode(result, "UTF-8"));
        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 24 * 30);
        response.addCookie(cookie);

        if (ids.size() == 0) {
            ids.add(-1);
        }
        List<Song> songs = songService.selectSong(ids);
        model.addAttribute("songs", songs);
        return "player";
    }

    @ResponseBody
    @RequestMapping("getSong")
    public Song getSong(Integer sid) {
        Song song = songService.getSong(sid);
        return song;
    }
}
