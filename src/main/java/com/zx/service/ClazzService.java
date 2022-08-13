package com.zx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zx.entity.Clazz;
import com.zx.entity.ClazzVo;

import java.util.List;

public interface ClazzService extends IService<Clazz> {
   List<ClazzVo> querryClazzVo();
}
