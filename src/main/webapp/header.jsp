

<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>

    <div id="fb-root"></div>
    <script>(function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.6&appId=381324158709242";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

</head>
<body>

    <%
        CategoryDAO categoryDAO = new CategoryDAO();
        Users users = null;
        if (session.getAttribute("user") != null) {
            users = (Users) session.getAttribute("user");
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

    %>

    <div style="background:wheat; margin-bottom: -1px;margin-top: -23px;" class="col-md-12">
        <div class="col-xs-9 ">
            <marquee direction="left" behavior="scroll" >
                <font  size="2">
                <script type="text/javascript">
                    farbbibliothek = new Array();
                    farbbibliothek[0] = new Array("#FF0000", "#FF1100", "#FF2200", "#FF3300", "#FF4400", "#FF5500", "#FF6600", "#FF7700", "#FF8800", "#FF9900", "#FFaa00", "#FFbb00", "#FFcc00", "#FFdd00", "#FFee00", "#FFff00", "#FFee00", "#FFdd00", "#FFcc00", "#FFbb00", "#FFaa00", "#FF9900", "#FF8800", "#FF7700", "#FF6600", "#FF5500", "#FF4400", "#FF3300", "#FF2200", "#FF1100");
                    farbbibliothek[1] = new Array("#00FF00", "#000000", "#00FF00", "#00FF00");
                    farbbibliothek[2] = new Array("#00FF00", "#FF0000", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00", "#00FF00");
                    farbbibliothek[3] = new Array("#FF0000", "#FF4000", "#FF8000", "#FFC000", "#FFFF00", "#C0FF00", "#80FF00", "#40FF00", "#00FF00", "#00FF40", "#00FF80", "#00FFC0", "#00FFFF", "#00C0FF", "#0080FF", "#0040FF", "#0000FF", "#4000FF", "#8000FF", "#C000FF", "#FF00FF", "#FF00C0", "#FF0080", "#FF0040");
                    farbbibliothek[4] = new Array("#FF0000", "#EE0000", "#DD0000", "#CC0000", "#BB0000", "#AA0000", "#990000", "#880000", "#770000", "#660000", "#550000", "#440000", "#330000", "#220000", "#110000", "#000000", "#110000", "#220000", "#330000", "#440000", "#550000", "#660000", "#770000", "#880000", "#990000", "#AA0000", "#BB0000", "#CC0000", "#DD0000", "#EE0000");
                    farbbibliothek[5] = new Array("#000000", "#000000", "#000000", "#FFFFFF", "#FFFFFF", "#FFFFFF");
                    farbbibliothek[6] = new Array("#0000FF", "#FFFF00");
                    farben = farbbibliothek[4];
                    function farbschrift() {
                        for (var i = 0; i < Buchstabe.length; i++) {
                            document.all["a" + i].style.color = farben[i];
                        }
                        farbverlauf();
                    }
                    function string2array(text) {
                        Buchstabe = new Array();
                        while (farben.length < text.length) {
                            farben = farben.concat(farben);
                        }
                        k = 0;
                        while (k <= text.length) {
                            Buchstabe[k] = text.charAt(k);
                            k++;
                        }
                    }
                    function divserzeugen() {
                        for (var i = 0; i < Buchstabe.length; i++) {
                            document.write("<span id='a" + i + "' class='a" + i + "'>" + Buchstabe[i] + "<\/span>");
                        }
                        farbschrift();
                    }
                    var a = 1;
                    function farbverlauf() {
                        for (var i = 0; i < farben.length; i++) {
                            farben[i - 1] = farben[i];
                        }
                        farben[farben.length - 1] = farben[-1];

                        setTimeout("farbschrift()", 30);
                    }
                    //
                    var farbsatz = 1;
                    function farbtauscher() {
                        farben = farbbibliothek[farbsatz];
                        while (farben.length < text.length) {
                            farben = farben.concat(farben);
                        }
                        farbsatz = Math.floor(Math.random() * (farbbibliothek.length - 0.0001));
                    }
                    setInterval("farbtauscher()", 5000);

                    text = "CHÀO MỪNG CÁC BẠN ĐẾN WEBSITE THƯƠNG MẠI ĐIỆN TỬ HONDA TEAM"; //h
                    string2array(text);
                    divserzeugen();
                    //document.write(text);
                </script>
                </font>
            </marquee>
        </div>
        <%if (users == null) {%>
            <p class=" pull-right"><a href="login.jsp"><b style="color: blue">Đăng Ký/Đăng Nhập</b></a></p>      
        <%}%>
        <%if (users != null) {%>
            <form action="UsersServlet" method="POST">
            <%if(request.getParameter("error")!=null){%>
            <div>
                <p style="color:red"><%=request.getParameter("error")%></p>
            </div> 
            <%}%>
            <div >
                <input type="hidden" value="logout" name="command">
                <input class="pull-right" type="submit" value="Đăng Xuất"> 
            </div>

            </form>
        <%}%>
        
    </div>
    <div class="clearfix"></div>
    <!--header-->
                    
    <div style="margin-top: 1px; " class="header-bottom " >
        <div class="container" >
            <div class="h_menu4"> 
                <a class="toggleMenu" href="#">Menu</a>
                <ul class="nav">
                    <li ><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="#" >Sản phẩm</a>
                        <ul class="drop" >
                            <%  for (Category c : categoryDAO.getListCategory()) {
                            %>
                            <li ><a href="product.jsp?categoryID=<%=c.getCategoryID()%>&pages=1" hover=""><%=c.getCategoryName()%></a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </li> 						
                    <li><a href="introduce.jsp" >  Giới thiệu</a></li>            
                    <li><a href="contact.jsp" >Liên hệ</a></a>						  				 
                    <li style="padding-bottom: 10px; width: 245px; margin-left: 100px;"><a>
                            <div class="search">
                                <form>
                                    <input type="text" placeholder="Sản phẩm cần tìm..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = '';
                                            }" >
                                    <input type="submit" value="">
                                </form>
                            </div>
                        </a></li>  
                        <%if (users != null) {%>
                    <li style="padding-right: 0;"><a><%=users.getUserEmail()%></a> </li>
                            <%}%>
                    <li><div class="cart">
                            <a href="giohang.jsp"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true" style="position: relative;bottom: 5px;color: #fff;"></i></a>
                            <a href="#" > </a>
                            <span> <%=cart.countItem()%></span>
                        </div>
                        <ul class="sub-icon1 list" style="background-color: #fff;">
                            <h3>Đã thêm gần đây</h3>
                            <div class="shopping_cart">
                                <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                                <div class="cart_box">
                                    <div class="message">
                                        <a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"><div class="alert-close"></div> </a>
                                        <div class="list_img"><img src="<%=list.getValue().getProduct().getProductImage()%>" class="img-responsive" alt=""></div>
                                        <div class="list_desc"><h4><a ><%=list.getValue().getProduct().getProductName()%></a></h4>
                                            <%=list.getValue().getQuantity()%> x<span class="actual"> <%=String.format("%,.0f",list.getValue().getProduct().getProductPrice())%> VNĐ</span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                            <div class="total">
                                <div class="total_left">Tổng tiền: </div>
                                <div class="total_right">
                                    <%=String.format("%,.0f",cart.totalCart())%> VNĐ</div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="login_buttons">
                                <div class="check_button"><a href="checkout.jsp">Thanh toán</a></div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </ul>
                    </li>
                </ul>
                <script type="text/javascript" src="js/nav.js"></script>
            </div>
        </div>
    </div>



</body>
</html>
