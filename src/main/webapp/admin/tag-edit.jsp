<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String pathname = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
    pageContext.setAttribute("path", pathname);
%>
<html>
<head>
    <base href="<%=pathname %>"/>
    <meta charset="UTF-8">
    <!-- 移动端更好的适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dist/semantic/semantic.min.css">
    <link rel="stylesheet" href="css/my.css">
    <title>标签编辑</title>
</head>
<body>
<!-- 导航开始 -->
<nav class="ui inverted attached segment m-padded-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">管理后台</h2>
            <a href="admin/blog/list" class="m-item item m-mobile-hide"><i class="home icon"></i>博客</a>
            <a href="admin/type/list" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="admin/tag/list" class="active m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <img class="ui avatar image" src="${path}images/me.jpg" alt="">${loginUser.nickname}
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <a href="#" class="item">修改密码</a>
                        <a href="#" class="item">个人信息</a>
                        <a href="#" class="item">注销</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <a href="#" class="ui m-menu m-toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>
<!-- 二级导航 -->
<div class="ui attached pointing menu">
    <div class="ui container">
        <div class="right menu">
            <a href="admin/tag/list" class="item">列表</a>
            <a href="admin/tag/add" class="item">新增</a>
            <a href="admin/tag/list" class="active teal item">编辑</a>
        </div>
    </div>
</div>
<!-- 导航结束 -->


<!-- 中间内容开始 -->
<div class="m-container-small m-padded-massive">
    <div class="ui container m-padded-massive">
        <form action="admin/tag/edit" method="post" class="ui form m-padded-massive">
            <div class="field">
                <div class="ui left labeled input">
                    <label class="ui teal basic label">名称</label>
                    <input type="hidden" name="id" value="${label.id}">
                    <input type="text" name="labelName" placeholder="标签名称" value="${label.labelName}">
                </div>
            </div>

            <div class="ui error message"></div>
            <div style="color: red"> ${message}</div>
            <div class="ui right aligned container">
                <button type="button" class="ui button" onclick="window.history.go(-1)">返回</button>
                <button class="ui teal button">编辑</button>
            </div>

        </form>
    </div>
</div>
<!-- 中间内容结束 -->
<br>
<!-- 底部内容开始 -->
<footer class="ui inverted vertical segment m-padded-massive">
    <div class="ui center aligned container">
        <div class="ui inverted divided stackable grid">
            <div class="three wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="${path}images/wechat.png" class="ui rounded image" alt="" style="width: 110px"/>
                    </div>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">最新博客</h4>
                <div class="ui inverted link list">
                    <a class="item" href="#">用户故事（UserStory）</a>
                    <a class="item" href="#">用户故事（UserStory）</a>
                    <a class="item" href="#">用户故事（UserStory）</a>
                    <a class="item" href="#">用户故事（UserStory）</a>
                </div>
            </div>
            <div class="three wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">联系我</h4>
                <div class="ui inverted link list">
                    <a class="item" href="#">Email: 404069322@qq.com</a>
                    <a class="item" href="#">QQ: 404069322</a>
                </div>
            </div>
            <div class="seven wide column">
                <h4 class="ui inverted header m-text-thin m-text-spaced">介绍</h4>
                <p class="m-text-thin m-text-spaced m-opacity-mini">
                    这是我的个人博客，会分享关于编程、投资有关的任何内容，希望可以给大家带来帮助
                </p>
            </div>

        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin m-text-spaced m-opacity-tiny">Copyright 2021 - 2022 </p>
    </div>
</footer>
<!-- 底部内容结束 -->

<script src="${path}dist/jquery/jquery-3.4.1.min.js"></script>
<script src="${path}dist/semantic/semantic.min.js"></script>
<script>

    $('.m-menu.m-toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });

    $('.ui.dropdown').dropdown({
        on: 'hover'
    });

    /*-- 表单验证 --*/
    $('.ui.form').form({
        fields: {
            title: {
                identifier: 'title',
                rules: [{
                    type: 'empty',
                    prompt: '标题：请输入博客标题'
                }]
            }
        }
    });
</script>
</body>
</html>