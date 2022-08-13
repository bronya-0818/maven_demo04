package com.zx.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zx.entity.Label;
import com.zx.entity.LabelExample;
import java.util.List;

import com.zx.entity.LabelVo;
import org.apache.ibatis.annotations.Param;

public interface LabelDAO extends BaseMapper<Label> {
   List<LabelVo> selectLabelVo();
}