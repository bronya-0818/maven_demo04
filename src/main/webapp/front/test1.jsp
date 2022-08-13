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
    <title>个人博客注册</title>
</head>
<body>
<style type="text/css">
    body {
        background-color: #DADADA;
    }

    body > .grid {
        height: 100%;
    }

    .image {
        margin-top: -100px;
    }

    .column {
        max-width: 450px;
    }
</style>
<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui teal image header">
            <!-- 不需要logo图标，故去除 -->
            <!--<img src="assets/images/logo.png" class="image" alt="">-->
            <div class="content">
                用户信息修改
            </div>
        </h2>
        <form class="ui large form" action="/doModify" method="post">
            <input type="hidden" name="id" value="${user.id}"  placeholder="账号">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="mobile alternate icon"></i>
                        <input type="text" name="account" value="${user.account}" placeholder="账号">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" value="${user.password}" placeholder="密码">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user outline icon"></i>
                        <input type="text" name="nickname" value="${user.id}" placeholder="昵称">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="envelope outline icon"></i>
                        <input type="text" name="email" placeholder="邮箱">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user circle outline icon"></i>
                        <input type="text" name="picture" placeholder="头像">
                    </div>
                </div>
                <div class="ui fluid large teal submit button">注册</div>
            </div>
            <div class="ui error mini message"></div>
            <div class="ui negative mini message" th:if="${param.error}" th:with="errorMsg=${session['SPRING_SECURITY_LAST_EXCEPTION'].message}">
                注册失败，请重试。
                <br/>
                失败原因：<span th:text="${errorMsg}">输入错误</span>
            </div>
        </form>
        <div class="ui message">
            已有账户? <a href="/front/login.jsp" th:href="@{/login}">登录</a>
        </div>
    </div>
</div>

<!--/*/<th:block th:replace="admin/_fragments :: script">/*/-->
<script src="${path}dist/jquery/jquery-3.4.1.min.js"></script>
<script src="${path}dist/semantic/semantic.min.js"></script>
<!--/*/</th:block>/*/-->
<script>
    $(document)
        .ready(function () {
            $('.ui.form')
                .form({
                    fields: {
                        account: {
                            identifier: 'account',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: '请输入账号'
                                }
                            ]
                        },
                        password: {
                            identifier: 'password',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: '请输入密码'
                                }
                            ]
                        },
                        nickname: {
                            identifier: 'nickname',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: '请输入昵称'
                                }
                            ]
                        },
                        email: {
                            identifier: 'email',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: '请输入邮箱'
                                },
                                {
                                    type: 'email',
                                    prompt: '邮箱格式有误'
                                }
                            ]
                        },
                    }
                })
            ;
        })
    ;
</script>
</body>
</html>