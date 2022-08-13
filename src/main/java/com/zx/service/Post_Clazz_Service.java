package com.zx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zx.entity.Post_Clazz_Relationship;

import java.util.List;

public interface Post_Clazz_Service extends IService<Post_Clazz_Relationship> {

    List<Integer> findClazzIdsByPostId(Integer pid);
}
