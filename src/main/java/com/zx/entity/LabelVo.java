package com.zx.entity;

import lombok.Data;

import java.io.Serializable;
@Data
public class LabelVo implements Serializable {
    private Integer id;

    /**
     * 标签名
     */
    private String labelName;

    private int postCount;

    private static final long serialVersionUID = 1L;
}
