package cn.tx.controller;


import cn.tx.dao.SongerMapper;
import cn.tx.model.Mtype;
import cn.tx.model.Songer;
import cn.tx.query.SongerQuery;
import cn.tx.service.MtypeService;
import cn.tx.service.SongerService;
import cn.tx.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("songer")


public class SongerController {
    @Autowired
    private SongerService songerService;

    @Autowired
    private MtypeService mtypeService;

    @RequestMapping("list")
    public String list(SongerQuery mq, Model model) {
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }
        Page<Songer> page = songerService.selectByConditionPage(mq);
        List<Mtype> mtypes = mtypeService.selectObjectAll();
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);
        model.addAttribute("mtypes", mtypes);
        return "songer";
    }

    @RequestMapping("toAdd")
    public String toAdd(Model model) {
        List<Mtype> mtypes = mtypeService.selectObjectAll();
        model.addAttribute("mtypes", mtypes);
        return "addSonger";
    }

    @RequestMapping("addSonger")
    public String addSonger(Songer songer) {
        songerService.insert(songer);
        return "redirect:list";
    }


    @ResponseBody
    @RequestMapping("delSonger")
    public String delSonger(Integer sid) {
        songerService.deleteByPrimaryKey(sid);
        return "success";
    }


    @RequestMapping("toUpd")
    public String toUpd(Integer id) {

        return "updateSonger";
    }
}
