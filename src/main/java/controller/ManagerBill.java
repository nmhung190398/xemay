/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BillDAO;
import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Bill;

/**
 *
 * @author Phan Tuan Anh
 */
public class ManagerBill extends HttpServlet {

    BillDAO billDAO = new BillDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String bill_id = request.getParameter("bill_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    billDAO.deleteBill(Long.parseLong(bill_id));
                    url = "/admin/manager_bill.jsp";
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
//        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("utf-8");
//        String command = request.getParameter("command");
//        String tenDanhMuc = request.getParameter("tenDanhMuc");
//
//        String url = "", error = "";
//        if (tenDanhMuc.equals("")) {
//            error = "Vui lòng nhập tên danh mục!";
//            request.setAttribute("error", error);
//        }
//
//        try {
//            if (error.length() == 0) {
//                switch (command) {
//                    case "insert":
//                        billDAO.insertCategory(new (new Date().getTime(), tenDanhMuc));
//                        url = "/admin/manager_category.jsp";
//                        break;
//                    case "update":
//                        categoryDAO.updateCategory(new Category(Long.parseLong(request.getParameter("category_id")),
//                               tenDanhMuc));
//                        url = "/admin/manager_category.jsp";
//                        break;
//                }
//            } else {
//                url = "/admin/insert_category.jsp";
//            }
//        } catch (Exception e) {
//        }
//        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//        rd.forward(request, response);

    }

}
