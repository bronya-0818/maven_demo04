package com.zx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zx.dao.LabelDAO;
import com.zx.entity.Label;
import com.zx.entity.LabelVo;
import com.zx.service.LabelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class LabelServiceImpl extends ServiceImpl<LabelDAO, Label> implements LabelService {
    @Resource
    private LabelDAO labelDAO;
    @Override
    public List<LabelVo> queryLabelVo() {
        List<LabelVo> labels = labelDAO.selectLabelVo();
        return labels;
    }
}
