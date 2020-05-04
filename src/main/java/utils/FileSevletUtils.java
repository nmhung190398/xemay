package utils;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileSevletUtils {
	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "images";

	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	public static String upload(FileItem fileItem, String uploadPath) {
		if (!fileItem.isFormField()) {
			String fileName = new File(fileItem.getName()).getName();
			String filePath = uploadPath + File.separator + fileName;
			File storeFile = new File(filePath);

			// saves the file on disk
			try {
				fileItem.write(storeFile);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return fileName;
		}
		return null;
	}

	public static String upfile(HttpServlet httpServlet, HttpServletRequest request, HttpServletResponse response) {

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

		// constructs the directory path to store upload file
		// this path is relative to application's directory
		String uploadPath = httpServlet.getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

		// creates the directory if it does not exist
//		File uploadDir = new File(uploadPath);
//		if (!uploadDir.exists()) {
//			uploadDir.mkdir();
//		}

		try {

			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				FileItem item = formItems.get(0);
				// iterates over form's fields
				// processes only fields that are not form fields
				if (!item.isFormField()) {
					String fileName = new File(item.getName()).getName();
					String filePath = uploadPath + File.separator + fileName;
					File storeFile = new File(filePath);

					// saves the file on disk
					item.write(storeFile);
					return fileName;
				}

			}
		} catch (Exception ex) {
			request.setAttribute("message", "There was an error: " + ex.getMessage());
		}
		// redirects client to message page

		return null;
	}
}
