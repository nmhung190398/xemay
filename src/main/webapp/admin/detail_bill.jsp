<%-- 
    Document   : detail
    Created on : Apr 1, 2017, 5:12:44 PM
    Author     : Phan Tuan Anh
--%>

<%@page import="dao.UsersDAO"%>
<%@page import="model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BillDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hóa đơn</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        
       

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h2>Chi tiết hóa đơn</h2>

                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">ID_Bill</th>
                            <th class="data">Tên sp</th>
                            <th class="data">Giá sp</th>
                           
                            <th class="data" width="16%">Tùy chọn</th>
                        </tr>
                        
                       
                        <tr class="data">
                            <td class="data" ></td>
                            <td class="data"></td>
                            <td class="data"></td>                           
                            <td class="data" width="75px">
                                <center>
                                    <a href="#" class="btn btn-success">Sửa |</a>
                                    <a href="" class="btn btn-danger">Xóa</a>
                                </center>
                            </td>
                        </tr>
                       

                    </table>
                </div>
                <div class="clear"></div>

            

        </div>


    </body>
</html>
