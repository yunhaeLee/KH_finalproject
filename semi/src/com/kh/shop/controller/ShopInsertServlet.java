package com.kh.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.shop.model.service.ShopService;
import com.kh.board.model.vo.Attachment;
import com.kh.shop.model.vo.Shop;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.kh.member.model.vo.Member;
/**
 * Servlet implementation class ShopInsertServlet
 */
@WebServlet("/insert.sh")
public class ShopInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopInsertServlet() {
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

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",new DefaultFileRenamePolicy());
		     
			
			
			
			Shop s=new Shop();
			s.setShopTitle(multiRequest.getParameter("shopName"));
			s.setShopContent(multiRequest.getParameter("shopintro"));
			s.setPhoneNo(multiRequest.getParameter("phone"));
			s.setDetailLocation(multiRequest.getParameter("shopdetaillocation"));
			s.setShopWriter(multiRequest.getParameter("writer"));
			
	
			ArrayList<Attachment> fileList = new ArrayList<>();
			
			for(int i=1;i<=4;i++) {
				String name="file"+i;
				if(multiRequest.getOriginalFileName(name) !=null) {
					String originName =multiRequest.getOriginalFileName(name);
					String changeName =multiRequest.getFilesystemName(name);
					
					Attachment at =new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(originName);
					at.setChangeName(changeName);
					
					fileList.add(at);
				}
			}
			int result =new ShopService().insertShop(s,fileList);
			if(result>0) {
				response.sendRedirect("list.sh");
			}else {
				for(int i=0;i<fileList.size();i++) {
					File failedFile= new File(savePath+fileList.get(i).getChangeName());
					failedFile.delete();
				}
				request.setAttribute("msg", "사진게시물등록에 실패했습니다.");
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
