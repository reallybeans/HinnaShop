<%-- 
    Document   : payment
    Created on : Jan 21, 2021, 2:32:42 AM
    Author     : leean
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css"> 
        <title>JSP Page</title>
    </head>
    <body>
        <form class="modal-content animate" style="border:none" action="MainController" method="GET"> 
            <div class="container" style="margin: 0; padding: 0;">


                <div style="width:50%;margin:150px auto;padding:50px 100px 50px 100px;background: cornsilk; font-family: serif; font-size: 30px;"> 

                    <h1 style="text-align: center;"><b>CHECK BILL</b></h1>
                    <hr style="border:3px solid black;">
                    <div style="padding-top:50px">
                        <label>
                            <b>Name: </b> ${sessionScope.LOGIN_NAME1}  
                        </label> 
                        <br>
                        <hr style="border:0.5px solid black;">
                        <label><b>Date oder: </b>
                            <small id="myDate"></small>
                            <script>
                                var myDate = new Date();
                                document.getElementById("myDate").innerHTML = myDate.getDate() + "/" + myDate.getMonth() + 1 + "/" + myDate.getFullYear();
                            </script>
                        </label>
                        <br>
                        <hr style="border:0.5px solid black;">
                        <label><b>Address: </b>${requestScope.ADDRESS}</label>
                        <br>
                        <hr style="border:0.5px solid black;">

                        <h1 style="font-size:70px;"><b>Total: </b> ${requestScope.TOTAL} $</h1> 
                    </div>
                    <c:if test="${empty requestScope.ANNOUCE_ORDER}">
                        <input type="hidden" name="txtAddress" value="${requestScope.ADDRESS}">
                        <input type="hidden" name="total" value="${requestScope.TOTAL}">
                        <button name="btnAction" value="Payment">pay</button>  
                        <button  name="btnAction" value="Back" style="width: 45%;height:50px;;" class="cancelbtn">Exit</button>
                    </c:if> 
                    <c:if test="${not empty requestScope.ANNOUCE_ORDER}">
                        <hr>
                        <small id="d" style="width:100%;margin:0;padding:0;background: cornsilk; font-family: serif; font-size: 24px" class="success">order ${requestScope.ANNOUCE_ORDER} has been paid successfully!</small>
                        <br>
                        <small style="width:100%;margin:0;padding:0;background: cornsilk; font-family: serif; font-size: 24px">Thanks bean! Want to buy another product? <a href="MainController?btnAction=Back&index=1">Click here!</a></small>
                        <script>
                            setInterval(function () {
                                document.getElementById("d").style.display = "none";
                            }, 3000);
                        </script>
                    </c:if>
                </div>    
            </div> 

        </form>

    </body>
</html>
