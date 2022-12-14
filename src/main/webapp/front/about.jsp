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
    <title>关于我</title>
</head>
<body>
<!-- 导航开始 -->
<nav th:replace="_fragments :: menu(5)" class="ui inverted attached segment m-padded-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">Blog</h2>
            <a href="#" class="m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="#" class="active m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="clone icon"></i>归档</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
            <div class="right m-item item m-mobile-hide">
                <div class="ui action input">
                    <input type="text" placeholder="输入关键字">
                    <button class="ui button">搜索</button>
                </div>
            </div>
        </div>
    </div>

    <a href="#" class="ui m-menu m-toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>
<!-- 导航结束 -->


<!-- 中间内容开始 -->
<div class="m-container m-padded-large">
    <div class="ui container">
        <div class="ui stackable grid">
            <div class="eleven wide column">
                <div class="ui teal segment">
                    <img src="${path}images/me.jpg" th:src="@{/images/me.jpg}" alt="" class="ui rounded image"/>
                </div>
            </div>
            <div class="five wide column">
                <div class="ui top teal attached segment">
                    <div class="ui center aligned header">关于我</div>
                </div>
                <div class="ui attached segment">
                    <p class="m-text">吴慧华，广西科技大学，一个编程的爱好者,广西科技大学，一个编程的爱好者,广西科技大学，一个编程的爱好者</p>
                    <p class="m-text">吴慧华，广西科技大学，一个编程的爱好者</p>
                </div>
                <div class="ui attached segment">
                    <div class="ui orange left pointing basic label m-margin-bottom-small">编程</div>
                    <div class="ui orange left pointing basic label m-margin-bottom-small">编程</div>
                    <div class="ui orange left pointing basic label m-margin-bottom-small">编程</div>
                    <div class="ui orange left pointing basic label m-margin-bottom-small">编程</div>
                </div>
                <div class="ui attached segment">
                    <div class="ui teal left pointing basic label m-margin-bottom-small">java</div>
                    <div class="ui teal left pointing basic label m-margin-bottom-small">python</div>
                    <div class="ui teal left pointing basic label m-margin-bottom-small">springboot</div>
                    <div class="ui teal left pointing basic label m-margin-bottom-small">spring</div>
                    <div class="ui teal left pointing basic label m-margin-bottom-small">mysql</div>
                    <div class="ui teal left pointing basic label m-margin-bottom-small">springmvc</div>
                    <div class="ui teal left pointing basic label m-margin-bottom-small">mybatis</div>
                    <div class="ui teal left pointing basic label m-margin-bottom-small">shiro</div>
                </div>
                <div class="ui button attached segment right">
                    <a href="#" class="ui circular icon button m-margin-left-small"><i class="github icon"></i></a>
                    <a href="#" class="ui wechat circular icon button m-margin-left-small"><i
                            class="weixin icon"></i></a>
                    <a href="#" class="ui qq circular icon button m-margin-left-small" data-content="404069322"
                       data-position="bottom center"><i class="qq icon"></i></a>
                </div>
                <div class="ui wechatQR flowing popup transition hidden">
                    <img src="${path}images/wechat.png" th:src="@{/images/wechat.png}" class="ui rounded image"
                         style="width: 100px" alt=""/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 中间内容结束 -->
<br>
<!-- 底部内容开始 -->
<footer th:replace="_fragments :: footer" class="ui inverted vertical segment m-padded-massive">
    <div class="ui center aligned container">
        <div class="ui inverted divided stackable grid">
            <div class="three wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <img src="${path}images/wechat.png" th:src="@{/images/wechat.png}" class="ui rounded image"
                             alt="" style="width: 110px"/>
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

<!--/*/<th:block th:replace="_fragments :: script">/*/-->
<script src="${path}dist/jquery/jquery-3.4.1.min.js" th:src="@{/dist/jquery/jquery-3.4.1.min.js}"></script>
<script src="${path}dist/semantic/semantic.min.js" th:src="@{/dist/semantic/semantic.min.js}"></script>
<!--/*/</th:block>/*/-->
<script>
    $('.m-menu.m-toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on: 'hover'
    });
    $('.wechat').popup({
        popup: $('.wechatQR'),
        on: 'hover',
        position: 'bottom center'
    });
    $('.qq').popup();
</script>
</body>
</html>