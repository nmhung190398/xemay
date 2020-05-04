/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.Product;
import utils.FileSevletUtils;

/**
 *
 * @author Phan Tuan Anh
 */
public class ManagerProductServlet extends HttpServlet {

	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "images";

	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	ProductDAO productDAO = new ProductDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		String product_id = request.getParameter("product_id");

		String url = "/admin/manager_product.jsp";
		try {
			switch (command) {

			case "delete":
				productDAO.deleteProduct(Long.parseLong(product_id));

				break;
			}
		} catch (Exception e) {
		}

		response.sendRedirect(request.getContextPath() + url);
//		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF8");
		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		upload.setHeaderEncoding("utf-8");
		// constructs the directory path to store upload file
		// this path is relative to application's directory
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
		String hinhanh = null;
		Map<String, String> query = new HashMap<String, String>();
		try {
			List<FileItem> formItems = upload.parseRequest(request);
			for (FileItem fileItem : formItems) {
				if (fileItem.isFormField()) {
					query.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
				} else {
					hinhanh = UPLOAD_DIRECTORY + "/" + FileSevletUtils.upload(fileItem, uploadPath);
				}
			}
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String command = query.get("command");
		String tenSP = query.get("tensp");
		String gia = query.get("gia");
		Double price = 0D;
		try {
			price = Double.parseDouble(gia);
		} catch (Exception e) {
			// TODO: handle exception
		}
		String loai = query.get("loai");

		String Mota = query.get("mota");
//
		String url = "";
		String category = query.get("loai");
		Long categoryId = 0L;

		try {
			categoryId = Long.parseLong(category);
		} catch (Exception e) {
			// TODO: handle exception
		}
//        if (tenDanhMuc.eq1uals("")) {
//            error = "Vui lòng nhập tên danh mục!";
//            request.setAttribute("error", error);
//        }
//
//        try {
//            if (error.length() == 0) {
		switch (command) {
		case "insert":
			Product product = new Product(new Date().getTime(), categoryId, tenSP, hinhanh, price, Mota);
			productDAO.insertProduct(product);
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

		response.sendRedirect(request.getContextPath() + url);

	}
}
