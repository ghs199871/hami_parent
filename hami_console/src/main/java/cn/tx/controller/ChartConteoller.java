package cn.tx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("char")
public class ChartConteoller {

    @RequestMapping("list")
    public String showMessage()
    {
        return "chart";
    }
}
