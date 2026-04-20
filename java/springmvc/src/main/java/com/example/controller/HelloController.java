package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Hello World Controller
 * Spring MVC 示例控制器
 */
@Controller
public class HelloController {

    /**
     * Hello World 页面
     * @param model Spring MVC 模型对象
     * @return 视图名称
     */
    @GetMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello, World!");
        model.addAttribute("timestamp", new java.util.Date());
        return "hello";
    }

    /**
     * 首页重定向到 hello
     * @return 重定向路径
     */
    @GetMapping("/")
    public String index() {
        return "redirect:/hello";
    }
}
