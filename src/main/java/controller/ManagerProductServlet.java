/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.ProductDAO;
import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Phan Tuan Anh
 */
public class ManagerProductServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    productDAO.deleteProduct(Long.parseLong(product_id));
                    url = "/admin/manager_product.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenSP = request.getParameter("tensp");
        String gia = request.getParameter("gia");
        String loai = request.getParameter("loai");
        String hinhanh = request.getParameter("hinhanh");
        String Mota = request.getParameter("mota");
//
        String url = "";
//        if (tenDanhMuc.equals("")) {
//            error = "Vui lòng nhập tên danh mục!";
//            request.setAttribute("error", error);
//        }
//
//        try {
//            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        productDAO.insertProduct(new Product(new Date().getTime(), tenSP,gia,loai,hinhanh,Mota));
                        url = "/admin/manager_product.jsp";
                        break;
//                    case "update":
//                        categoryDAO.updateCategory(new Category(Long.parseLong(request.getParameter("category_id")),
//                               tenDanhMuc));
//                        url = "/admin/manager_category.jsp";
//                        break;
                }
//            } else {
//                url = "/admin/insert_category.jsp";
//            }
//        } catch (Exception e) {
//        }
//        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//        rd.forward(request, response);

    
    

}
}
