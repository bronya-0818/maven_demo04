package com.zx.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * post_label_relationship
 * @author 
 */
@Data
public class PostLabelRelationship implements Serializable {
    /**
     * 唯一索引
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    /**
     * 文章id
     */
    private Integer postId;

    /**
     * 标签id
     */
    private Integer labelId;

    private static final long serialVersionUID = 1L;
}