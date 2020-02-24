<%-- 
    Document   : detail
    Created on : Apr 1, 2017, 8:43:18 PM
    Author     : Phan Tuan Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
</head>
<body>    
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
                        </div>	
                        <div >
                        <input type="hidden" value="login" name="command">
                        <input type="submit" value="Đăng Nhập"> 
                        </div>
                        
                    </form>
                </div>    
                      
                </div>                        
            </div>
   

</body>
</html>
