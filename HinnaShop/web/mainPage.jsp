<%-- 
    Document   : login
    Created on : Jan 8, 2021, 4:00:15 PM
    Author     : leean
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/pay.css">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="73193271086-omsvbt603d68bv4mlslo8hejh084hbd0.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            font-family: "Karma", sans-serif
        }

        .w3-bar-block .w3-bar-item {
            padding: 20px
        }
    </style>

    <body> 

        <c:if test="${not empty sessionScope.LOGIN_NAME}">
            <c:redirect url="managerPage.jsp"></c:redirect>
        </c:if> 
        <!-- Sidebar (hidden by default) -->
        <nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left"
             style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button">Close Menu</a>
            <form action="MainController" style="border:none">
                <a href="paging?index=1#food" onclick="w3_close()" value="Paging" name="btnAction" class="w3-bar-item w3-button">Food</a> 
            </form>
            <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">About</a>
            <a href="#search" onclick="w3_close()" class="w3-bar-item w3-button">Search</a>  
            <c:if test="${empty sessionScope.LOGIN_NAME1}">
                <button class="w3-bar-item w3-button" style="margin:0; border: 0.5px solid black;" onclick="signin_open(), w3_close()">Sign In</button>
            </c:if>  

            <c:if test="${not empty sessionScope.LOGIN_NAME1}">
                <!--                <button class="w3-bar-item w3-button" style="margin:0; border: none;" onclick=" his_open(), w3_close()">History</button>-->

                <a href="HistoryController?index=1" onclick="w3_close()" class="w3-bar-item w3-button">History</a>
                <a href="#food" onclick="w3_open1(), w3_close()" class="w3-bar-item w3-button">Shopping cart</a>
                <form action="MainController" method="post" style="border:0.5px solid black">
                    <button onclick="w3_close()" name="btnAction" value="Sign Out" style="margin:0;" class="w3-bar-item w3-button">Sign Out</button>
                </form>
            </c:if> 
        </nav> 
        <!-- Top menu -->
        <div class="w3-top">
            <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto">
                <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
                <div class="w3-right w3-padding-16 "> 

                    <img class="cart" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHfytOMSWsjsjBHpjBpFeoi3c-XD5GFXU7yQ&usqp=CAU" style="width:30px;padding:2px; cursor: pointer; margin:0px 10px 10px 0px;"onclick="w3_open1()">
                    <c:if test="${empty sessionScope.LOGIN_NAME1}">Welcome!</c:if>
                    <c:if test="${not empty sessionScope.LOGIN_NAME1}">Hi! ${sessionScope.LOGIN_NAME1}</c:if>  

                    </div>
                    <div class="w3-center w3-padding-16">Hana Shop
                        <!--                    <img src="https://images.zeald.com/site/texaschickennz/images/thumb-big-club-burger.png" alt="Avartar" class="avatar" style="width:40px;">--> 
                    </div>
                </div>
            </div>
            <!--SHOPING CART-->
        </div> 
    <c:if test="${not empty sessionScope.LOGIN_NAME1}">

        <nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left"
             style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar1">
            <span onclick="w3_close1()" class="close"
                  title="Close Modal">&times;</span>

            <br>
            <!--PAYMENT-->
            <div style="width:100%; text-align: center; vertical-align:middle;">
                <c:if test="${empty sessionScope.CART.getCart().values()}">
                    <p>No order to display</p>
                </c:if>
                <c:if test="${not empty sessionScope.CART.getCart().values()}">  
                    <c:forEach var="cart" items="${sessionScope.CART.getCart().values()}"> 
                        <form action="MainController" style="border:none;" method="get" >
                            <hr>
                            <img style="width:10%;" src="${cart.img}"> 
                            <p style="width:30%; display: inline-block; margin-left: 20px;">${cart.productName}</p>
                            <span style="width:5%; margin-left: 20px;">X</span>
                            <input type="number" name="txtQuantity" value="${cart.quanlity}" min="1" style="font-size: 30px; width: 15%;"> 
                            <span id="detailPrices" style="width:5%; margin-left: 20px;">${cart.price} $</span>
                            <input type="hidden" name="img" value="${cart.img}" >
                            <input type="hidden" name="productID" value="${cart.productID}" >
                            <input type="hidden" name="productName" value="${cart.productName}" >
                            <input type="hidden" name="price" value="${cart.price}" >
                            <input type="hidden" name="index" value="${param.index}"/>

                            <c:if test="${not empty sessionScope.LIST_SEARCH}">
                                <input type="hidden" name="txtSearch" value="${requestScope.txtSearch}"/>
                                <input type="hidden" name="txtPriceS" value="${requestScope.txtPriceS}"/>
                                <input type="hidden" name="txtCate" value="${requestScope.txtCate}"/>
                                <button name="btnAction" value="UpdateCartbySearch"style="width:50px; background:none;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB1z-RB3O2Ka78p0T1IY3jtWQplDomRUSF1w&usqp=CAU"style="width:20px;"></button>                 
                                <button name="btnAction" onclick="return myFunctionConfirm()" value="DeleteCartbySearch" style="width:50px; background:none;"><img src="https://egsgroup.files.wordpress.com/2017/03/cross-or-wrong.jpg" style="width:20px;"></button>

                            </c:if>
                            <c:if test="${empty sessionScope.LIST_SEARCH}">
                                <button name="btnAction" value="UpdateCart"style="width:50px; background:none;"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB1z-RB3O2Ka78p0T1IY3jtWQplDomRUSF1w&usqp=CAU"style="width:20px;"></button>                 
                                <button onclick="return myFunctionConfirm()" name="btnAction" value="DeleteCart" style="width:50px; background:none;"><img src="https://egsgroup.files.wordpress.com/2017/03/cross-or-wrong.jpg" style="width:20px;"></button>

                            </c:if>
                            <c:if test="${requestScope.NAME_ANNOUCE == cart.productName}">
                                <c:if test="${not empty requestScope.ANNOUCE}">
                                    <small style="color:lightgreen">Update Successfully!</small> 
                                </c:if>
                                <c:if test="${not empty requestScope.ANNOUCE_FAILURE}">
                                    <small style="color:red">You have purchased all current products!</small>  
                                </c:if> 
                            </c:if>
                            <c:if test="${sessionScope.ERROR_NAME == cart.productName}">
                                <c:if test="${not empty sessionScope.ANNOUCE_EMPTY}">
                                    <small style="color:red">This ${sessionScope.ERROR_NAME} Out of stock! Delete it and try other.</small>  
                                    <script>document.getElementById("mySidebar1").style.display = "block";</script>
                                </c:if>
                            </c:if>


                            <c:set var = "detailPrice" scope = "request" value = "${cart.quanlity*cart.price}"/>   
                            <c:set var = "total" scope = "request" value = "${total+detailPrice}"/> 
                        </form> 
                    </c:forEach>
                </div> 
                <hr style="border-top: 10px solid black">
                <h3 style="float:right; margin-right: 5rem;">Total: 
                    <span id="total" name="txtTotal" value="${param.total}"></span></h3>  
                <button onclick="pay_open()" style=" background: grey; display: block; margin-top: 100px;">Payment</button> 
                <!--LOAD CART-->
                <div id="id02" class="modal" style="display:none">
                    <span onclick="document.getElementById('id02').style.display = 'none'" class="close"
                          title="Close Modal">&times;</span>

                    <hr style="border-top: 10px solid black">
                    <div class="checkout-loading">
                        <div class="checkout-head"style="color:white;">
                            <svg class="shopping-icon" viewBox="0 0 24 24" >
                            <path fill="#ffffff55" d="M17,18A2,2 0 0,1 19,20A2,2 0 0,1 17,22C15.89,22 15,21.1 15,20C15,18.89 15.89,18 17,18M1,2H4.27L5.21,4H20A1,1 0 0,1 21,5C21,5.17 20.95,5.34 20.88,5.5L17.3,11.97C16.96,12.58 16.3,13 15.55,13H8.1L7.2,14.63L7.17,14.75A0.25,0.25 0 0,0 7.42,15H19V17H7C5.89,17 5,16.1 5,15C5,14.65 5.09,14.32 5.24,14.04L6.6,11.59L3,4H1V2M7,18A2,2 0 0,1 9,20A2,2 0 0,1 7,22C5.89,22 5,21.1 5,20C5,18.89 5.89,18 7,18M16,11L18.78,6H6.14L8.5,11H16Z" />
                            </svg>
                            Checkout
                        </div>
                        <div class="price" style="color:#cccccc">Select a payment method</div>
                        <button class="payment-method" style="margin: 0; padding: 0;">
                            PayPal
                        </button>
                        <button style="margin: 0; padding: 0;" class="payment-method" onclick="document.getElementById('id03').style.display = 'block'">
                            Cash
                        </button>
                        <button style="margin: 0; padding: 0;" class="payment-method" onclick="pay_close()">
                            Back
                        </button>
                    </div>
                </div>
                <div id="id03" class="modal" style= "display:none; background:  #f1f1f1">
                    <span onclick="document.getElementById('id03').style.display = 'none', document.getElementById('id02').style.display = 'none'" class="close"
                          title="Close Modal">&times;</span>
                    <h1>Pay in cash</h1>
                    <hr style="border-top: 10px solid black">
                    <form class="modal-content animate" style="border:none" action="MainController" method="GET"> 
                        <div class="container" style="margin: 0; padding: 0;">

                            <div style="display:block;float:left;width:50%; ">
                                <img style="width:100%;float: left" src="https://www.pngitem.com/pimgs/m/90-907567_transparent-cash-cow-png-money-icon-png-image.png"> 
                            </div>
                            <div style="width:50%;float: right;padding:20px;"> 
                                <label>
                                    <b>Name</b> ${sessionScope.LOGIN_NAME1} 
                                    <hr>
                                </label> 
                                <label<b>Date </b> <small id="myDate"></small></label>
                                <hr>  
                                <label><b>Address </b> <input type="text"style="width:100%;"id="txtAddress" name="txtAddress" value="${param.address}" placeholder="Enter Address" required></label>
                                <small id="AddressErr" style="color: red"></small><br> 
                                <hr>
                                <b>Total price </b>
                                <h1 style="font-size:40px;" id="total1">${total}</h1> 
                            </div> 
                        </div>   
                        <input type="hidden" name="total" value="${total}"/> 
                        <button name="btnAction" value="ViewPay"onclick="return validate()">Payment</button>  
                        <button type="button" onclick="document.getElementById('id03').style.display = 'none', w3_open1()" style="width: 45%;height:50px;;" class="cancelbtn">Back</button>  

                    </form>
                </div> 

                <script>
                    function validate() {
                        document.getElementById("AddressErr").innerHTML = "";
                        let valid = true;
                        var specialChars = /[^a-zA-Z0-9., /]/g;
                        let address = document.getElementById("txtAddress").value;
                        if (address.match(specialChars)) {
                            document.getElementById("AddressErr").innerHTML = "Invalid Address!";
                            valid = false;
                        }
                        return valid;
                    }
                    function totalPrice() {
                        x = Math.round(${requestScope.total} * 100) / 100;
                        document.getElementById('total').innerHTML = x + " $";
                        y = Math.round(${requestScope.total} * 100) / 100;
                        document.getElementById('total1').innerHTML = y + " $";
                    }
                    totalPrice();
                    var myDate = new Date();
                    document.getElementById("myDate").innerHTML = myDate.getDate() + "/" + myDate.getMonth() + 1 + "/" + myDate.getFullYear();
                </script> 
            </c:if>
        </nav> 
    </c:if>
    <c:if test="${empty sessionScope.LOGIN_NAME1}">
        <div id="mySidebar1" class="modal">
            <span onclick="w3_close1()" class="close" title="Close Modal">&times;</span>
            <div class="container w3-padding w3-center">
                <h1>Dear! Welcome to Hinna Shop.</h1>
                <h1>You must sign in to see the Cart:</h1                          >  
                <button type="submit"  onclick="document.getElementById('id01').style.display = 'block', w3_close1()">CLICK HERE!</button>
                <button type="button" onclick="w3_close1()" class="cancelbtn">Cancel</button> 
            </div>
        </div>

    </c:if>

    <!-- !PAGE CONTENT! --> 
    <div class= "w3-content w3-padding" style="max-width:1200px;margin-top:100px">
        <div style="text-align: center;">
            <c:if test="${not empty requestScope.ANNOUCE_ADD}">
                <span id="d" class="success"><strong>successfully!</strong></span>  
                <script>
                    setInterval(function () {
                        document.getElementById("d").style.display = "none";
                    }, 4000);
                </script>
            </c:if>
            <c:if test="${not empty requestScope.ANNOUCE_FAILURES}">
                <span id="d" class="success" style="color:red;"><strong>Sold Out</strong></span>  
                <script>
                    setInterval(function () {
                        document.getElementById("d").style.display = "none";
                    }, 4000);
                </script>
            </c:if>
            <c:if test="${not empty requestScope.ANNOUCE_HISEMPTY}">
                <span id="d" class="success" style="color:red;  "><strong>Your history is empty!</strong></span>  
                <script>
                    setInterval(function () {
                        document.getElementById("d").style.display = "none";
                    }, 4500);
                </script>
            </c:if>
        </div>

        <hr id="search" > 
        <form action="MainController" method="get" style="border:none">
            <h1>Search:</h1>  <input style="width:30%;" type="search" name="txtSearch" value="${requestScope.txtSearch}" placeholder="Search Name"> 


            <c:if test="${not empty requestScope.ANNOUCE_SEARCHPRICE}">
                <input style="width:20%;" type="number" name="txtPriceS" value="" placeholder="Search Lowest price">
            </c:if>
            <c:if test="${empty requestScope.ANNOUCE_SEARCHPRICE}">
                <input style="width:20%;" type="number" name="txtPriceS" value="${requestScope.txtPriceS}" placeholder="Search Lowest price">
            </c:if>
            <select name="txtCate" style="margin-left: 15px;width:25%;" id="cateID" value="${requestScope.txtCate}">
                <c:if test="${not empty sessionScope.LISTCATE}">
                    <option selected hidden> Select Category!</option>
                    <c:forEach var="listCate" items="${sessionScope.LISTCATE}">
                        <option>${listCate.cateID}</option>
                    </c:forEach>
                </c:if>
            </select>  
            <button name="btnAction" value="Search" style="width:4rem;background: gainsboro; "><img style="width:1.5rem" src="https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png"></button>

        </form>
        <hr id="food" > 
        <div class="w3-row-padding w3-padding-2 w3-center" id="food"> 
            <div class="w3-row-padding w3-padding-16 w3-center" id="food">
                <c:if test="${empty sessionScope.LIST_SEARCH}">
                    <c:forEach var="view" items="${sessionScope.LIST_PAGE}">   
                        <form action="MainController" style="border:none;" method="get">   
                            <div class="w3-quarter" style="height: 500px;"> 
                                <img src="${view.img}" alt="${view.productName}"  style="width:100%; height: 220px;">
                                <h5>${view.productName}</h5>
                                <h6>${view.price} $</h6> 
                                <c:if test="${empty sessionScope.LOGIN_NAME1}">
                                    <div style="border-radius:6px;margin: auto;background-color: black;color: white; width: 150px;height:50px; text-align: center; cursor: pointer; " onclick="w3_open1()"><h5 style="margin-top:20px;padding-top:15px;">Buy</h5></div>
                                </c:if>
                                <c:if test="${not empty sessionScope.LOGIN_NAME1}">
                                    <input type="hidden" name="img" value="${view.img}" >
                                    <input type="hidden" name="productID" value="${view.productID}" >
                                    <input type="hidden" name="productName" value="${view.productName}" >
                                    <input type="hidden" name="price" value="${view.price}" >
                                    <input type="hidden" name="index" value="${param.index}"/>
                                    <button style="background-color: black;" name="btnAction" value="AddCart">Buy</button>
                                </c:if>
                            </div> 
                        </form>  
                    </c:forEach> 
                    <c:if test="${not empty requestScope.NOSEARCH}">
                        <h1>Product is not found</h1>
                    </c:if> 
                </c:if>
                <c:if test="${not empty sessionScope.LIST_SEARCH}">
                    <c:forEach var="view" items="${sessionScope.LIST_SEARCH}">   
                        <form action="MainController" style="border:none;" method="get">   
                            <div class="w3-quarter" style="height: 500px;"> 
                                <img src="${view.img}" alt="${view.productName}"  style="width:100%; height: 220px;">
                                <h5>${view.productName}</h5>
                                <h6>${view.price} $</h6>

                                <c:if test="${empty sessionScope.LOGIN_NAME1}">
                                    <div style="border-radius:6px;margin: auto;background-color: black;color: white; width: 150px;height:50px; text-align: center; cursor: pointer; " onclick="w3_open1()"><h5 style="margin-top:20px;padding-top:15px;">Buy</h5></div>
                                </c:if>
                                <c:if test="${not empty sessionScope.LOGIN_NAME1}">
                                    <input type="hidden" name="img" value="${view.img}" >
                                    <input type="hidden" name="productID" value="${view.productID}" >
                                    <input type="hidden" name="productName" value="${view.productName}" >
                                    <input type="hidden" name="price" value="${view.price}" >
                                    <input type="hidden" name="index" value="${param.index}"/>
                                    <input type="hidden" name="txtSearch" value="${requestScope.txtSearch}" >
                                    <input type="hidden" name="txtPriceS" value="${requestScope.txtPriceS}" >
                                    <input type="hidden" name="txtCate" value="${requestScope.txtCate}"/>
                                    <button style="background-color: black;" name="btnAction" value="AddCartbySearch">Buy</button>
                                </c:if>
                            </div> 
                        </form>  
                    </c:forEach> 
                </c:if>

            </div>
        </div>
    </div>

    <form action="MainController" method="get" style="border:none">
        <div class="w3-center w3-padding-32">
            <div class="w3-bar">
                <c:if test="${empty sessionScope.LIST_SEARCH}"> 
                    <c:forEach begin="1" end="${requestScope.PAGE_NUMBER}" var="i">  
                        <a href="paging?index=${i}" class="w3-bar-item w3-black w3-button w3-hover-black" value="Paging" name="btnAction">${i}</a>  
                    </c:forEach> 
                </c:if> 
                <c:if test="${not empty sessionScope.LIST_SEARCH}"> 
                    <c:forEach begin="1" end="${requestScope.PAGE_NUMBER}" var="i">  
                        <a href="MainController?txtSearch=${requestScope.txtSearch}&txtPriceS=${requestScope.txtPriceS}&txtCate=${requestScope.txtCate}&btnAction=Search&index=${i}" class="w3-bar-item w3-black w3-button w3-hover-black" value="Search" name="btnAction">${i}</a>  
                    </c:forEach>  
                </c:if> 
            </div> 
            </hr>
        </div>
    </form> 
    <c:if test="${empty requestScope.NOT_RECOMMEN}">
        <h1 class="" style="display: block;">Maybe You like!</h1>
        <hr>
        <div class="slideshow-containers  w3-content w3-padding" >  
            <div class="mySlides fade" style="max-width:1200px;display: flex"> 
                <c:forEach var="view" items="${sessionScope.LIST_RECOMMEN}"> 
                    <form action="MainController" method="get" style="border:none">
                        <div class="containers" >
                            <img  style="width:240px; height:200px;" class="image" src="${view.img}"  > 
                            <div class="middle">
                                <div class="detail"><small>${view.productName}</small><br>
                                    <p>${view.price}</p>
                                </div>
                                <input type="hidden" name="img" value="${view.img}" >
                                <input type="hidden" name="productID" value="${view.productID}" >
                                <input type="hidden" name="productName" value="${view.productName}">
                                <input type="hidden" name="price" value="${view.price}" >
                                <input type="hidden" name="index" value="${param.index}"/>
                                <div class="text"><button type="submit" value="AddCart" name="btnAction">Buy</button></div>
                            </div>
                        </div>
                    </form>
                </c:forEach> 
            </div> 
        </div> 
    </c:if>


    <!-- About Section -->
    <div class="w3-container w3-padding-32 w3-center" style="margin-top: 100px;"> 
        <hr id="about">
        <img src="https://images.zeald.com/site/texaschickennz/images/lge%20images/mexicana-sandwich-large.jpg"
             alt="Me" class="w3-image" style="display:block;margin:auto" width="1200" height="400">
        <div class="w3-padding-32"> 
        </div>
    </div>
    <hr>

    <!-- Footer -->
    <footer class="w3-row-padding w3-padding-32">
        <div class="w3-third">
            <h3><b>HANA SHOP</b></h3>
            <p>HANA Joint Stock Company.</p>  
            <p><b>Address</b></p>
            <p>8/13-8/15-8/17 Le Thanh Ton, Ben Nghe Ward, District 1, Ho Chi Minh City</p>
            <p>Call our hotline for further support:<b>+84 0123 123 123</b></p>

        </div>

        <div class="w3-third">

            <h5><b>Certificate Of Food Safety Conditions</b></h5>
            <P>No 2895/2018/ATTP-CNĐK licensed by the Food Safety Management Authority Of HCM City on 05/07/2018</P>
            <h5><b>Business Registration Certificate</b></h5>
            <P>No 0313168515 licensed by Department Of Planning And Investment Of Ho Chi Minh City on 19/03/2015</P>

        </div>

        <div class="w3-third w3-serif">
            <h3>POPULAR TAGS</h3>
            <p>
                <span class="w3-tag w3-black w3-margin-bottom">Food</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Meal</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dinner</span>
                <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Chicken</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Hamburger</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Drinks</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Flavors</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Cuisine</span>
                <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Chicken</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Dressing</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fried</span>
                <span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Fish</span> <span
                    class="w3-tag w3-dark-grey w3-small w3-margin-bottom">Duck</span>
            </p>
        </div>
    </footer>

    <!-- End page content -->
    <!-- Button to open the modal -->
    <!-- The modal -->
    <div id="id01" class="modal">
        <span onclick="document.getElementById('id01').style.display = 'none'" class="close"
              title="Close Modal">&times;</span>

        <form class="modal-content animate" action="MainController" method="GET">
            <div class="imgcontainer">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWyKQZhRU5CP-xSkS4koOM6TETX-DciFZsFw&usqp=CAU"
                     alt="Avartar" class="avatar">

            </div>
            <div class="container">
                <label for="uname"> <b>UserID</b></label>
                <input type="text" name="txtUserID" placeholder="Enter UserID" required>
                <label for="psw"><b>Password</b></label>
                <input type="password" name="txtPws" placeholder="Enter Password" required>

                <c:if test="${not empty requestScope.FAILED}">
                    <small><font style="color:red">UserID or Password wrong!</font></small> 
                    <script>
                        document.getElementById('id01').style.display = 'block';
                    </script>
                </c:if>
                <c:if test="${empty requestScope.FAILED}">
                    <small><font style="color:lightsteelblue;  ">Hi! You must SIGN IN to buy Item!</font></small>
                    </c:if>
                <br>
                <button type="submit" value="Login" name="btnAction">Login</button>
                <div class="col">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/HinnaShop/login-google&response_type=code&client_id=73193271086-omsvbt603d68bv4mlslo8hejh084hbd0.apps.googleusercontent.com&approval_prompt=force"
                       class="google btn"><i class="fa fa-google fa-fw">
                        </i> Login with Google+
                    </a>
                </div>

                <label>
                    <br> <input type="checkbox" checked="checked" name="rememeber">Remember me
                </label>

            </div>
            <div class="container" style="background-color: #f1f1f1;">
                <input type="hidden" name="index" value="1"/>
                <button type="button" onclick="document.getElementById('id01').style.display = 'none'"
                        class="cancelbtn">Cancel</button>  

            </div>
        </form>
    </div>
    <div id="history" class="modal" style="">

        <form action="MainController" method="get" style="border:none;">
            <input type="hidden" name="index" value="1">
            <button style="margin:0;padding:0; width: 20px; background: none;" onclick="his_close()" name="btnAction" value="Back" class="close" title="Close Modal">&times;</button>

            <div class="w3-main w3-content w3-center w3-padding" style="max-width:1200px;background: whitesmoke;border:2px solid black ">
                <h1>Order history</h1>
                <hr style="border: 2.5px solid black">

                <div style="display: block;">Name <input type="search" name="txtSearchbyHis" value="${param.txtSearchbyHis}" style="width: 20%;">
                    Date <input type="date" name="txtDatebyHis" value="${param.txtDatebyHis}" style="width: 20%;">
                    <button type="submit" name="btnAction" value="SearchHis" style="width: 20%;">Search</button>
                    <button type="submit" name="btnAction" value="ViewHis" style="width: 20%;background: #232329;">View</button>
                </div>


                <div style="width: 100%; display: flex;">
                    <p style="width:10%;">No.</p>
                    <p style="width:60%;">Detail</p>
                    <p style="width:10%;margin-left: 13%;">total</p>
                </div>
                <hr style="border: 1px solid dimgray;"> 
                <c:if test="${not empty sessionScope.LIST_HIS}">
                    <c:forEach var="view" items="${sessionScope.LIST_HIS}" varStatus="counter">
                        <div style="display: block;">
                            <div class="w3-row-padding" style="text-align:justify;">
                                <small style="padding-top:5%; display: block; float: left; width: 100px;height: 100px;text-align: center;">${counter.count}</small>
                                <h3><b>${view.orderID}</b></h3>
                                <small>date: ${view.myDate}</small>
                                <h4 class="w3-right" style="width:150px ;margin:auto 0; display: block;">${view.total}</h4>
                                <small style=" margin-right: 250px; display: block; float: right; width: 500px;height: 100px;text-align: center;">${view.address}</small>

                                <form action="MainController" method="get" style="border:none;">
                                    <input type="hidden" name="txtOrderID" value="${view.orderID}">
                                    <button type="submit" name="btnAction" value="DetailPro" style="width: 10%; display: block;">Detail</button>
                                </form>
                                <br>
                                <hr style="border: 0.5px solid #cccccc;width:90%;margin: 0 auto">
                            </div> 
                        </div> 
                    </c:forEach>
                </c:if>
                <c:if test="${not empty sessionScope.LIST_HISSEARCH}">
                    <c:forEach var="view" items="${sessionScope.LIST_HISSEARCH}" varStatus="counter">
                        <div style="display: block;">
                            <div class="w3-row-padding" style="text-align:justify;">
                                <small style="padding-top:5%; display: block; float: left; width: 100px;height: 100px;text-align: center;">${counter.count}</small>
                                <h3><b>${view.orderID}</b></h3>
                                <small>date: ${view.myDate}</small>
                                <h4 class="w3-right" style="width:150px ;margin:auto 0; display: block;">${view.total}</h4>
                                <small style=" margin-right: 250px; display: block; float: right; width: 500px;height: 100px;text-align: center;">${view.address}</small>

                                <br>
                                <form action="MainController" method="get" style="border:none;">  
                                    <input type="hidden" name="txtOrderID" value="${view.orderID}">
                                    <button type="submit" name="btnAction" value="DetailPro" style="width: 10%; display: block;">Detail</button>
                                </form>
                                <hr style="border: 0.5px solid #cccccc">
                            </div> 
                        </div> 
                    </c:forEach>
                </c:if>
                <c:if test="${not empty requestScope.ANNOUCE_HISEMPTYS}">
                    <h1>There is no history for this information</h1>
                </c:if> 
                <button type="submit" style="width:90%" type="button" onclick="his_close()" name="btnAction" value="Back"  title="Close Modal" 
                        class="cancelbtn">Back</button>  
            </div>
        </form>
    </div>
    <div id="historyDetail" class="modal" style="">

        <form action="MainController" method="get" style="border:none">
            <input type="hidden" name="index" value="1">
            <button style="margin:0;padding:0; width: 20px; background: none;" onclick="his_close()" name="btnAction" value="ViewHis" class="close" title="Close Modal">&times;</button>
            <div class="w3-main w3-content w3-center w3-padding" style="max-width:1200px;">
                <h1>List of detailed history of the orderID: ${requestScope.txtOrderID}</h1>
                <hr style="border: 2.5px solid black"> 
                <div style="display: block;background: whitesmoke;">
                    <div  style="width: 100%; display: flex;">
                        <p style="width:10%;">No.</p>
                        <p style="width:20%;">Name</p>
                        <p style="width:20%;">Category</p>
                        <p style="width:20%;">Quantity</p>
                        <p style="width:20%;">Total price</p>
                        <p style="width:20%;">Image</p>
                    </div>

                </div> <br>


                <c:if test="${not empty sessionScope.LIST_HISDETAIL}">
                    <c:forEach var="view" items="${sessionScope.LIST_HISDETAIL}" varStatus="counter">
                        <hr>
                        <div style="display: block;">
                            <div class="w3-row-padding tblDetail" style="text-align:justify; padding:0;">

                                <small
                                    style="padding-top:5%; display: block; float: left; width: 8%;height: 100px;text-align: center;">${counter.count}</small>
                                <small
                                    style="padding-top:5%; display: block; float: left; width: 20%;height: 100px;text-align: center;">${view.productName}</small>
                                <small
                                    style="padding-top:5%; display: block; float: left; width: 20%;height: 100px;text-align: center;">${view.categoryID}</small>
                                <small
                                    style="padding-top:5%; display: block; float: left; width: 15%;height: 100px;text-align: center;">${view.quantity}</small>
                                <small
                                    style="padding-top:5%; display: block; float: left; width: 20%;height: 100px;text-align: center;">${view.price}</small>
                                <img style="display: block; float: left; width: 17%;height: 100px;text-align: center;"
                                     src="${view.img}"> 
                            </div> 
                        </div> 
                    </c:forEach>
                </c:if> 
                <br>
                <button type="submit" style="width:30%;float:right" type="button" onclick="hisD_close()" name="btnAction" value="ViewHis"  title="Close Modal" 
                        class="cancelbtn">Back</button>  
            </div>
        </form>
    </div>

    <c:if test="${not empty requestScope.ANNOUCE || not empty requestScope.ANNOUCE_FAILURE}">
        <script>
            document.getElementById("mySidebar1").style.display = "block";
        </script>
    </c:if>
    <c:if test="${not empty sessionScope.LIST_HIS || not empty sessionScope.LIST_HISSEARCH || not empty requestScope.ANNOUCE_HISEMPTYS}">
        <script>
            document.getElementById("history").style.display = "block";
        </script>
    </c:if>
    <c:if test="${not empty sessionScope.LIST_HISDETAIL}">
        <script>
            document.getElementById("historyDetail").style.display = "block";
        </script>
    </c:if>

    <script>
        // Script to open and c                      lose sidebar

        function w3_open() {
            document.getElementById("mySidebar").style.display = "block";
        }
        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
        }

        function w3_open1() {
            document.getElementById("mySidebar1").style.display = "block";
        }

        function w3_close1() {

            document.getElementById("mySidebar1").style.display = "none";
        }
        function pay_open() {
            document.getElementById("id03").style.display = "block";
        }
        function pay_close() {
            document.getElementById("id03").style.display = "none";
        }
        function methodPay_open() {
            document.getElementById("id02").style.display = "block";
        }
        function methodPay_close() {
            document.getElementById("id02").style.display = "none";
        }
        function signin_open() {
            document.getElementById("id01").style.display = "block";
        }
        function signin_close() {
            document.getElementById("id01").style.display = "none";
        }
        function his_open() {
            document.getElementById("history").style.display = "block";
        }
        function his_close() {
            document.getElementById("history").style.display = "none";
        }
        function hisD_open() {
            document.getElementById("historyDetail").style.display = "block";
        }
        function hisD_close() {
            document.getElementById("historyDetail").style.display = "none";
        }
        var modal = document.getElementById("id01");
        //When the user click anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target === modal || event.target === document.getElementById("mySidebar")) {
                modal.style.display = "none";
                document.getElementById("mySidebar").style.display = "none";
            }
        };
        function onSignIn(googleUser) {

            var profile = googleUser.getBasicProfile();
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            console.log('Given Name: ' + profile.getGivenName());
            console.log('Family Name: ' + profile.getFamilyName());
            console.log("Image URL: " + profile.getImageUrl());
            console.log("Email: " + profile.getEmil());
            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
        }
        function myFunctionConfirm() {
            let valid = true;
            if (confirm("Are you sure?")) {
                valid = true;
            } else {
                valid = false;
            }
            return valid;
        }
//        var slideIndex = 1;
//        showSlides(slideIndex);
//
//        function plusSlides(n) {
//            showSlides(slideIndex += n);
//        }
//
//        function currentSlide(n) {
//            showSlides(slideIndex = n);
//        }
//
//        function showSlides(n) {
//            var i;
//            var slides = document.getElementsByClassName("mySlides"); 
//            if (n > slides.length) {
//                slideIndex = 1
//            }
//            if (n < 1) {
//                slideIndex = slides.length
//            }
//            for (i = 0; i < slides.length; i++) {
//                slides[i].style.display = "none";
//            }
//            slides[slideIndex - 1].style.display = "block";
//            dots[slideIndex - 1].className += " active";
//        }
    </script>
</body>

</html>