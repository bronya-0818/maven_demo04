package com.zx.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * clazz
 * @author 
 */
@Data
public class Clazz implements Serializable {
    /**
     * 唯一索引
     */
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    /**
     * 分类名
     */
    private String clazzName;

    private static final long serialVersionUID = 1L;

    }