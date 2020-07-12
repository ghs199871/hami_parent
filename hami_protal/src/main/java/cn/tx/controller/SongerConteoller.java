package cn.tx.controller;

import cn.tx.model.Album;
import cn.tx.model.Mtype;
import cn.tx.model.Song;
import cn.tx.model.Songer;
import cn.tx.query.SongerQuery;
import cn.tx.service.MtypeService;
import cn.tx.service.SongService;
import cn.tx.service.SongerService;
import cn.tx.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("songer")
public class SongerConteoller {

    @Autowired
    private SongerService songerService;

    @Autowired
    private MtypeService mtypeService;

    @RequestMapping("list")
    public String list(SongerQuery mq, Model model) {
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }
        mq.setPageSize(20);

        Page<Songer> page = songerService.selectByConditionPage(mq);
        //获取到对象数据的集合
        List<Songer> pageList = page.getList();
        //存入对象的集合
        List<Songer> subList = null;
        //将存入对象的集合存入到改集合中
        List<List<Songer>> lists = new ArrayList<>();
        for (int i = 0; i < pageList.size(); i++) {
            if (i % 5 == 0) {
                subList = new ArrayList<>();
                lists.add(subList);
            }
            Songer songer = pageList.get(i);
            subList.add(songer);
        }

        List<Mtype> mtypes = mtypeService.selectObjectAll();
        model.addAttribute("sList", lists);
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);
        model.addAttribute("mtypes", mtypes);
        return "songers";
    }


    @RequestMapping("getSonger")
    public String getSonger(Integer srid, Model model) {
        Songer songer = songerService.selectByKey(srid);
        model.addAttribute("songer", songer);
        return "songer";
    }
}
