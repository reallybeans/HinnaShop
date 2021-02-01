<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html
    <%@page contentType="text/html" pageEncoding="UTF-8"%>>
<html>
    <title>Admin Managerment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <link rel="stylesheet" href="css/login.css">
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
        <c:if test="${not empty sessionScope.LOGIN_NAME1}">
            <c:redirect url="mainPage.jsp"></c:redirect>
        </c:if> 
        <c:if test="${empty sessionScope.LOGIN_NAME}">
            <c:redirect url="mainPage.jsp"></c:redirect>
        </c:if> 
        <!-- Sidebar (hidden by default) -->
        <nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
            <form action="MainController" style="border:none;" method="GET ">
                <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button">Close Menu</a>
                <button href="paging?index=1#food" onclick="w3_close()" value="Paging" name="btnAction"  class="w3-bar-item w3-button">Item</button>
                <button href="#create" class="w3-bar-item w3-button" onclick="document.getElementById('id01').style.display = 'block', w3_close()">Create Items</button> 
                <button onclick="w3_close()" name="btnAction" value="Sign Out" style="margin:0;" class="w3-bar-item w3-button">Sign Out</button> 
            </form>
        </nav>

        <!-- Top menu -->
        <div class="w3-top">
            <div class="w3-white w3-xlarge" style="max-width:1800px;margin:auto">
                <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
                <div class="w3-right w3-padding-16">Hello ${sessionScope.LOGIN_NAME}!</div>
                <div class="w3-center w3-padding-16">Hinna<img src="https://images.zeald.com/site/texaschickennz/images/thumb-big-club-burger.png"
                                                               alt="Avartar" class="avatar" style="width:40px;"></div>
            </div>
        </div>

        <!-- !PAGE CONTENT! --> 

        <div class="w3-main w3-content w3-padding" style="max-width:1600px;margin-top:100px"> 
            <form action="MainController" method="get" style="border:none;" >
                <h1>Search:</h1>  <input style="width:30%;" type="text" name="txtSearchAD" value="${requestScope.txtSearchAD}" placeholder="Search Name"> 
                <c:if test="${not empty requestScope.ANNOUCE_SEARCHPRICE}">
                    <input style="width:20%;" type="number" name="txtPriceSAD" value=""  placeholder="Search Lowest price">
                </c:if>
                <c:if test="${empty requestScope.ANNOUCE_SEARCHPRICE}">
                    <input style="width:20%;" type="number" name="txtPriceSAD" value="${requestScope.txtPriceSAD}"  placeholder="Search Lowest price">
                </c:if>
                <select name="txtCateAD" style="margin-left: 15px;width:25%;" id="cateID" value="${requestScope.txtCateAD}">
                    <c:if test="${not empty sessionScope.LISTCATE}">
                        <option selected hidden> Select Category!</option>
                        <c:forEach var="listCate" items="${sessionScope.LISTCATE}">
                            <option>${listCate.cateID}</option>
                        </c:forEach>
                    </c:if>
                </select>    
                <button name="btnAction" value="SearchAD" style="width:4rem;background: gainsboro; "><img style="width:1.5rem" src="https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png"></button>
            </form>

            <h1>Custom Items</h1>
            <hr id="food" > 
            <div class="w3-row-padding w3-padding-2 w3-center" id="food"> 
                <c:if test="${empty sessionScope.LIST_SEARCH}">
                    <c:forEach var="view" items="${sessionScope.LIST_PAGE}">  
                        <form action="MainController" style="border:none;" method="get">  
                            <div class="w3-quarter" style="height:900px;font-size:20px;">
                                <img src="${view.img}" alt="Popsicle" style="width:100%; height: 250px;" onclick="document.getElementById('id02').style.display = 'block'" >
                                <b style="width:20%; ">ID :</b> <input style="width:90%; flex:left; display: inline-block;"   name="txtProductID" value="${view.productID}" readonly="readonly"/>
                                <b style="width:20%;">Name :</b> <input style="width:80%; flex:left; display: inline-block;" id="namepro" type="text" name="txtProductName" value="${view.productName}" required maxlength="50"/>
                                <small id="ProductNameErr1" style="color: red"></small><br>
                                <b>Quantity :</b> <input style="width:75%; flex:left; display: inline-block;"  type="text" id="quanpro" name="txtQuanlity" value="${view.quanlity}" required maxlength="99999"/>
                                <small id="QuanlityErr1" style="color: red"></small><br>
                                <b style="width:20%;">Description :</b> <input style="width:68%; display: inline-block;" id="despro"   type="text" name="txtDescription" value="${view.description}" required maxlength="1000"/>
                                <small id="DescriptionErr1" style="color: red"></small><br>
                                <b style="width:20%;">Category :</b>  <select name="txtCate" style="width:75%;" id="cateID">
                                    <c:if test="${not empty sessionScope.LISTCATE}">
                                        <option selected hidden> ${view.categoryID}</option>
                                        <c:forEach var="listCate" items="${sessionScope.LISTCATE}">
                                            <option>${listCate.cateID}</option>
                                        </c:forEach>
                                    </c:if>
                                </select><br>
                                <b style="width:20%;">Price :</b><input type="text" name="txtPrice" style=" width:80%; display: inline-block;" id="pricepro" value="${view.price}" required maxlength="99999999999"/>
                                <small id="PriceErr1" style="color: red"></small><br>
                                <b style="width:20%;">Date Of Create :</b><input style=" width:63%; display: inline-block;"value="${view.myDate}" readonly="readonly"/>
                                <b style="width:20%;" style="float:left;">Status :</b>
                                <select name="txtStatus" id="cateID" value="${view.categoryID}">
                                    <option selected hidden><c:if test="${view.status == true}"> 
                                            TRUE
                                        </c:if>
                                        <c:if test="${view.status != true}"> 
                                            FALSE
                                        </c:if>
                                    </option>
                                    <option>TRUE</option>  
                                    <option style="color:red;">FALSE</option> 
                                </select><br> 
                                <input type="file" id="myfile1" name="txtImg" value="${view.img}"><br><br>
                                <div>
                                    <input type="hidden" name="txtProductID" value="${view.productID}"/>
                                    <input type="hidden" name="index" value="${param.index}"/>
                                    <button style="width:40%;display: inline-block; float:left;" value="UpdatePro" name="btnAction" onclick="return validate2()">Update</button>
                                    <button style="background:red; width:40%;display:inline-block; float:right; " value="DeletePro" name="btnAction" onclick="return myFunctionConfirm()">Delete</button>
                                </div>
                                <div id="d" class="success" style="display: block;"><strong>SUCCESS</strong></div>
                            </div>
                        </form> 
                    </c:forEach>
                </c:if>
                <c:if test="${not empty sessionScope.LIST_SEARCH}">
                    <c:forEach var="view" items="${sessionScope.LIST_SEARCH}">  
                        <form action="MainController" style="border:none;" method="get">  
                            <div class="w3-quarter" style="height:900px;font-size:20px;">
                                <img src="${view.img}" alt="Popsicle" style="width:100%; height: 250px;" onclick="document.getElementById('id02').style.display = 'block'" >
                                <b style="width:20%; ">ID :</b> <input style="width:90%; flex:left; display: inline-block;"   name="txtProductID" value="${view.productID}" readonly="readonly"/>
                                <b style="width:20%;">Name :</b> <input style="width:80%; flex:left; display: inline-block;" id="namepro" type="text" name="txtProductName" value="${view.productName}" required maxlength="50"/>
                                <small id="ProductNameErr1" style="color: red"></small><br>
                                <b>Quantity :</b> <input style="width:75%; flex:left; display: inline-block;"  type="text" id="quanpro" name="txtQuanlity" value="${view.quanlity}" required maxlength="99999"/>
                                <small id="QuanlityErr1" style="color: red"></small><br>
                                <b style="width:20%;">Description :</b> <input style="width:68%; display: inline-block;" id="despro"   type="text" name="txtDescription" value="${view.description}" required maxlength="1000"/>
                                <small id="DescriptionErr1" style="color: red"></small><br>
                                <b style="width:20%;">Category :</b>  <select name="txtCate" style="width:75%;" id="cateID">
                                    <c:if test="${not empty sessionScope.LISTCATE}">
                                        <option selected hidden> ${view.categoryID}</option>
                                        <c:forEach var="listCate" items="${sessionScope.LISTCATE}">
                                            <option>${listCate.cateID}</option>
                                        </c:forEach>
                                    </c:if>
                                </select><br>
                                <b style="width:20%;">Price :</b><input type="text" name="txtPrice" style=" width:80%; display: inline-block;" id="pricepro" value="${view.price}" required maxlength="99999999999"/>
                                <small id="PriceErr1" style="color: red"></small><br>
                                <b style="width:20%;">Date Of Create :</b><input style=" width:63%; display: inline-block;"value="${view.myDate}" readonly="readonly"/>
                                <b style="width:20%;" style="float:left;">Status :</b>
                                <select name="txtStatus" id="cateID" value="${view.categoryID}">
                                    <option selected hidden><c:if test="${view.status == true}"> 
                                            TRUE
                                        </c:if>
                                        <c:if test="${view.status != true}"> 
                                            FALSE
                                        </c:if>
                                    </option>
                                    <option>TRUE</option>  
                                    <option style="color:red;">FALSE</option> 
                                </select><br> 
                                <input type="file" id="myfile1" name="txtImg" value="${view.img}"><br><br>
                                <div>
                                    <input type="hidden" name="txtProductID" value="${view.productID}"/>
                                    <input type="hidden" name="index" value="${param.index}"/>
                                    <button style="width:40%;display: inline-block; float:left;" value="UpdateProS" name="btnAction" onclick="return validate2()">Update</button>
                                    <button style="background:red; width:40%;display:inline-block; float:right; " value="UpdateProS" name="btnAction" onclick="return myFunctionConfirm()">Delete</button>
                                </div>
                                <div id="d" class="success" style="display: block;"><strong>SUCCESS</strong></div>
                            </div>
                        </form> 
                    </c:forEach>
                </c:if>
                <c:if test="${not empty requestScope.NOSEARCH}">
                    <h1>Product is not found</h1>
                </c:if> 
                <script>
                    function validate2() {
                        document.getElementById("ProductNameErr1").innerHTML = "";
                        document.getElementById("QuanlityErr1").innerHTML = "";
                        document.getElementById("DescriptionErr1").innerHTML = "";
                        document.getElementById("PriceErr1").innerHTML = "";
                        let valid = true;
                        var specialChars = /[^a-zA-Z0-9-_,. %]/g;
                        var specialChars1 = /[^a-zA-Z0-9 ]/g;
                        var number = /[^0-9.]/g;
                        let productName = document.getElementById("namepro").value;
                        let txtQuanlity = document.getElementById("quanpro").value;
                        let description = document.getElementById("despro").value;
                        let price = document.getElementById("pricepro").value;
                        if (productName.match(specialChars1)) {
                            document.getElementById("ProductNameErr1").innerHTML = "Invalid Product Name!";
                            valid = false;
                        }
                        if (txtQuanlity.match(number)) {
                            document.getElementById("QuanlityErr1").innerHTML = "Invalid Quanlity!";
                            valid = false;
                        }
                        if (description.match(specialChars)) {
                            document.getElementById("DescriptionErr1").innerHTML = "Invalid Description!";
                            valid = false;
                        }
                        if (price.match(number)) {
                            document.getElementById("PriceErr1").innerHTML = "Invalid Price!";
                            valid = false;
                        }
                        return valid;
                    }
                </script>
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
                                <c:if test="${empty requestScope.ANNOUCE_SEARCHPRICE}">
                                    <a href="MainController?txtSearchAD=${requestScope.txtSearchAD}&txtPriceSAD=${requestScope.txtPriceAD}&btnAction=SearchAD&txtCateAD=${requestScope.txtCateAD}&index=${i}" class="w3-bar-item w3-black w3-button w3-hover-black" value="Search" name="btnAction">${i}</a>  
                                </c:if>
                                <c:if test="${not empty requestScope.ANNOUCE_SEARCHPRICE}">
                                    <a href="MainController?txtSearchAD=${requestScope.txtSearchAD}&txtPriceSAD=${requestScope.txtPriceAD}&btnAction=SearchAD&txtCateAD=${requestScope.txtCateAD}&index=${i}" class="w3-bar-item w3-black w3-button w3-hover-black" value="Search" name="btnAction">${i}</a>  
                                </c:if>
                               


                            </c:forEach>  
                        </c:if> 
                    </div> 
                    </hr>
                </div>
            </form>


            <hr id="create">
            <!-- About Section -->
            <h1 style="cursor:pointer;" onclick="document.getElementById('id01').style.display = 'block'">Create Item</h1>
            <div id="id01" class="modal">
                <span onclick="document.getElementById('id01').style.display = 'none'" class="close"
                      title="Close Modal">&times;</span>
                <div class="w3-container w3-padding-32"> 
                    <form action="MainController" method="GET"> 
                        <h3 class=" w3-center">Create New Item</h3><br>
                        <div class="w3-padding-32" id="product">

                            <c:if test="${empty requestScope.DULICATED}">  
                                Product ID <input type="text" name="txtProductID" id="productID"  required maxlength="10" /><br>
                                <p id="ProductIDErr" style="color: red"></p><br>
                                Product Name <input type="text" name="txtProductName" id="productName" required maxlength="50" /><br>
                                <small id="ProductNameErr" style="color: red"></small><br>
                                Quantity <input type="text" name="txtQuanlity" id="quanlity"  required maxlength="3000" /><br>
                                <small id="QuanlityErr" style="color: red"></small><br>
                                Description <input type="text" name="txtDescription" id="description"required
                                                   maxlength="1000" /><br>
                                <small id="DescriptionErr" style="color: red"></small><br>
                                Category ID
                                <select name="txtCate" id="cateID" >
                                    <c:if test="${not empty sessionScope.LISTCATE}">
                                        <c:forEach var="listCate" items="${sessionScope.LISTCATE}">
                                            <option>${listCate.cateID}</option>
                                        </c:forEach>
                                    </c:if>  
                                </select><br>
                                <small id="CategoryIDErr" style="color: red"></small><br>
                                Price <input type="text" name="txtPrice" id="price" required maxlength="99999999999" /><br>
                                <small id="PriceErr" style="color: red"></small><br>
                                Date Of Create <p type="text" name="date" id="date"></p> <br>
                                <label for="txtImg">Select a Image:</label>
                                <input type="file" id="myfile" name="txtImg" ><br><br>
                                <small id="fileErr" style="color: red"></small><br> 
                                <div id="d" class="success" style="display: block;"><strong>SUCCESS</strong></div> 
                                <div>
                                    <button value="CreatePro" name="btnAction" onclick="return validate()">Create</button>
                                    <button type="button" onclick="document.getElementById('id01').style.display = 'none'"
                                            class="cancelbtn"style="width: 200px">Cancel</button> 
                                </div>

                            </c:if>
                            <c:if test="${not empty requestScope.DULICATED}">
                                <script>
                                    document.getElementById('id01').style.display = 'block';
                                    setInterval(myFunction, 1000);
                                    function myFunction() {
                                        let d = new Date();
                                        document.getElementById("date").innerHTML =
                                                d.getHours() + ":" +
                                                d.getMinutes() + ":" +
                                                d.getSeconds() + " " +
                                                d.getDate() + "-" +
                                                d.getMonth() + 1 + "-" +
                                                d.getFullYear();
                                        document.getElementById("date1").innerHTML = d.getHours() + ":" +
                                                d.getMinutes() + ":" +
                                                d.getSeconds() + " " +
                                                d.getDate() + "-" +
                                                d.getMonth() + 1 + "-" +
                                                d.getFullYear();

                                    }
                                </script>
                                Product ID <input type="text" name="txtProductID" id="productID" value="${param.txtProductID}" required maxlength="10" /><br>
                                <p id="ProductIDErr" style="color: red"></p><br>
                                Product Name <input type="text" name="txtProductName" id="productName" value="${param.txtProductName} "required maxlength="50" /><br>
                                <small id="ProductNameErr" style="color: red"></small><br>
                                Quantity <input type="text" name="txtQuanlity" id="quanlity" value="${param.txtQuanlity}" required maxlength="10000" /><br>
                                <small id="QuanlityErr" style="color: red"></small><br>
                                Description <input type="text" name="txtDescription" id="description" value="${param.txtDescription}" required
                                                   maxlength="1000" /><br>
                                <small id="DescriptionErr" style="color: red"></small><br>
                                Category ID
                                <select name="txtCate" id="cateID" value="${param.txtCate}"> 
                                    <c:if test="${not empty sessionScope.LISTCATE}">
                                        <c:forEach var="listCate" items="${sessionScope.LISTCATE}">
                                            <option>${listCate.cateID}</option>
                                        </c:forEach>
                                    </c:if>  
                                </select><br>
                                <small id="CategoryIDErr" style="color: red"></small><br>
                                Price <input type="text" name="txtPrice" id="price" required maxlength="99999999999" value="${param.txtPrice}" /><br>
                                <small id="PriceErr" style="color: red"></small><br>
                                Date Of Create <p type="text" name="date" id="date"></p> <br>
                                <label for="txtImg">Select a Image:</label>
                                <input type="file" id="myfile" name="txtImg" value="${param.txtImg}"><br><br>
                                <small id="fileErr" style="color: red"></small><br>
                                <div>
                                    <button value="CreatePro" name="btnAction" onclick="return validate()">Create</button>
                                    <button type="button" onclick="document.getElementById('id01').style.display = 'none'"
                                            class="cancelbtn"style="width: 200px">Cancel</button> 
                                </div> 
                                <script>
                                    document.getElementById("ProductIDErr").innerHTML = "Duplicate Product ID!";
                                </script> 
                                <style>
                                    #productID{
                                        background: lightpink;
                                    }
                                </style>
                                <div id="d" class="success" style='color: red;'><strong>FAIL</strong></div>
                            </c:if>
                        </div>
                    </form>
                </div> 
            </div>
            <hr>     <!-- End page content -->
        </div>


        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
            }
            var modal = document.getElementById("id01");
            //When the user click anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                    document.getElementById("mySidebar").style.display = "none";
                }
            }
            function validate() {
                document.getElementById("ProductIDErr").innerHTML = "";
                document.getElementById("ProductNameErr").innerHTML = "";
                document.getElementById("QuanlityErr").innerHTML = "";
                document.getElementById("DescriptionErr").innerHTML = "";
                document.getElementById("PriceErr").innerHTML = "";
                document.getElementById("fileErr").innerHTML = "";
                let valid = true;
                var specialChars = /[^a-zA-Z0-9-_,. %]/g;
                var specialChars1 = /[^a-zA-Z0-9 ]/g;
                var number = /[^0-9.]/g;
                let ProductID = document.getElementById("productID").value;
                let productName = document.getElementById("productName").value;
                let txtQuanlity = document.getElementById("quanlity").value;
                let description = document.getElementById("description").value;
                let myfile = document.getElementById("myfile").value;
                let price = document.getElementById("price").value;
                if (ProductID.match(specialChars1)) {
                    document.getElementById("ProductIDErr").innerHTML = "Invalid product ID!";
                    valid = false;
                }
                if (productName.match(specialChars1)) {
                    document.getElementById("ProductNameErr").innerHTML = "Invalid Product Name!";
                    valid = false;
                }

                if (txtQuanlity.match(number)) {
                    document.getElementById("QuanlityErr").innerHTML = "Invalid Quanlity!";
                    valid = false;
                }
                if (description.match(specialChars)) {
                    document.getElementById("DescriptionErr").innerHTML = "Invalid Description!";
                    valid = false;
                }
                if (price.match(number)) {
                    document.getElementById("DescrPriceErriptionErr").innerHTML = "Invalid Price!";
                    valid = false;
                }
                if (myfile === "") {
                    document.getElementById("fileErr").innerHTML = "Img not exist please!";
                    valid = false;
                }
                return valid;
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

        </script>
    </body>

</html> 