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
    <link rel="stylesheet" href="lib/editormd/css/editormd.min.css">
    <link rel="stylesheet" href="css/my.css">
    <title>博客编辑</title>
</head>
<body>
<!-- 导航开始 -->
<nav class="ui inverted attached segment m-padded-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">管理后台</h2>
            <a href="admin/blog/list" class="active m-item item m-mobile-hide"><i class="home icon"></i>博客</a>
            <a href="admin/type/list" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="admin/tag/list" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <img class="ui avatar image" src="${path}images/me.jpg" th:src="@{/images/me.jpg}" alt="">${loginUser.nickname}
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
            <a href="admin/blog/list" class="item">列表</a>
            <a href="admin/blog/goAdd" class="item">新增</a>
            <a href="admin/blog/list" class="active teal item">编辑</a>
        </div>
    </div>
</div>
<!-- 导航结束 -->


<!-- 中间内容开始 -->
<div class="m-container m-padded-large">
    <div class="ui container">
        <form id="post-form" action="admin/blog/edit" method="post" class="ui form">
            <input type="hidden" name="id" value="${post.id}">
            <input type="hidden" name="userId" value="${loginUser.id}">
            <input type="hidden" name="publishStatus">
            <div class="required field">
                <div class="ui left labeled input">
                    <div class="ui selection compact teal basic dropdown label">
                        <input type="hidden" name="mark" value="1" value="${post.mark}">
                        <i class="dropdown icon"></i>
                        <div class="text">原创</div>
                        <div class="menu">
                            <div class="item" data-value="0">转载</div>
                            <div class="item" data-value="1">原创</div>
                        </div>
                    </div>
                    <input type="text" name="title" placeholder="标题" value="${post.title}">
                </div>
            </div>

            <div class="field">
                <div id="md-content" style="z-index: 1 !important">
                    <textarea placeholder="博客内容" name="content" style="display: none;">${post.content}</textarea>
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <div class="ui left labeled action input">
                        <label class="ui compact teal basic label">分类</label>
                        <div class="ui fluid selection dropdown multiple">
                            <input type="hidden" name="clazzIds" value="${post.clazzIds}">
                            <i class="dropdown icon"></i>
                            <div class="default text">分类</div>
                            <div class="menu">
                                <c:forEach items="${clazzList}" var="clazz">
                                    <div class="item" data-value="${clazz.id}">${clazz.clazzName}</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <div class="ui left labeled action input">
                        <label class="ui compact teal basic label">标签</label>
                        <div class="ui fluid selection dropdown multiple">
                            <input type="hidden" name="labelIds" value="${post.labelIds}">
                            <i class="dropdown icon"></i>
                            <div class="default text">标签</div>
                            <div class="menu">
                                <c:forEach items="${labelList}" var="label">
                                    <div class="item" data-value="${label.id}">${label.labelName}</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="field">
                <div class="ui left labeled input">
                    <label class="ui teal basic label">首图</label>
                    <input type="text" name="firstPicture" placeholder="首图引用地址" value="${post.firstPicture}">
                </div>
            </div>

            <div class="required field">
                <textarea name="summary"  placeholder="博客描述..." maxlength="200">${post.summary}</textarea>
            </div>

            <div class="inline fields">
                <div class="field">
                    <div class="ui checkbox">
                        <input type="hidden" name="recommendStatus">
                        <input type="checkbox" id="recommend" name="recommend" class="hidden" checked="${post.recommendStatus}">
                        <label for="recommend">推荐</label>
                    </div>
                </div>
                <div class="field">
                    <div class="ui checkbox">
                        <input type="hidden" name="rewardStatus">
                        <input type="checkbox" id="reward" name="reward" class="hidden" checked="${post.rewardStatus}">
                        <label for="reward">打赏</label>
                    </div>
                </div>
                <div class="field">
                    <div class="ui checkbox">
                        <input type="hidden" name="copyrightStatus">
                        <input type="checkbox" id="copyright" name="copyright" class="hidden" checked="${post.copyrightStatus}">
                        <label for="copyright">版权</label>
                    </div>
                </div>
                <div class="field">
                    <div class="ui checkbox">
                        <input type="hidden" name="commentStatus">
                        <input type="checkbox" id="comment" name="comment" class="hidden" checked="${post.commentStatus}">
                        <label for="comment">评论</label>
                    </div>
                </div>
            </div>

            <div class="ui error message">${message}</div>

    <%--        <div class="ui negative message">
                <div class="header">验证失败</div>
                <p th:text="${message}">输入参数有误</p>
            </div>--%>

            <div class="ui right aligned container">
                <button type="button" class="ui button" onclick="window.history.go(-1)">返回</button>
                <button id="save-btn" class="ui secondary button">保存</button>
                <button id="publish-btn" class="ui teal button">发布</button>
            </div>

        </form>
    </div>
</div>
<!-- 中间内容结束 -->
<br>
<!-- 底部内容开始 -->
<footer th:replace="admin/_fragments :: footer" class="ui inverted vertical segment m-padded-massive">
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
<script src="${path}lib/editormd/editormd.min.js"></script>
<script th:inline="javascript">

    /** 初始化editormd **/
    let contentEditor;
    $(function () {
        contentEditor = editormd("md-content", {
            width: "100%",
            height: 640,
            syncScrolling: "single",
            path: "lib/editormd/lib/"
        });
    });


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

    $("#save-btn").click(function (){
        $("[name='publishStatus']").val(false);
        $("[name='recommendStatus']").val($("[name='recommend']").is(':checked'));
        $("[name='rewardStatus']").val($("[name='reward']").is(':checked'));
        $("[name='copyrightStatus']").val($("[name='copyright']").is(':checked'));
        $("[name='commentStatus']").val($("[name='comment']").is(':checked'));
        $("#post-form").submit();
    });

    $("#publish-btn").click(function (){
        $("[name='publishStatus']").val(true);
        $("[name='recommendStatus']").val($("[name='recommend']").is(':checked'));
        $("[name='rewardStatus']").val($("[name='reward']").is(':checked'));
        $("[name='copyrightStatus']").val($("[name='copyright']").is(':checked'));
        $("[name='commentStatus']").val($("[name='comment']").is(':checked'));
        $("#post-form").submit();
    });
</script>
</body>
</html>