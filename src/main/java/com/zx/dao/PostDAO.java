package com.zx.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zx.entity.Post;
import com.zx.entity.PostExample;
import com.zx.entity.PostVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostDAO extends BaseMapper<Post> {


    /**
     *
     * @param example  博客的条件
     * @param clazzId 分类条件
     * @return
     */
    List<PostVo> selectByExampleWithClazz(@Param("example") PostExample example, @Param("clazzId") Integer clazzId);
}