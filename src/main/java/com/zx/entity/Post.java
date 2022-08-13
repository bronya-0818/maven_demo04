package com.zx.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * post
 * @author 
 */
@Data
@NoArgsConstructor
public class Post implements Serializable {
    /**
     * 唯一索引
     */
    @TableId(value="id",type = IdType.AUTO)
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 用户id
     */
//    @TableField(value = "user_id")
//    private User userId;
    private Integer userId;
    /**
     * 首图
     */
    private String firstPicture;

    /**
     * 概述
     */
    private String summary;

    /**
     * 标记
     */
    private Integer mark;

    /**
     * 正文
     */
    private String content;

    /**
     * 推荐状态
     */
    private Boolean recommendStatus;

    /**
     * 打赏状态
     */
    private Boolean rewardStatus;

    /**
     * 版权状态
     */
    private Boolean copyrightStatus;

    /**
     * 评论状态
     */
    private Boolean commentStatus;

    /**
     * 发布状态
     */
    private Boolean publishStatus;

    /**
     * 阅读量
     */
    private Integer readCount;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;


    public Post(PostQuery postQuery) {
        this.id = postQuery.getId();
        this.title = postQuery.getTitle();
        this.userId = postQuery.getUserId();
        this.firstPicture = postQuery.getFirstPicture();
        this.summary = postQuery.getSummary();
        this.mark = postQuery.getMark();
        this.content = postQuery.getContent();
        this.recommendStatus = postQuery.getRecommendStatus();
        this.rewardStatus = postQuery.getRewardStatus();
        this.copyrightStatus = postQuery.getCopyrightStatus();
        this.commentStatus = postQuery.getCommentStatus();
        this.publishStatus = postQuery.getPublishStatus();
        this.readCount = postQuery.getReadCount();
        this.createTime = postQuery.getCreateTime();
        this.updateTime = postQuery.getUpdateTime();
    }
}