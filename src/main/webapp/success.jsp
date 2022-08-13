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
    <title>成功</title>
</head>
<body>
    <h1>Success</h1>
    ${msg}
</body>
</html>
