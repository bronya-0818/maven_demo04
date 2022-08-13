package com.zx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zx.entity.User;
import com.zx.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {
    @Resource
    private UserService userService;
    @PostMapping("doLogin")
    public String doLogin(User user, Model model, HttpSession session){
        User user1 = userService.checkLogin(user.getAccount(), user.getPassword());
        if (user1!=null){
            session.setAttribute("loginUser",user1);
            session.setAttribute("flagLogin",true);
            return "redirect:t1";
        }
        else {

            model.addAttribute("msg","用户名或密码错误");
            return "front/login";
        }
    }
    @PostMapping("doRegister")
    public String doRegister(User user, Model model, HttpSession session) {

        Date date = new Date();
//        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
//       dateFormat.format(date)
        user.setCreateTime(date);
        user.setUpdateTime(date);
        int i = userService.userRegister(user);
        if(i==0){
            model.addAttribute("msg","注册失败,请重新注册！");
            return "front/register";
        }else {
            session.setAttribute("loginUser",user);
            return "front/login";
        }
    }
    @GetMapping("/goModify/{userId}")
    public String goModify(@PathVariable("userId") Integer userId, Model model){
        QueryWrapper<User>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("id",userId);
        User user = userService.getOne(queryWrapper);
        model.addAttribute("user",user);
        return "front/test1";
    }
    @PostMapping("/doModify")
    public String doModify(User user,HttpSession session){

        QueryWrapper<User>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("id",user.getId());
        user.setUpdateTime(new Date());
        boolean update = userService.update(user, queryWrapper);

        User byId = userService.getById(user.getId());
        if (update) {
            session.setAttribute("loginUser", byId);
        }
        return "redirect:t1";
    }
    @GetMapping("/exit")
    public String exit(HttpSession session){
        session.setAttribute("loginUser",null);
        session.setAttribute("flagLogin",false);
        return "forward:t1";

    }
}
