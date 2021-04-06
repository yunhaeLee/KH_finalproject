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
import com.kh.common.MyfileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/update.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
				
			String  resources= request.getSession().getServletContext().getRealPath("/resources");
			String fileSeparator = File.separator;

			String savePath = resources +fileSeparator+"board_upfiles"+fileSeparator;
			System.out.println("savePath:" + savePath);



			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyfileRenamePolicy());
			
			int bno=Integer.parseInt(multiRequest.getParameter("bno"));
			System.out.println(bno);
			Board b =new Board();
			b.setBoardTitle(multiRequest.getParameter("title"));
			b.setBoardContent(multiRequest.getParameter("content"));
			b.setBoardNo(bno);
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") !=null) {//새로운 파일이 들어온경우
				at =new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));//새로 수정된 원본파일
				at.setChangeName(multiRequest.getFilesystemName("upfile"));//새로 수정된 시스템파일명
				at.setFilePath(savePath);
				
				if(multiRequest.getParameter("originFile")!=null) {//기본파일에 있엇다면 ->첨부파일 테이블에 해당파일번호 찾아서 업데이트
					File deleteFile= new File(savePath+multiRequest.getParameter("originFile"));
					deleteFile.delete();//서버업로드 되어있던 기존파일삭제
					
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo"))); //수정하고자하는 파일 번호담기
				}else {//기존에 파일이 없었다면 ->insert 
					at.setRefBoardNo(bno);
				}
			} 
			int result= new BoardService().updateBoard(b,at);
			if (result>0) {
				response.sendRedirect("detail.bo?bno="+bno);
			}else {
				request.setAttribute("msg", "게시글수정에 실패했습니다.");
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
