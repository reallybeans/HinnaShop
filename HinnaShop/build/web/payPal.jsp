<%-- 
    Document   : cart
    Created on : 18-Jan-2021, 11:26:36
    Author     : SE140331
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tag" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <body>
       

        <fieldset>
            <legend>Thanh toán qua cổng PayPal</legend>
            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                <!-- Nhập địa chỉ email người nhận tiền (người bán) -->
                <input type="hidden" name="business" value="adminnhan@gmail.com">

                <!-- tham số cmd có giá trị _xclick chỉ rõ cho paypal biết là người dùng nhất nút thanh toán -->
                <input type="hidden" name="cmd" value="_xclick">

                <!-- Thông tin mua hàng. -->
                <input type="hidden" name="item_name" value="${sessionScope.LOGIN_USER.getFullname()}">
                <!--Trị giá của giỏ hàng, vì paypal không hỗ trợ tiền việt nên phải đổi ra tiền $-->
                <input type="hidden" name="amount" placeholder="Nhập số tiền vào" value="${pageScope.totalCart}">
                <!--Loại tiền-->
                <input type="hidden" name="currency_code" value="USD">
                <!--Đường link mình cung cấp cho Paypal biết để sau khi xử lí thành công nó sẽ chuyển về theo đường link này-->
                <input type="hidden" name="return" value="http://localhost:8084/J3.L.P0013.Hana-Shop-SE140331/PayPalController">
                <!--Đường link mình cung cấp cho Paypal biết để nếu  xử lí KHÔNG thành công nó sẽ chuyển về theo đường link này-->
                <input type="hidden" name="cancel_return" value="http://localhost:8084/J3.L.P0013.Hana-Shop-SE140331/userCart.jsp">
                <!-- Nút bấm. -->
                <input type="submit" name="submit" value="Thanh toán quay Paypal">
            </form>
        </fieldset>       

  

<!-- Recommand -->
 
</body>
</html>