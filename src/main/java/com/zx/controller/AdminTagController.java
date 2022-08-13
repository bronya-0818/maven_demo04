package com.zx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zx.entity.Label;
import com.zx.service.LabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * 后台管理 标签管理控制器
 * @author maple
 * @create 2022-07-07 16:54
 */
@Controller
@RequestMapping("/admin/tag")
public class AdminTagController {
    @Autowired
    private LabelService labelService;

    @GetMapping("/list")
    public String list(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "6") Integer pageSize,
            Model model) {
        if (pageNum > 0 && pageSize > 0) {
            PageHelper.startPage(pageNum, pageSize);
        }
        List<Label> labelList = labelService.list(null);
        model.addAttribute("labelList", new PageInfo<Label>(labelList));
        return "admin/tag-list";
    }

    @GetMapping("/add")
    public String add(ModelMap modelMap) {
        modelMap.addAttribute("label", new Label());
        return "admin/tag-add";
    }

    @PostMapping("/add")
    public String doAdd(Label label, ModelMap modelMap, RedirectAttributes attributes) {
        // 参数校验
        if (label.getLabelName() == null || label.getLabelName().trim().length() == 0) {
            modelMap.addAttribute("label", label);
            modelMap.addAttribute("message", "标签名称不能为空");
            return "admin/tag-add";
        }
        // 标签名称判重
        QueryWrapper<Label>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("label_name",label.getLabelName());
        List<Label> repeatLabelList = labelService.list(queryWrapper);
//        List<Label> repeatLabelList = labelService.findByParam(label);
        if (repeatLabelList != null && repeatLabelList.size() > 0 && repeatLabelList.get(0) != null) {
            modelMap.addAttribute("label", label);
            modelMap.addAttribute("message", "标签名称不能重复");
            return "admin/tag-add";
        }
        // 新增
        Boolean result = labelService.save(label);
        if (result) {
            // 新增成功
            attributes.addFlashAttribute("message", "新增成功");
        } else {
            // 新增失败
            attributes.addFlashAttribute("message", "新增失败");
        }
        return "redirect:/admin/tag/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap modelMap, RedirectAttributes attributes) {
        Label label = labelService.getById(id);
//        Label label = labelService.findById(id);
        if (label == null) {
            attributes.addFlashAttribute("message", "没有该标签，无法编辑");
            return "redirect:/admin/tag/list";
        } else {
            modelMap.addAttribute("label", label);
            return "admin/tag-edit";
        }
    }

    @PostMapping("/edit")
    public String doEdit(Label label, ModelMap modelMap, RedirectAttributes attributes) {
        // 参数校验
        if (label.getLabelName() == null || label.getLabelName().trim().length() == 0) {
            modelMap.addAttribute("label", label);
            modelMap.addAttribute("message", "标签名称不能为空");
            return "admin/tag-edit";
        }
        // 标签名称判重
        QueryWrapper<Label>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("label_name",label.getLabelName());
        List<Label> repeatLabelList = labelService.list(queryWrapper);
        if (repeatLabelList != null && repeatLabelList.size() > 0 && repeatLabelList.get(0) != null) {
            modelMap.addAttribute("label", label);
            modelMap.addAttribute("message", "标签名称不能重复");
            return "admin/tag-edit";
        }
        // 编辑
        Boolean result = labelService.updateById(label);
        if (result) {
            // 编辑成功
            attributes.addFlashAttribute("message", "编辑成功");
        } else {
            // 编辑失败
            attributes.addFlashAttribute("message", "编辑失败");
        }
        return "redirect:/admin/tag/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes attributes) {
        // 删除
        Boolean result = labelService.removeById(id);
        if (result) {
            // 删除成功
            attributes.addFlashAttribute("message", "删除成功");
        } else {
            // 删除失败
            attributes.addFlashAttribute("message", "删除失败");
        }
        return "redirect:/admin/tag/list";
    }
}
