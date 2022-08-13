package com.zx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zx.entity.*;
import com.zx.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 后台管理  博客控制器
 * @author maple
 * @create 2022-07-11 9:30
 */
@Controller
@RequestMapping("/admin/blog")
public class AdminBlogController {
    @Autowired
    private ClazzService clazzService;
    @Autowired
    private PostService postService;
    @Resource
    private LabelService labelService;
    @Resource
    private PostLabelRelationshipService postLabelRelationshipService;
    @Resource
    private Post_Clazz_Service post_clazz_service;

    /**
     * 首次进入博客
     * @param pageNum  当前页码      defaultValue 默认值 1
     * @param pageSize 每页显示的记录数     defaultValue 默认值 6
     * @param model
     * @param session
     * @return
     */
    @GetMapping("/list")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                       @RequestParam(value = "pageSize", defaultValue = "3") Integer pageSize,
                       Model model, HttpSession session){
        //查询所有分类按照id降序排列
//        List<Clazz> clazzList = clazzService.findAllSortByIdDesc();
        List<Clazz> clazzList = clazzService.list(null);

        PageHelper.startPage(pageNum, pageSize);
        List<PostVo> postList = postService.findByParamWithClazz(new PostQuery());
        PageInfo<PostVo> postVoPageInfo=new PageInfo<PostVo>(postList);

        session.setAttribute("clazzList", clazzList);
        model.addAttribute("postList", postVoPageInfo);
        return "admin/blog-list";
    }
    @PostMapping("/search")
    public String search(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "3") Integer pageSize,
            PostQuery postQuery, Model model) {
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<PostVo> postList = postService.findByParamWithClazz(postQuery);
        model.addAttribute("postList", new PageInfo<PostVo>(postList));
        return "admin/blog-list";
    }
    @GetMapping("/goAdd")
    public String goAdd(Model model){
        PostQuery postQuery = new PostQuery();
        postQuery.setMark(1);
        postQuery.setRecommendStatus(true);
        postQuery.setRewardStatus(true);
        postQuery.setCopyrightStatus(true);
        postQuery.setCommentStatus(true);
        fillModelMapByPostQuery(model,postQuery);
        return "admin/blog-add";
    }
        @Transactional(rollbackFor = Exception.class)
        @PostMapping("/doAdd")
        public String doAdd(PostQuery postQuery, Model model, RedirectAttributes attr) {
            // 参数校验
            if (postQuery.getTitle() == null || postQuery.getTitle().trim().length() == 0) {
                fillModelMapByPostQuery(model, postQuery);
                model.addAttribute("message", "文章标题不能为空");
                return "admin/blog-add";
            }
            // 文章标题判重
            Post repeatPost = new Post();
            repeatPost.setTitle(postQuery.getTitle());
            QueryWrapper<Post> queryWrapper=new QueryWrapper<>();
            queryWrapper.eq("title",postQuery.getTitle());
            List<Post> repeatPostList = postService.list(queryWrapper);
//            List<Post> repeatPostList = postService.findByParam(repeatPost);
            if (repeatPostList != null && repeatPostList.size() > 0 && repeatPostList.get(0) != null) {
                fillModelMapByPostQuery(model, postQuery);
                model.addAttribute("model", "文章标题不能重复");
                return "admin/blog-add";
            }

            // 新增文章
            Post post = new Post(postQuery);
            post.setCreateTime(new Date());
            post.setUpdateTime(post.getCreateTime());
//            post.setUserId(postQuery.getUserId());
            // 添加博客
//            int savePostResult = postService.addPost(post);
            Boolean savePostResult= postService.save(post);
            // 新增文章成功
            if (savePostResult) {
                // 新增分类关系
                if (postQuery.getClazzIds() != null) {
                    String[] clazzIds = postQuery.getClazzIds().split(",");
                    for (String tmp : clazzIds) {
                        Integer clazzId = Integer.valueOf(tmp);
                        Post_Clazz_Relationship relationship1 = new Post_Clazz_Relationship();
                        relationship1.setPost_id(post.getId());
                        relationship1.setClazz_id(clazzId);
                        boolean save = post_clazz_service.save(relationship1);
//                        int result = clazzService.savePostClazzRelationship(post.getId(), clazzId);
                    }
                }
                // 新增标签关系
                if (postQuery.getLabelIds() != null) {
                    String[] labelIds = postQuery.getLabelIds().split(",");
                    for (String tmp : labelIds) {
                        Integer labelId = Integer.valueOf(tmp);
                        PostLabelRelationship relationship2 = new PostLabelRelationship();
                        relationship2.setLabelId(labelId);
                        relationship2.setPostId(post.getId());
                        boolean save = postLabelRelationshipService.save(relationship2);
//                        int result = labelService.savePostLabelRelationship(post.getId(), labelId);
                    }
                }
                attr.addFlashAttribute("message", "新增成功");
            } else {
                // 新增文章失败
                attr.addFlashAttribute("message", "新增失败");
            }
            return "redirect:/admin/blog/list";
        }

    //跳转到修改页码
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model, RedirectAttributes attributes) {
//        Post post = postService.findById(id);
        QueryWrapper<Post>queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("id",id);
        Post post = postService.getOne(queryWrapper);
        if (post == null) {
            attributes.addAttribute("message", "没有该文章，无法编辑");
            return "redirect:/admin/blog/list";
        } else {
            PostQuery postQuery = new PostQuery(post);
            QueryWrapper<Post_Clazz_Relationship>queryWrapper1=new QueryWrapper<>();
            queryWrapper1.eq("post_id",post.getId())
                    .select("clazz_id");
            List<Object> clazzIdList = post_clazz_service.listObjs(queryWrapper1);

            QueryWrapper<PostLabelRelationship>queryWrapper2=new QueryWrapper<>();
            queryWrapper2.eq("post_id",post.getId())
                            .select("label_id");
            List<Object> labelIdList = postLabelRelationshipService.listObjs(queryWrapper2);

//            List<Integer> clazzIdList = clazzService.findClazzIdsByPostId(post.getId());
//            List<Integer> labelIdList = labelService.findLabelIdsByPostId(post.getId());

            postQuery.setClazzIds(listToString(clazzIdList));
            postQuery.setLabelIds(listToString(labelIdList));
            fillModelMapByPostQuery(model, postQuery);
            return "admin/blog-edit";
        }
    }

    /**
     * 执行修改操作
     * @param postQuery
     * @param model
     * @param attributes
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @PostMapping("/edit")
    public String doEdit(PostQuery postQuery, Model model, RedirectAttributes attributes) {
        // 参数校验
        if (postQuery.getTitle() == null || postQuery.getTitle().trim().length() == 0) {
            fillModelMapByPostQuery(model, postQuery);
            model.addAttribute("message", "文章标题不能为空");
            return "admin/blog-edit";
        }
        // 文章标题判重
        Post repeatPost = new Post();
        repeatPost.setTitle(postQuery.getTitle());
//        List<Post> repeatPostList = postService.findByParam(repeatPost);
        QueryWrapper<Post> queryWrapper=new QueryWrapper<>();
        queryWrapper.eq("title",postQuery.getTitle());
        List<Post> repeatPostList = postService.list(queryWrapper);
        if (repeatPostList != null && repeatPostList.size() > 0) {
            for (Post tmp : repeatPostList) {
                if(!tmp.getId().equals(postQuery.getId())){
                    fillModelMapByPostQuery(model, postQuery);
                    model.addAttribute("message", "文章标题不能重复");
                    return "admin/blog-edit";
                }
            }
        }

        // 编辑文章
        Post post = new Post(postQuery);
        post.setUpdateTime(post.getCreateTime());
        //执行修改操作
//        QueryWrapper<Post>queryWrapper3=new QueryWrapper<>();
//        queryWrapper3.eq("id",post.getId());
        boolean editPostResult = postService.updateById(post);
//        int editPostResult = postService.modifyByIdSelective(post);
        if (editPostResult) {// 编辑文章成功
            // 删除分类关系
            QueryWrapper<Post_Clazz_Relationship>queryWrapper4=new QueryWrapper<>();
            queryWrapper4.eq("post_id",post.getId());
            boolean removeClazzIdsResult = post_clazz_service.removeById(post.getId());
//            int removeClazzIdsResult = clazzService.removeClazzIdsByPostId(post.getId());
            // 删除标签关系
            boolean removeLabelIdsResult = postLabelRelationshipService.removeById(post.getId());
//            int removeLabelIdsResult = labelService.removeLabelIdsByPostId(post.getId());
            // 编辑分类关系
            if (postQuery.getClazzIds() != null) {
                String[] clazzIds = postQuery.getClazzIds().split(",");
                for (String tmp : clazzIds) {
                    Integer clazzId = Integer.valueOf(tmp);
                    Post_Clazz_Relationship post_clazz_relationship=new Post_Clazz_Relationship();
                    post_clazz_relationship.setClazz_id(clazzId);
                    post_clazz_relationship.setPost_id(post.getId());
                    boolean result = post_clazz_service.save(post_clazz_relationship);
//                    int result = clazzService.savePostClazzRelationship(post.getId(), clazzId);
                }
            }
            // 编辑标签关系
            if (postQuery.getLabelIds() != null) {
                String[] labelIds = postQuery.getLabelIds().split(",");
                for (String tmp : labelIds) {
                    Integer labelId = Integer.valueOf(tmp);
                    PostLabelRelationship postLabelRelationship=new PostLabelRelationship();
                    postLabelRelationship.setPostId(post.getId());
                    postLabelRelationship.setLabelId(labelId);
                    boolean result = postLabelRelationshipService.save(postLabelRelationship);
//                    int result = labelService.savePostLabelRelationship(post.getId(), labelId);
                }
            }
            attributes.addFlashAttribute("message", "编辑成功");
        } else {
            // 编辑文章失败
            attributes.addFlashAttribute("message", "编辑失败");
        }
        return "redirect:/admin/blog/list";
    }

    @Transactional(rollbackFor = Exception.class)
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id, RedirectAttributes attributes) {
        // 删除
        Boolean removePostResult = postService.removeById(id);
        if (removePostResult) {  // 删除成功
            // 删除分类关系
            QueryWrapper<Post_Clazz_Relationship>queryWrapper=new QueryWrapper<>();
            queryWrapper.eq("post_id",id);
            boolean removeClazzIdsResult = post_clazz_service.remove(queryWrapper);
//            int removeClazzIdsResult = clazzService.removeClazzIdsByPostId(id);
            // 删除标签关系
            QueryWrapper<PostLabelRelationship>queryWrapper1=new QueryWrapper<>();
            queryWrapper1.eq("post_id",id);
            boolean removeLabelIdsResult = postLabelRelationshipService.remove(queryWrapper1);
//            int removeLabelIdsResult = labelService.removeLabelIdsByPostId(id);
            attributes.addFlashAttribute("message", "删除成功");
        } else {
            // 删除失败
            attributes.addFlashAttribute("message", "删除失败");
        }
        return "redirect:/admin/blog/list";
    }


    private void fillModelMapByPostQuery(Model model, PostQuery postQuery) {
        List<Clazz> clazzList = clazzService.list(null);
        List<Label> labelList = labelService.list(null);
        model.addAttribute("post", postQuery);
        model.addAttribute("clazzList", clazzList);
        model.addAttribute("labelList", labelList);
    }
    private String listToString(List<Object> list){
        StringBuilder stringBuilder = new StringBuilder();
        for(int i=0;i<list.size();i++){
            stringBuilder.append(list.get(i));
            if(i<list.size()-1){
                stringBuilder.append(",");
            }
        }
        return stringBuilder.toString();
    }

}
