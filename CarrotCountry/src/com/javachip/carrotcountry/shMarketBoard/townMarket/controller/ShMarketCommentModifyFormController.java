package com.javachip.carrotcountry.shMarketBoard.townMarket.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javachip.carrotcountry.shMarketBoard.townMarket.model.service.TownMarketService;

/**
 * Servlet implementation class ShMarketCommentModifyFormController
 */
@WebServlet("/commentModifier.sh.hy")
public class ShMarketCommentModifyFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShMarketCommentModifyFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("utf-8");	
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String userContent = request.getParameter("userContent");
		
		int result = new TownMarketService().shMarketCommentModifier(commentNo,userContent);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
