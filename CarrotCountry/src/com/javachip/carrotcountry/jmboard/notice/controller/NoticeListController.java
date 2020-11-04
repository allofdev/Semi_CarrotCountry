package com.javachip.carrotcountry.jmboard.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javachip.carrotcountry.jmboard.notice.model.service.NoticeService;
import com.javachip.carrotcountry.jmboard.notice.model.vo.Notice;
import com.javachip.carrotcountry.jmboard.notice.model.vo.PageInfo;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/list.no.jm")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int listCount;
		int currentPage;
		int pageLimit;
		int noticeLimit;
		int maxPage;
		int startPage;
		int endPage;
		//
		listCount = new NoticeService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		noticeLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/noticeLimit);
		
		startPage = (currentPage - 1)/pageLimit * pageLimit + 1;
		
		
		
		endPage = startPage + pageLimit -1; 
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, noticeLimit, maxPage, startPage, endPage);
		//
		ArrayList<Notice> list = new NoticeService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
	
		request.getRequestDispatcher("views/notice/noticeListView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
