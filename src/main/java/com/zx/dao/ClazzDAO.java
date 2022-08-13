package com.zx.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zx.entity.Clazz;
import com.zx.entity.ClazzVo;

import java.util.List;

public interface ClazzDAO extends BaseMapper<Clazz> {

    List<ClazzVo> selectClazzVo();

}