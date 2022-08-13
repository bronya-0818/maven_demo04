package com.zx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zx.dao.PostLabelRelationshipDAO;
import com.zx.entity.PostLabelRelationship;
import com.zx.service.PostLabelRelationshipService;
import org.springframework.stereotype.Service;

@Service
public class PostLabelRelationshipServiceImpl extends ServiceImpl<PostLabelRelationshipDAO, PostLabelRelationship>
        implements PostLabelRelationshipService {
}
