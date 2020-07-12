package cn.tx.controller;

import cn.tx.model.Album;
import cn.tx.query.AlbumQuery;
import cn.tx.service.AlbumService;
import cn.tx.util.Page;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @RequestMapping("list")
    public String list(AlbumQuery album, Model model) {
        if (album.getPageNo() == null) {
            album.setPageNo(1);
        }
        Page<Album> page = albumService.selectByConditionPage(album);
        model.addAttribute("page", page);
        model.addAttribute("mq", album);
        return "album";
    }


    @ResponseBody
    @RequestMapping("addAlbum")
    public String addAlbum(Album album) {
        albumService.insert(album);
        return "success";
    }


    @ResponseBody
    @RequestMapping("isSameName")
    public String isSame(String aname) {
        String fla = "false";
        Map<String, String> map = new HashMap<>();
        map.put("aname", aname);
        List<Album> albums = albumService.selectAlbumByName(map);
        if (albums.size() > 0) {
            fla = "true";
        }
        return fla;
    }

    @ResponseBody
    @RequestMapping("delAlbum")
    public String delAlbum(Integer tid, String tpath) {
        Client client = Client.create();
        if (tpath != null && !tpath.equals("")) {
            WebResource resource = client.resource(tpath);
            resource.delete();
        }
        albumService.deleteByPrimaryKey(tid);
        return "success";
    }

    @ResponseBody
    @RequestMapping("getAlbum")
    public Album getAlbum(Integer tid) {
        Album album = albumService.selectByPrimaryKey(tid);
        return album;
    }

    @ResponseBody
    @RequestMapping("updateAlbum")
    public String updateAlbum(Album album) {
        albumService.updateByPrimaryKeySelective(album);
        return "success";
    }
}
