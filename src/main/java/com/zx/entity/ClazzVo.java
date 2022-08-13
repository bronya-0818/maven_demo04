package com.zx.entity;

import lombok.Data;

import java.io.Serializable;
@Data
//序列化作用
public class ClazzVo implements Serializable {
    /**
     * 唯一索引
     */
    private Integer id;

    /**
     * 分类名
     */
    private String clazzName;

    private int postCount;

    private static final long serialVersionUID = 1L;
}
