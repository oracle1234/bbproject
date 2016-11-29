package view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import dao.QA_BoardDAO;

// 다운로드 창을 띄우기 위한 뷰페이지
public class BoardDownLoadView extends AbstractView {

	private QA_BoardDAO qdao;

	public BoardDownLoadView() {

	}

	public void setQdao(QA_BoardDAO qdao) {
		this.qdao = qdao;
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int num = Integer.parseInt(request.getParameter("qa_no"));
		
		// System.out.println(model.get("num"));

		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;

		String upload = qdao.getFile(num);

		String fileName = upload.substring(upload.indexOf("_") + 1);
		// 파일명이 한글일때 인코딩 작업을 한다.
		String str = URLEncoder.encode(fileName, "UTF-8");
		// 원본 파일명에서 공백이 있을때 +로 표시가 되므로 공백으로 처리해줌
		//str = str.replaceAll("\\+", "%20");

		// 컨텐트 타입
		response.setContentType("application/octat-stream");
		// 다운로드창에 보여줄 파일명을 지정한다.
		response.setHeader("Content-Disposition", "attachment;filename=" + str + ";");
		// 서버에 저장된 파일을 읽어와 클라이언트에 출력해 준다.
		FileCopyUtils.copy(new FileInputStream(new File(saveDirectory, upload)), response.getOutputStream());

	}

}
