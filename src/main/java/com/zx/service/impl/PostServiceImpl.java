package com.zx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zx.dao.PostDAO;
import com.zx.entity.Post;
import com.zx.entity.PostExample;
import com.zx.entity.PostQuery;
import com.zx.entity.PostVo;
import com.zx.service.PostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class PostServiceImpl extends ServiceImpl<PostDAO,Post> implements PostService {
    @Resource
    private PostDAO postDAO;
    @Override
    public List<Post> posts() {
        List<Post> posts = postDAO.selectList(null);
        return posts;
    }

    @Override
    public List<PostVo> findByParamWithClazz(PostQuery postQuery) {
        PostExample example = new PostExample();
        PostExample.Criteria criteria = example.createCriteria();
        // 此处添加查询条件
        if (postQuery.getTitle() != null && postQuery.getTitle().length() > 0) {
            criteria.andTitleLike("%" + postQuery.getTitle() + "%");
        }
        if (postQuery.getMark() != null) {
            criteria.andMarkEqualTo(postQuery.getMark());
        }
        if (postQuery.getRecommendStatus() != null) {
            criteria.andRecommendStatusEqualTo(postQuery.getRecommendStatus());
        }
        if (postQuery.getRewardStatus() != null) {
            criteria.andRewardStatusEqualTo(postQuery.getRewardStatus());
        }
        if (postQuery.getCopyrightStatus() != null) {
            criteria.andCopyrightStatusEqualTo(postQuery.getCopyrightStatus());
        }
        if (postQuery.getCommentStatus() != null) {
            criteria.andCommentStatusEqualTo(postQuery.getCommentStatus());
        }
        if (postQuery.getPublishStatus() != null) {
            criteria.andPublishStatusEqualTo(postQuery.getPublishStatus());
        }
        // 按照更新时间倒序
        example.setOrderByClause("update_time DESC");
        return postDAO.selectByExampleWithClazz(example, postQuery.getClazzId());
    }
}
