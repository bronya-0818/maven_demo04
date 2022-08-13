package com.zx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zx.entity.Clazz;
import com.zx.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * 后台管理 分类管理控制器
 * @author maple
 * @create 2022-07-07 16:55
 */
@Controller
@RequestMapping("/admin/type")
public class AdminTypeController {
    @Autowired
    private ClazzService clazzService;
    @GetMapping("/list")
    public String list(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
            Model Model) {
        if (pageNum > 0 && pageSize > 0) {
            PageHelper.startPage(pageNum, pageSize);
        }
        List<Clazz> clazzList = clazzService.list(null);
        Model.addAttribute("clazzList", new PageInfo<Clazz>(clazzList));
        return "admin/type-list";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("clazz", new Clazz());
        return "admin/type-add";
    }

    @PostMapping("/add")
    public String doAdd(Clazz clazz, Model model, RedirectAttributes attributes) {
        // 参数校验
        if (clazz.getClazzName() == null || clazz.getClazzName().trim().length() == 0) {
            model.addAttribute("clazz", clazz);
            model.addAttribute("message", "分类名称不能为空");
            model.addAttribute("flag",true);
            return "admin/type-add";
        }
        // 分类名称判重
        QueryWrapper<Clazz>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("clazz_name",clazz.getClazzName());
        List<Clazz> repeatClazzList = clazzService.list(queryWrapper);
//        List<Clazz> repeatClazzList = clazzService.que(clazz);
        if (repeatClazzList != null && repeatClazzList.size() > 0 && repeatClazzList.get(0) != null) {
            model.addAttribute("clazz", clazz);
            model.addAttribute("message", "分类名称不能重复");
            model.addAttribute("flag",true);

            return "admin/type-add";
        }
        // 新增
        boolean result = clazzService.save(clazz);
//        boolean result = clazzService.addClazz(clazz);
        if (result) {
            // 新增成功
            attributes.addFlashAttribute("message", "新增成功");
        } else {
            // 新增失败
            attributes.addFlashAttribute("message", "新增失败");
        }
        return "redirect:/admin/type/list";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap modelMap, RedirectAttributes attributes) {
         QueryWrapper<Clazz>queryWrapper=new QueryWrapper<>();
         queryWrapper.eq("id",id);
        Clazz clazz = clazzService.getOne(queryWrapper);
//        Clazz clazz = clazzService.findClazzById(id);
        if (clazz == null) {
            attributes.addFlashAttribute("message", "没有该分类，无法编辑");
            return "redirect:/admin/type/list";
        } else {
            modelMap.addAttribute("clazz", clazz);
            return "admin/type-edit";
        }
    }

    @PostMapping("/edit")
    public String doEdit(Clazz clazz, Model model, RedirectAttributes attributes) {
        // 参数校验
        if (clazz.getClazzName() == null || clazz.getClazzName().trim().length() == 0) {
            model.addAttribute("clazz", clazz);
            model.addAttribute("message", "分类名称不能为空");
            model.addAttribute("flag",true);

            return "admin/type-edit";
        }
        // 分类名称判重
        QueryWrapper<Clazz>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("clazz_name",clazz.getClazzName());
        List<Clazz> repeatClazzList = clazzService.list(queryWrapper);
//        List<Clazz> repeatClazzList = clazzService.findByParam(new Clazz(null, clazz.getClazzName()));
        if (repeatClazzList != null && repeatClazzList.size() > 0 && repeatClazzList.get(0) != null) {
            model.addAttribute("clazz", clazz);
            model.addAttribute("message", "分类名称不能重复");
            model.addAttribute("flag",true);

            return "admin/type-edit";
        }
        // 编辑
//        boolean result = clazzService.updateClazz(clazz);
        QueryWrapper<Clazz>queryWrapper1=new QueryWrapper<>();
        queryWrapper1.eq("id",clazz.getId());
        boolean result = clazzService.update(clazz, queryWrapper1);
        if (result) {
            // 编辑成功
            attributes.addFlashAttribute("message", "编辑成功");
        } else {
            // 编辑失败
            attributes.addFlashAttribute("message", "编辑失败");
        }
        return "redirect:/admin/type/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes attributes) {
        // 删除
//        boolean result = clazzService.delClazz(id);
        boolean result = clazzService.removeById(id);
        if (result) {
            // 删除成功
            attributes.addFlashAttribute("message", "删除成功");
        } else {
            // 删除失败
            attributes.addFlashAttribute("message", "删除失败");
        }
        return "redirect:/admin/type/list";
    }
}
