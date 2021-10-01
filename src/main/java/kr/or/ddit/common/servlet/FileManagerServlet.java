package kr.or.ddit.common.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.enumpkg.OperatorType;
import kr.or.ddit.vo.CalcVO;
import kr.or.ddit.vo.FileManagerVO;

@WebServlet("/fileManager.do")
public class FileManagerServlet extends HttpServlet {

	String srcFileSystemPath = null;
	String destFileSystemPath = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 기존 파일 위치
		String srcURL = "/resources/images";
		srcFileSystemPath = getServletContext().getRealPath(srcURL);
		File folder = new File(srcFileSystemPath);
		File[] images = folder.listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				String mime = getServletContext().getMimeType(name);
				return mime != null && mime.startsWith("image/");
			}
		});
		req.setAttribute("images", images);

		// 옮길 파일 위치
		String destURL = "/10";
		destFileSystemPath = getServletContext().getRealPath(destURL);
		File destFolder = new File(destFileSystemPath);
		File[] destImages = destFolder.listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				String mime = getServletContext().getMimeType(name);
				return mime != null && mime.startsWith("image/");
			}
		});
		req.setAttribute("destImages", destImages);

		// 포워드
		String view = "/WEB-INF/views/fileManager.jsp";
		req.getRequestDispatcher(view).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		FileManagerVO vo = null;
		int sc = 200;

		try (
				InputStream is = req.getInputStream();
			) {
			ObjectMapper objectMapper = new ObjectMapper();
			vo = objectMapper.readValue(is, FileManagerVO.class);
		} catch (Exception e) {
			resp.sendError(500);
		}
		
		//io작업
		String fileName = vo.getSelect();
		File srcFile = new File(srcFileSystemPath+"/"+fileName);
		Path srcPath = Paths.get(srcFileSystemPath+"/"+fileName);
		File destFile = new File(destFileSystemPath+"/"+fileName);
		Path destPath = Paths.get(destFileSystemPath, srcFile.getName());		
		System.out.println("destPath : " + destPath + "destFileSystemPath : " + destFileSystemPath + "srcFile.getName()" + srcFile.getName());
		
		try(
			InputStream is = new FileInputStream(srcFile);
		){
			if(vo.getRadio().equals("COPY")) {
				Files.copy(srcFile.toPath(),destFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
			}else if(vo.getRadio().equals("MOVE")) {
//				Files.move(srcPath, destPath, StandardCopyOption.REPLACE_EXISTING);
				srcFile.renameTo(destFile);
			}else {
				Files.delete(srcPath);
			}
		}
		
		
	}
}
