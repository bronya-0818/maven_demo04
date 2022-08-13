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
    <title>首页</title>
</head>
<body>
<!-- 导航开始 -->
<nav class="ui inverted attached segment m-padded-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">Blog</h2>
            <a href="#" class="m-item item m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="idea icon"></i>分类</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="tags icon"></i>标签</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="clone icon"></i>归档</a>
            <a href="#" class="m-item item m-mobile-hide"><i class="info icon"></i>关于我</a>
            <a href="/admin/index.jsp" class="m-item item m-mobile-hide"><i class="info icon"></i>后台</a>
            <div class="m-item item m-mobile-hide">
                <form name="search-form" action="/search" method="get" target="_blank">
                    <div class="ui icon inverted input m-margin-tb tiny">
                        <input type="text" name="keyword" placeholder="搜索">
                        <i class="search link icon" onclick="document.forms['search-form'].submit()"></i>
                    </div>
                </form>
            </div>



            <c:choose>
                <c:when test="${flagLogin}">
                    <div class="right m-item m-mobile-hide menu">
                        <div class="ui dropdown item">
                            <img class="ui avatar image" src="${path}images/me.jpg" alt="">${loginUser.nickname}
                            <i class="dropdown icon"></i>
                            <div class="menu">
                                <a href="#" class="item">修改密码</a>
                                <a href="/goModify/${loginUser.id}" class="item">个人信息</a>
                                <a href="/exit" class="item">注销</a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="right m-item m-mobile-hide menu">
                        <div class="item">
                            <a class="ui button" href="front/login.jsp">登录</a>
                        </div>
                        <div class="item">
                            <a class="ui primary button" href="front/register.jsp">注册</a>
                        </div>
                    </div>

                </c:otherwise>
            </c:choose>


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

            <!-- 中间内容左边开始 -->
            <div class="eleven wide column">

                <!-- 中间内容上面的导航开始 -->
                <div class="ui top attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <h3 class="ui teal header">博客</h3>
                        </div>
                        <div class="right aligned column">
                            共 <h2 class="ui orange header m-inline-block m-text-thin" th:text="${postList.tota}">
                            14 </h2> 篇
                        </div>
                    </div>
                </div>
                <!-- 中间内容上面的导航结束 -->

                <!-- 中间内容中间的具体的博客信息开始 -->
                <div class="ui attached teal segment">
                    <div class="ui padded vertical segment m-padded-big">
                        <c:forEach items="${postList_test1}" var="post">
                            <div class="ui middle aligned mobile reversed stackable grid">
                                <div class="eleven wide column">
                                    <h3 class="ui header"><a href="#" class="m-black"
                                                             th:href="@{/blog/detail/{id}(id=${post.id})}">${post.title}</a>
                                    </h3>
                                    <p class="m-text">&nbsp;${post.summary}</p>
                                    <div class="ui stackable grid">
                                        <div class="eleven wide column">
                                            <div class="ui mini horizontal link list">
                                                <div class="item">
                                                        <%--                                                <img src="${path}images/me.jpg" src="${post.picture}" alt="头像" class="ui avatar image"/>--%>
                                                    <img src="${path}images/me.jpg" alt="头像" class="ui avatar image"/>
<%--                                                    <div class="content"><a href="#" class="header">${post.userId.nickname}</a>--%>
                                                            <div class="content"><a href="#" class="header"></a>
                                                    </div>

                                                </div>
                                                <div class="item">
                                                    <i class="calendar icon"></i><span>2020-01-01</span>
                                                </div>
                                                <div class="item">
                                                    <i class="eye icon"></i><span>${post.readCount}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <!--多分类，故不显示-->
                                        <!--<div class="right aligned five wide column">-->
                                        <!--    <a href="#" target="_blank" class="ui teal basic m-padded-all-mini m-text-thin label" >学习笔记</a>-->
                                        <!--</div>-->
                                    </div>
                                </div>
                                <div class="five wide column">
                                    <a href="#" target="_blank">
                                        <img src="${path}images/test1.jpg" alt="首图"
                                             class="ui rounded m-image-size-square image">
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!--/*-->
                    <!--*/-->
                </div>
                <!-- 中间内容中间的具体的博客信息结束 -->

                <!-- 中间内容底部的翻页效果开始 -->
                <div class="ui bottom attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <a href="#" class="ui mini teal basic button"
                               th:href="@{/(pageNum=(${postList.pageNum}-1<1?1:${postList.pageNum}-1))}">上一页</a>
                        </div>
                        <div class="right aligned column">
                            <a href="#" class="ui mini teal basic button"
                               th:href="@{/(pageNum=(    >${postList.pages}?${postList.pages}:${postList.pageNum}+1))}">下一页</a>
                        </div>
                    </div>
                </div>
                <!-- 中间内容底部的翻页效果结束 --->

            </div>
            <!-- 中间内容左边结束 -->

            <!-- 中间内容右边开始 -->
            <div class="five wide column">
                <!-- 中间内容右边分类模块开始 -->
                <div class="ui segments">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="idea icon"></i>分类
                            </div>
                            <div class="right aligned column">
                                <a href="#" target="_blank" th:href="@{/type/list}">MORE <i
                                        class="angle double right icon"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="ui teal segment">
                        <div class="ui fluid vertical menu">
                            <c:forEach items="${clazzVoList}" var="clazz">
                                <a href="type/list/${clazz.id}" class="item">
                                    <span>${clazz.clazzName}</span>
                                    <div class="ui teal basic left pointing label">${clazz.postCount}</div>
<%--                                    <div class="ui teal basic left pointing label">999</div>--%>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- 中间内容右边分类模块结束 -->

                <!-- 中间内容右边标签模块开始 -->
                <div class="ui segment m-margin-top-large">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="tags icon"></i>标签
                            </div>
                            <div class="right aligned column">
                                <a href="#" target="_blank">MORE <i class="angle double right icon"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="ui teal segment">
                        <c:forEach items="${labelVoList}" var="label">
                            <a href="#" target="_blank" class="ui teal basic left pointing label m-margin-small">
                                <span>${label.labelName}</span>
                                <div class="detail">${label.postCount}</div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <!-- 中间内容右边标签模块结束 -->

                <!-- 中间内容右边最新推荐模块开始 -->
                <div class="ui segments m-margin-top-large">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="bookmark icon"></i>最新推荐
                            </div>
                        </div>
                    </div>

                    <div class="ui teal segment">
                        <div class="ui fluid vertical menu">
                            <c:forEach items="${newPostList}" var="newPost">
                                <a href="#" target="_blank" class="item m-text-thin">
                                    <span>${newPost.title}</span>
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- 中间内容右边最新推荐模块结束 -->

                <!-- 中间内容右边二维码模块开始 -->
                <h4 class="ui horizontal divider header">扫码关注我</h4>
                <div class="ui centered card" style="width: 11em">
                    <img src="${path}images/wechat.png" alt="" class="rounded image"
                         style="width: 11em"/>
                </div>
                <!-- 中间内容右边二维码模块结束 -->
            </div>
            <!-- 中间内容右边结束 -->

        </div>
    </div>
</div>
<!-- 中间内容结束 -->

<!-- 底部内容开始 -->
<footer th:replace="_fragments :: footer" class="ui inverted vertical segment m-padded-massive">
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
</script>
</body>
</html>