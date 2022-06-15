package com.utils;

import static sharer.RRsharer.request;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Part;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

public class XForm {

	/**
	 * Kiểm tra sự tồn tại của tham số
	 * 
	 * @param name tên tham số
	 * @return true nếu tồn tại, ngược lại là false
	 */
	public static boolean exist(String name) {
		return request().getParameter(name) != null || request().getParameter(name) !="";
	}
	
	/**
	 * Đọc chuỗi từ tham số form
	 * 
	 * @param name   tên tham số form
	 * @param defval giá trị mặc định
	 * @return Giá trị tham số hoặc defval nếu tham số không tồn tại
	 */
	public static String getString(String name, String defval) {
		String value = request().getParameter(name);
		return value == null ? defval : value;
	}

	public static Date getDate(String name, Date defval) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String date = getString(name, sdf.format(defval));
		try {
			return sdf.parse(date);
		} catch (Exception e) {
			return defval;
		}
	}

	/**
	 * Lưu file upload vào thư mục với tên duy nhất
	 * 
	 * @param name   tên tham số form
	 * @param folder thư mục chứa file
	 * @return File kết quả hoặc null nếu không upload
	 */

	public static File save(String filePart, String folder) {
		//get path images in server
				File dir = new File(request().getServletContext().getRealPath(folder));
				
				//create a folder if not exist
				if (!dir.exists()) {
					
					dir.mkdirs();
				}
				try {
					//get part image was choose
					Part part = request().getPart(filePart);
					
					if (part != null && part.getSize() > 0) {
						//path to save image
						File file = new File(dir, part.getSubmittedFileName());
						part.write(file.getAbsolutePath());	
						return file;
					}
					
				} catch (Exception e) {
					
				}
				return null;
	}


}
