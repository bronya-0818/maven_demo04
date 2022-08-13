package com.zx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zx.entity.Post;
import com.zx.entity.PostQuery;
import com.zx.entity.PostVo;

import java.util.List;

public interface PostService extends IService<Post> {
    /**
     * 查询所有博文
     * @return
     */
    List<Post> posts();

    List<PostVo> findByParamWithClazz(PostQuery postQuery);
}
