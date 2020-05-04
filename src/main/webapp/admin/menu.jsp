<%-- 
    Document   : detail
    Created on : Apr 1, 2017, 2:52:56 PM
    Author     : Phan Tuan Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
        <link href="fontawesome/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
        
    </head>
    <body>

        <div id="leftBar">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin"><i class="fa fa-home fa-2x" aria-hidden="true"></i>  Trang chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/manager_category.jsp"><i class="fa fa-th-list fa-2x" aria-hidden="true"></i>  Danh mục</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/manager_product.jsp"><i class="fa fa-mobile fa-3x" aria-hidden="true" style="padding-right: 8px;margin-left: 5px;"></i>  Sản phẩm</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/manager_bill.jsp"><i class="fa fa-paper-plane fa-2x" aria-hidden="true"></i>  Hóa đơn</a></li>
                <li><a href="${root}/web/ChartServlet"><i class="fa fa-th-list fa-2x" aria-hidden="true"></i>  Thống kê</a></li>
            </ul>
        </div>

    </body>
</html>
