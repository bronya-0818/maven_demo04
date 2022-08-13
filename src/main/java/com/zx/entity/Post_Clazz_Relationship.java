package com.zx.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
@Data
@TableName("post_clazz_relationship")
public class Post_Clazz_Relationship implements Serializable {
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    private Integer post_id;

    private Integer clazz_id;


    private static final long serialVersionUID = 1L;

}
