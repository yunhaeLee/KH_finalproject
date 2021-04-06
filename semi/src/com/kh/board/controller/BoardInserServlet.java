package com.kh.board.controller;

import java.io.File;  
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.member.model.vo.Member;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardInserServlet
 */
@WebServlet("/insert.bo")
public class BoardInserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {// true로 넘어옴


			int maxSize = 10 * 1024 * 1024;
			String  resources= request.getSession().getServletContext().getRealPath("/resources");
			String fileSeparator = File.separator;

			String savePath = resources +fileSeparator+"board_upfiles"+fileSeparator;

			System.out.println("savePath:" + savePath);

			// 2. MultipartRequest 객체 생성하기 (즉, 파일 서버에 업로드 하기)
			// MultipartRequest multiRequest = new MultipartRequest(request, savePath,
			// maxSize, "UTF-8", new DefaultFileRenamePolicy());

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());
			// --> 서버에 파일이 upload 됨

			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int userNo = ((Member) request.getSession().getAttribute("loginUser")).getM_no();
			


			Board b = new Board();

		
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setBoardWriter(String.valueOf(userNo));

			Attachment at = null;

			if (multiRequest.getOriginalFileName("upfile") != null) {

				String originName = multiRequest.getOriginalFileName("upfile");

				String changeName = multiRequest.getFilesystemName("upfile");

				at = new Attachment();

				at.setFilePath(savePath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
				
				

			}

			int result = new BoardService().insertBoard(b, at);
			if (result > 0) {
				request.getSession().setAttribute("msg", "게시글 등록 성공");
				response.sendRedirect("list.bo");
			} else {

				if (at != null) {
					// 삭제할 파일 객체 생성
					File failedFile = new File(savePath + at.getChangeName());
					failedFile.delete();
				}

				request.setAttribute("msg", "게시판 등록 실패!!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
