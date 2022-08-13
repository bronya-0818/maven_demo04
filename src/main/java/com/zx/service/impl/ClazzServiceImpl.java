package com.zx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zx.dao.ClazzDAO;
import com.zx.entity.Clazz;
import com.zx.entity.ClazzVo;
import com.zx.service.ClazzService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClazzServiceImpl extends ServiceImpl<ClazzDAO, Clazz> implements ClazzService {
    @Resource
    private ClazzDAO clazzDAO;

    @Override
    public List<ClazzVo> querryClazzVo() {
        return clazzDAO.selectClazzVo();
    }
}
