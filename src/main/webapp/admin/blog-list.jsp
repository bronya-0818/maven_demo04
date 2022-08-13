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
    <title>博客管理</title>
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
            <a href="admin/blog/list" class="active teal item">列表</a>
            <a href="admin/blog/goAdd" class="item">新增</a>
            <a href="admin/blog/list" class="item">编辑</a>
        </div>
    </div>
</div>
<!-- 导航结束 -->


<!-- 中间内容开始 -->
<div class="m-container-small m-padded-massive">
    <div class="ui container m-padded-massive">
        <div class="ui success message" >
            <i class="close icon"></i>
            <div class="header">提示：</div>
            <p th:text="${message}">恭喜，操作成功！</p>
        </div>
        <!-- 中间内容上面的开搜索始 -->
        <form id="mySearch" action="admin/blog/search" method="post">
        <div class="ui secondary segment form">
            <!--当前页码-->
            <input type="hidden" name="pageNum" value="1">
            <div class="inline fields">
                <div class="field">
                    <input type="text" name="title" placeholder="标题">
                </div>
                <div class="field">
                    <div class="ui selection dropdown">
                        <input type="hidden" name="clazzId">
                        <i class="dropdown icon"></i>
                        <div class="default text">分类</div>
                        <div class="menu">
                            <div class="item" data-value="">全部</div>
                            <c:forEach items="${clazzList}" var="clazz">
                                <div class="item" data-value="${clazz.id}">${clazz.clazzName}</div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <div class="ui checkbox">
                        <input type="checkbox" id="recommendStatus" name="recommendStatus" checked>
                        <label for="recommendStatus">推荐</label>
                    </div>
                </div>
                <div class="field">
                    <button type="button" id="search-btn" class="ui mini teal basic button"><i class="search icon"></i>搜索
                    </button>
                </div>
            </div>
        </div>
        </form>
        <!-- 中间内容上面的搜索结束 -->

        <!-- 中间内容搜索结果开始 -->
        <div id="table-container">
            <table class="ui celled compact teal table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>标题</th>
                    <!--<th>类型</th>-->
                    <th>推荐</th>
                    <th>发布状态</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${postList.list}" var="post" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${post.title}</td>
                        <td>
                        <c:choose>
                            <c:when test="${post.recommendStatus}">是</c:when>
                            <c:otherwise>否</c:otherwise>
                        </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${post.publishStatus}">发布</c:when>
                                <c:otherwise>草稿</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatDate value="${post.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <a href="admin/blog/edit/${post.id}" class="ui mini teal basic button">编辑</a>
                            <a href="admin/blog/delete/${post.id}" class="ui mini red basic button">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <!-- 中间内容分页开始 -->
                <tfoot>
                <tr>
                    <th colspan="6">
                        <div class="ui mini pagination menu">
                            <a class="item" onclick="pagePrev(this)" data-pagenum="${postList.pageNum}">上一页</a>
                            <a class="item" onclick="pageNext(this)" data-pagenum="${postList.pageNum}" data-pages="${postList.pages}">下一页</a>
                        </div>
                        <a class="ui mini right floated teal basic button" href="admin/blog/goAdd">新增</a>
                    </th>
                </tr>
                </tfoot>
                <!-- 中间内容分页结束 -->
            </table>
        </div>
        <!-- 中间内容搜索结果结束 -->

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
<script>
    $('.m-menu.m-toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });

    $('.ui.dropdown').dropdown({
        on: 'hover'
    });
    //上一页
    function pagePrev(obj) {
        var pageNum = $(obj).data("pagenum");
        var page=(pageNum-1<1)?1:(pageNum-1); //上一页

        $("[name='pageNum']").val(page);
        
        loadData();
    }
    //下一页
    function pageNext(obj) {
        var pageNum = $(obj).data("pagenum"); //当前页码
        var pages = $(obj).data("pages"); //总页码
        var page=(pageNum+1>pages)?pages:(pageNum+1);

        $("[name='pageNum']").val(page);
        loadData();
    }

    $("#search-btn").click(function () {
        $("[name='pageNum']").val(1);
        loadData();
    });

    function loadData() {
        var num=$("[name=recommendStatus]").prop('checked') ? 1 : 0;
        $("#recommendStatus").val(num);
        $("#mySearch").submit();
    }

    // 关闭消息提示
    $('.message .close').click(function () {
        $(this).closest('.message').transition('fade');
    });
</script>
</body>
</html>