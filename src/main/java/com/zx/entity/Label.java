package com.zx.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

/**
 * label
 * @author 
 */
public class Label implements Serializable {
    /**
     * 唯一索引
     */
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    /**
     * 标签名
     */
    private String labelName;

    private static final long serialVersionUID = 1L;

    public Label() {
    }

    public Label(Integer id, String labelName) {
        this.id = id;
        this.labelName = labelName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }
}