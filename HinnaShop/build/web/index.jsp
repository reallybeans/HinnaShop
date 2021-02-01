<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
    <head>
        <title>index</title>
    </head>
    <body>
        <h1>Index</h1>

        <form action="MainController" method="get"> 
            <input type="hidden" value="${requestScope.email}" name="txtEmail" />
            <c:redirect url="LoginController?txtEmail=${requestScope.email}"></c:redirect>
        </form>
    </body>
</html>