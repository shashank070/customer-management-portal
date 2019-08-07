package com.crm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet{
	private static final Logger logger = Logger.getLogger(Logout.class);
	   @Override
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	         throws ServletException, IOException {
		   HttpSession session = request.getSession();
		   if(session!=null)
		   {
			   logger.info("********* LOGOUT REQUEST **********");
			   session.invalidate();
			   request.getRequestDispatcher("login.jsp").forward(request, response);
		   }else
		   {
			   request.getRequestDispatcher("login.jsp").forward(request, response);

		   }
		 
	   }
}
