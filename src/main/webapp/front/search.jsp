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
    <link rel="stylesheet" href="dist/semantic/semantic.min.css" th:href="@{/dist/semantic/semantic.min.css}">
    <link rel="stylesheet" href="css/my.css" th:href="@{/css/my.css}">
    <title>搜索</title>
</head>
<body>
<!-- 导航开始 -->
<nav th:replace="_fragments :: menu(0)" class="ui inverted attached segment m-padded-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">Blog</h2>
            <a href="#" class="m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
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
<div class="m-container-small m-padded-large">
    <div class="ui container">
        <!-- 中间内容上面的导航开始 -->
        <div class="ui top attached segment">
            <div class="ui middle aligned two column grid">
                <div class="column">
                    <h3 class="ui teal header">搜索结果</h3>
                </div>
                <div class="right aligned column">
                    共 <h2 class="ui orange header m-inline-block m-text-thin" th:text="${postList.total}"> 14 </h2> 个
                </div>
            </div>
        </div>
        <!-- 中间内容上面的导航结束 -->

        <!-- 中间内容 搜索结果的内容开始 -->
        <div class="ui top attached teal segment">
            <div class="ui padded segment vertical m-padded-big m-mobile-lr-clear" th:each="post:${postList.list}">
                <div class="ui mobile reversed stackable grid">
                    <div class="eleven wide column">
                        <h3 class="ui header" th:text="${post.title}">JVM内存模型</h3>
                        <p class="m-text" th:text="|${post.summary}...|">&nbsp;&nbsp;&nbsp;最近学习了一下JVM的内存模型，本来想自己写一篇学习心得，总是觉得自己表达不清，然后就从学习资料里复制一段，写到最后发现，基本都是复制的写到最后发现，基本都是复制的</p>
                        <div class="ui stackable grid">
                            <div class="row">
                                <div class="eleven wide column">
                                    <div class="ui mini horizontal link list">
                                        <div class="item">
                                            <img src="${path}images/me.jpg" th:src="@{${post.picture}}" alt="头像" class="ui avatar image"/>
                                            <div class="content"><a href="#" class="header" th:text="${post.nickname}">吴慧华</a></div>
                                        </div>
                                        <div class="item">
                                            <i class="calendar icon"></i><span th:text="${#dates.format(post.updateTime,'yyyy-MM-dd')}">2020-01-01</span>
                                        </div>
                                        <div class="item">
                                            <i class="eye icon"></i><span th:text="${post.readCount}">1000</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="five wide column">
                        <a href="#" target="_blank">
                            <img src="${path}images/test2.jpg" th:src="@{${post.firstPicture}}" alt="首图" class="ui rounded m-image-size-square image">
                        </a>
                    </div>
                </div>
            </div>
            <!--/*-->
            <div class="ui padded segment vertical m-padded-big m-mobile-lr-clear">
                <div class="ui mobile reversed stackable grid">
                    <div class="eleven wide column">
                        <h3 class="ui header">JVM内存模型</h3>
                        <p class="m-text">&nbsp;&nbsp;&nbsp;最近学习了一下JVM的内存模型，本来想自己写一篇学习心得，总是觉得自己表达不清，然后就从学习资料里复制一段，写到最后发现，基本都是复制的写到最后发现，基本都是复制的</p>
                        <div class="ui stackable grid">
                            <div class="row">
                                <div class="eleven wide column">
                                    <div class="ui mini horizontal link list">
                                        <div class="item">
                                            <img src="${path}images/me.jpg" th:src="@{/images/me.jpg}" alt=""
                                                 class="ui avatar image"/>
                                            <div class="content"><a href="#" class="header">吴慧华</a></div>
                                        </div>
                                        <div class="item">
                                            <i class="calendar icon"></i> 2020-01-01
                                        </div>
                                        <div class="item">
                                            <i class="eye icon"></i> 1000
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="five wide column">
                        <a href="#" target="_blank">
                            <img src="${path}images/test2.jpg" th:src="@{/images/test2.jpg}" alt=""
                                 class="ui rounded m-image-size-square image">
                        </a>
                    </div>
                </div>
            </div>
            <div class="ui padded segment vertical m-padded-big m-mobile-lr-clear">
                <div class="ui mobile reversed stackable grid">
                    <div class="eleven wide column">
                        <h3 class="ui header">JVM内存模型</h3>
                        <p class="m-text">&nbsp;&nbsp;&nbsp;最近学习了一下JVM的内存模型，本来想自己写一篇学习心得，总是觉得自己表达不清，然后就从学习资料里复制一段，写到最后发现，基本都是复制的写到最后发现，基本都是复制的</p>
                        <div class="ui stackable grid">
                            <div class="row">
                                <div class="eleven wide column">
                                    <div class="ui mini horizontal link list">
                                        <div class="item">
                                            <img src="${path}images/me.jpg" alt="" class="ui avatar image"/>
                                            <div class="content"><a href="#" class="header">吴慧华</a></div>
                                        </div>
                                        <div class="item">
                                            <i class="calendar icon"></i> 2020-01-01
                                        </div>
                                        <div class="item">
                                            <i class="eye icon"></i> 1000
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="five wide column">
                        <a href="#" target="_blank">
                            <img src="${path}images/test2.jpg" alt="" class="ui rounded m-image-size-square image">
                        </a>
                    </div>
                </div>
            </div>
            <!--*/-->
        </div>
        <!-- 中间内容 搜索结果的内容结束 -->
        <!-- 中间内容底部的翻页效果开始 -->
        <div class="ui bottom attached segment">
            <div class="ui middle aligned two column grid">
                <div class="column">
                    <a href="#" class="ui mini teal basic button" th:href="@{/search/(keyword=${keyword},pageNum=(${postList.pageNum}-1<1?1:${postList.pageNum}-1))}">上一页</a>
                </div>
                <div class="right aligned column">
                    <a href="#" class="ui mini teal basic button" th:href="@{/search/(keyword=${keyword},pageNum=(${postList.pageNum}+1>${postList.pages}?${postList.pages}:${postList.pageNum}+1))}">下一页</a>
                </div>
            </div>
        </div>
        <!-- 中间内容底部的翻页效果结束 -->

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


<script src="${path}dist/jquery/jquery-3.4.1.min.js"></script>
<script src="${path}dist/semantic/semantic.min.js"></script>

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