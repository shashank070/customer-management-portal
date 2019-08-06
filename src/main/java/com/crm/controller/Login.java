package com.crm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crm.util.SendRequest;
import com.crm.vo.Address;
import com.crm.vo.CustomerDetail;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet{
	
	 public static Properties  properties;
	 private static final long serialVersionUID = 1L;
	 @Override
		public void init() {
		  properties = new Properties();
	        try {
	            properties.load(getClass().getClassLoader().getResourceAsStream("application.properties"));
	        } catch (IOException e) {
	        }
	 }
	   
	   @Override
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	         throws ServletException, IOException {
		
		   RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
	        rd.include(request, response);
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		         throws ServletException, IOException {
		   
	        
		   String token=request.getParameter("token");
		   HttpSession session = request.getSession();
		   session.setAttribute("token", token);
		   if(null!=token && SendRequest.checkTokenAuthentication(token))
		   {
			   CustomerManagement customerManagement = new CustomerManagement();
			   customerManagement.doGet(request, response);
		   }else
		   {
			    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
		        rd.include(request, response);  
		   }
		    
		  }	
	
}
