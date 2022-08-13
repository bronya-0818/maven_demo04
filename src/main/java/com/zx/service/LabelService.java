package com.zx.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zx.entity.Label;
import com.zx.entity.LabelVo;

import java.util.List;

public interface LabelService extends IService<Label> {

    List<LabelVo> queryLabelVo();
}
