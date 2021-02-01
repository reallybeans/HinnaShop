<%-- 
    Document   : pass
    Created on : Jan 15, 2021, 11:30:52 AM
    Author     : leean
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="get">
            <c:if test="${empty sessionScope.LOGIN_NAME}">
                <c:redirect url="paging?index=1"></c:redirect>
            </c:if>
        </form>

    </body>
</html>
