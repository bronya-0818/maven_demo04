package com.zx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 查询条件
 * @author maple
 * @create 2022-07-11 9:08
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostQuery {

    private Integer id;
    private String title;
    private Integer userId;
    private String firstPicture;
    private String summary;
    private Integer mark;
    private String content;
    private Boolean recommendStatus;
    private Boolean rewardStatus;
    private Boolean copyrightStatus;
    private Boolean commentStatus;
    private Boolean publishStatus;
    private Integer readCount;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date updateTime;
    private Integer clazzId;
    private String clazzIds;
    private Integer labelId;
    private String labelIds;

    public PostQuery(Post post) {
        this.id = post.getId();
        this.title = post.getTitle();
        this.userId = post.getUserId();
        this.firstPicture = post.getFirstPicture();
        this.summary = post.getSummary();
        this.mark = post.getMark();
        this.content = post.getContent();
        this.recommendStatus = post.getRecommendStatus();
        this.rewardStatus = post.getRewardStatus();
        this.copyrightStatus = post.getCopyrightStatus();
        this.commentStatus = post.getCommentStatus();
        this.publishStatus = post.getPublishStatus();
        this.readCount = post.getReadCount();
        this.createTime = post.getCreateTime();
        this.updateTime = post.getUpdateTime();
    }
}
