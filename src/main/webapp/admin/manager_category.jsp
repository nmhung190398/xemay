<%-- 
    Document   : detail
    Created on : Apr 1, 2017, 10:22:19 PM
    Author     : Phan Tuan Anh
--%>

<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý danh mục</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>

        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getListCategory();
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h2>Quản lý danh mục</h2>
                    
                    <a href="${root}/admin/insert_category.jsp">+ Thêm danh mục</a>

                    <table class="data">

                        <tr class="data">
                            <th class="data" width="30px">STT</th>
                            <th class="data">Mã danh mục</th>
                            <th class="data">Tên danh mục</th>
                            <th class="data" width="16%">Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for(Category category : listCategory){
                                count++;
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=count%></td>
                            <td class="data"><%=category.getCategoryID()%></td>
                            <td class="data"><%=category.getCategoryName()%></td>
                            <td class="data" width="90px">
                            <center>
                                <a href="${root}/admin/update_category.jsp?command=update&category_id=<%=category.getCategoryID()%>" class="btn btn-success">Sửa </a>
                                <a href="/web/ManagerCategoryServlet?command=delete&category_id=<%=category.getCategoryID()%>" class="btn btn-danger">Xóa</a>
                            </center>
                            </td>
                        </tr>
                        <%}%>

                    </table>
                </div>
                <div class="clear"></div>

            

        </div>

    </body>
</html>
