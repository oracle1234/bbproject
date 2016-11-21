package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.ThemeRecipeService;

@Controller
public class ImageController {

	private ThemeRecipeService service;

	public ImageController() {

	}

	public void setService(ThemeRecipeService service) {
		this.service = service;
	}

	// <img src="image.do?filename=사진이름" alt="Upload Image" />
	@RequestMapping(value = "/image.do", method = RequestMethod.GET)
	public void showImage(String filename, HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {

		String filePath = request.getSession().getServletContext().getRealPath(File.separator) + "/temp/" + filename;

		byte[] a = readFile(filePath);

		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(a);
		response.getOutputStream().close();
	}

	private byte[] readFile(String fileName) throws IOException {
		String path = fileName;

		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
		int length = bis.available();
		byte[] bytes = new byte[length];
		bis.read(bytes);
		bis.close();

		return bytes;
	}

}
