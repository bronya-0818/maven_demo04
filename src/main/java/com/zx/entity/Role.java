package com.zx.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * role
 * @author 
 */
@Data
public class Role implements Serializable {
    /**
     * 唯一索引
     */
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    /**
     * 英文角色名
     */
    private String name;

    /**
     * 中文角色名
     */
    private String nameZh;

    private static final long serialVersionUID = 1L;
}