package com.zx.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * 返回结果存在的
 * 博文的实体类(博客 分类 标签 评论)
 * @author maple
 * @create 2022-07-11 9:02
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostVo {
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
    private Date createTime;
    private Date updateTime;
    private Integer clazzId;
    private String clazzName;
    private String nickname;
    private String picture;
    private List<String> labelNameList;
}
