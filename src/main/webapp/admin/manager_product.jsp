<%-- 
    Document   : detail
    Created on : Apr 1, 2017, 9:19:45 PM
    Author     : Phan Tuan Anh
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sản phẩm</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            ArrayList<Product> listProduct = productDAO.getListProduct();
        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h2 style="font-size: 30px;">Quản lý sản phẩm</h2>
                     <a href="${root}/admin/insert_product.jsp">+ Thêm sản phẩm</a>       
                    
                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">ID</th>
                            <th class="data">Tên sp</th>
                            <th class="data">Giá</th>
                            <th class="data">Hình ảnh</th>
                            <th class="data" style="width: 35%;">Mô tả</th>
                            <th class="data" style="width: 13%;">Hành động</th>
                        </tr>
                        <%
                            int count = 0;
                            for(Product product : listProduct){
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%=product.getProductName()%></td>
                            <td class="data"><%=String.format("%,.0f", product.getProductPrice())%></td>
                            <td class="data"><img style="width: 20%;text-align: center;" src="${root}/UploadServlet?filename=<%=product.getProductImage()%>"></td>                            
                            <td class="data"><%=product.getProductDescription()%></td>
                            <td class="data">
                                <a href="#" class="btn btn-success">Sửa </a>
                                <a href="/web/ManagerProductServlet?command=delete&product_id=<%=product.getProductID()%>" class="btn btn-danger">Xóa</a>
                            </td>
                        
                        </tr>
                        <%}%>
                    </table>
                </div>
                <div class="clear"></div>

         

        </div>


    </body>
</html>
