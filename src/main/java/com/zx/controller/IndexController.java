package com.zx.controller;

import com.baomidou.mybatisplus.extension.conditions.query.QueryChainWrapper;
import com.zx.entity.Clazz;
import com.zx.entity.ClazzVo;
import com.zx.entity.LabelVo;
import com.zx.entity.Post;
import com.zx.service.ClazzService;
import com.zx.service.LabelService;
import com.zx.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class IndexController {
    @Resource
    private PostService postService;
    @Resource
    private ClazzService clazzService;
    @Resource
    private LabelService labelService;
    @GetMapping("/t1")
    public String index(Model model) {
        List<Post> postList = postService.posts();

//        List<Clazz> clazzList = clazzService.list(null);
        List<ClazzVo> clazzList = clazzService.querryClazzVo();

        List<LabelVo> labelVoList = labelService.queryLabelVo();
        model.addAttribute("clazzVoList",clazzList);
        model.addAttribute("postList_test1",postList);
        model.addAttribute("labelVoList",labelVoList);
        return "index2";

    }
}
