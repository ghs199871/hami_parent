package cn.tx.controller;

import cn.tx.model.Mtype;
import cn.tx.query.MtypeQuery;
import cn.tx.service.MtypeService;
import cn.tx.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("mtype")
public class MtypeController {

    @Autowired
    private MtypeService mtypeService;

    @RequestMapping("/list")
    public String mTypeList(MtypeQuery mq, Model model) {
        if (mq.getPageNo() == null) {
            mq.setPageNo(1);
        }
        Page<Mtype> page = mtypeService.selectByConditionPage(mq);
        model.addAttribute("page", page);
        model.addAttribute("mq", mq);
        return "mtype";
    }


    @ResponseBody
    @RequestMapping("/addMtype")
    public String addMtype(MtypeQuery mq) {
        mtypeService.insert(mq);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/getMtype")
    public Mtype getMtype(Integer tid) {
        Mtype mtype = mtypeService.selectByPrimaryKey(tid);
        return mtype;
    }


    @ResponseBody
    @RequestMapping("/updateMtype")
    public String updateMtype(MtypeQuery mq) {
        mtypeService.updateByPrimaryKeySelective(mq);
        return "success";
    }


    @ResponseBody
    @RequestMapping("/delMtype")
    public String delMtype(Integer tid) {
        mtypeService.deleteByPrimaryKey(tid);
        return "success";
    }
}
