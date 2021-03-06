package com.javachip.carrotcountry.coBuying.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javachip.carrotcountry.coBuying.model.service.ProductService;
import com.javachip.carrotcountry.coBuying.model.vo.PageInfo;
import com.javachip.carrotcountry.coBuying.model.vo.PostBoardJY;
import com.javachip.carrotcountry.shMarketBoard.mainPage.model.vo.PostBoard;
import com.javachip.carrotcountry.shMarketBoard.townMarket.model.service.TownMarketService;
import com.javachip.carrotcountry.shMarketBoard.townMarket.model.vo.ShmarketPageInfo;

/**
 * Servlet implementation class MainBoardTop4Controller
 */
@WebServlet("/top4.pro.jy")
public class MainBoardTop4Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainBoardTop4Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("application/json; charset=utf-8");
		
		int currentPage;
		int listCount; //게시글 총 갯수.
		int boardLimit;//한페이지에 몇개 보여줄건지
		int pageLimit; //페이지 하단에 보여질 페이지 갯수
		int maxPage; //마지막페이지
		int startPage; // 첫 페이지
		int endPage; // 마지막 페이지
		
		listCount = new TownMarketService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		boardLimit = 16;
		pageLimit=5;
		maxPage = (int)Math.ceil(((double)listCount/boardLimit));
		
		startPage =((currentPage-1)/pageLimit)*pageLimit+1; 
		
		endPage = startPage + pageLimit-1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
	
		PageInfo pi = new PageInfo(currentPage
                ,listCount
                ,boardLimit
                ,pageLimit
                ,maxPage
                ,startPage
                ,endPage);
		
		ArrayList<PostBoardJY> pList = new ProductService().boardTop4Selector(pi);
		
		Gson gson = new Gson();
		gson.toJson(pList,response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
