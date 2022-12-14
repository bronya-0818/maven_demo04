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
    <!-- 移动端更好的适应 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dist/semantic/semantic.min.css">
    <link rel="stylesheet" href="css/my.css">
    <title>归档</title>
</head>
<body>
<!-- 导航开始 -->
<nav th:replace="_fragments :: menu(4)" class="ui inverted attached segment m-padded-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">Blog</h2>
            <a href="#" class="m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="#" class="active m-item item m-mobile-hide"><i class="clone icon"></i>归档</a>
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
<div class="m-container-small m-padded-large">
    <div class="ui container">
        <!-- 中间内容上面的导航开始 -->
        <div class="ui top attached padded segment">
            <div class="ui middle aligned two column grid">
                <div class="column">
                    <h3 class="ui teal header">归档</h3>
                </div>
                <div class="right aligned column">
                    共 <h2 class="ui orange header m-inline-block m-text-thin"> 114 </h2> 篇博客
                </div>
            </div>
        </div>
        <!-- 中间内容上面的导航结束 -->

        <!-- 中间内容具体内容开始 -->
        <div class="ui teal segment">
            <h3 class="ui center aligned header">2017</h3>
            <div class="ui fluid vertical menu">
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui green basic left pointing label m-padded-mini">转载</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
            </div>
        </div>

        <div class="ui teal segment">
            <h3 class="ui center aligned header">2016</h3>
            <div class="ui fluid vertical menu">
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
            </div>
        </div>

        <div class="ui teal segment">
            <h3 class="ui center aligned header">2015</h3>
            <div class="ui fluid vertical menu">
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
                <a href="#" target="_blank" class="item">
                        <span>
                            <i class="small teal circle icon"></i>c++语言
                            <div class="ui teal basic left pointing label m-padded-mini">9月03日</div>
                        </span>
                    <div class="ui orange basic left pointing label m-padded-mini">原创</div>
                </a>
            </div>
        </div>

        <!-- 中间内容具体内容结束 -->
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
                        <img src="${path}images/wechat.png" class="ui rounded image"
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
</script>
</body>
</html>