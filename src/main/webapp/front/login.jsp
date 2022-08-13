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
    <title>个人博客登录</title>
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
                用户登录
            </div>
        </h2>
        <form class="ui large form" action="doLogin" method="post">
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="account" placeholder="用户名">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="密码">
                    </div>
                </div>
                <div class="ui fluid large teal submit button">登录</div>
            </div>
            <div class="ui error mini message"></div>
            <span style="color: red">${msg}</span>
        </form>
        <div class="ui message">
            新用户? <a href="front/register.jsp">注册</a>
        </div>
    </div>
</div>
<script src="${path}dist/jquery/jquery-3.4.1.min.js"></script>
<script src="${path}dist/semantic/semantic.min.js"></script>
<script>
    $(document)
        .ready(function () {
            $('.ui.form')
                .form({
                    fields: {
                        username: {
                            identifier: 'username',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: '请输入用户名'
                                }
                            ]
                        },
                        password: {
                            identifier: 'password',
                            rules: [
                                {
                                    type: 'empty',
                                    prompt: '请输入密码'
                                    // 不需要密码长度验证，故去除
                                    // },
                                    // {
                                    //     type: 'length[6]',
                                    //     prompt: 'Your password must be at least 6 characters'
                                }
                            ]
                        }
                    }
                })
            ;
        })
    ;
</script>
</body>
</html>