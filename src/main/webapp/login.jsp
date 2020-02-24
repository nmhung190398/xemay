<%-- 
    Document   : index
    Created on : Mar 30, 2017, 4:24:05 PM
    Author     : Phan Tuan Anh
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

           <div class="container">
                <div class="account">
                    <div class="col-md-6 login-right">
                    <h2 class="account-in" style="color: blue">ĐĂNG NHẬP</h2>
                    <form action="UsersServlet" method="POST">
                        <%if(request.getParameter("error")!=null){%>
                        <div>
                            <p style="color:red"><%=request.getParameter("error")%></p>
                        </div> 
                        <%}%>
                        <div style="text-align: left">
                            <span>Username*</span>
                            <input type="text" name="email">
                        </div> 	
                         <div style="text-align: left"> 
                            <span class="word">Password*</span>
                            <input type="password" name="pass">
                        </div style="text-align: center">	
                        <div >
                        <input type="hidden" value="login" name="command">
                        <input type="submit" value="Đăng Nhập"> 
                        </div>
                        
                    </form>
                </div>    
                        <div  class="col-md-6 login-left" >
                        <h2 class="account-in" style="color: blue">ĐĂNG KÝ TÀI KHOẢN MỚI</h2>
                        <h4>KHÁCH HÀNG MỚI!</h4>                   
                        <p>Bằng cách tạo một tài khoản với cửa hàng của chúng tôi, bạn sẽ có thể thanh toán nhanh hơn, lưu trữ nhiều địa chỉ giao hàng, xem và theo dõi đơn đặt hàng của bạn trong tài khoản của bạn và hơn thế nữa.</p>
                        <br>
                        <a class="btn btn-default" href="register.jsp" style="background-color: #0076F9; color: white"><b>ĐĂNG KÝ MỚI</b></a>
                        </div>
                </div>                        
            </div>

        <jsp:include page="footer.jsp"></jsp:include>


    </body>
</html>
