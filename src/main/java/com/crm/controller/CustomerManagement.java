package com.crm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.crm.util.SendRequest;
import com.crm.vo.Address;
import com.crm.vo.CustomerDetail;



/**
 * Servlet implementation class Login
 */
@WebServlet("/CustomerManagement")
public class CustomerManagement extends HttpServlet{
	 private static final long serialVersionUID = 1L;
	 
	 private static final Logger logger = Logger.getLogger(CustomerManagement.class);
	 
	 @Override
		public void init() {
		 
	 }
	 
	   @Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
	         throws ServletException, IOException {
		    
		   HttpSession session = req.getSession();
		   
		    String action= req.getParameter("action");
		    
		    String customerId= req.getParameter("customerid");
		    
		  
		    if(null!=customerId && null!=action && session.getAttribute("token")!=null)
		    {
		    	logger.info("GET REQUEST: "+action);
		    	CustomerDetail custDetail=SendRequest.sendGetRequestWithId(customerId,(String)session.getAttribute("token"));
		    	req.setAttribute("custDetail", custDetail);
		    	RequestDispatcher rd=req.getRequestDispatcher("getcustomer.jsp");  
		    	rd.include(req, resp);
		    }
		    else {
		    if(session.getAttribute("token")!=null) {
		    	List<CustomerDetail> custDetailList=SendRequest.sendGetRequest((String)session.getAttribute("token"));
		    	req.setAttribute("custDetailList", custDetailList);
		    	RequestDispatcher rd=req.getRequestDispatcher("customer_management_landing.jsp");  
		    	rd.include(req, resp); 
		    }else {
		    	RequestDispatcher rd=req.getRequestDispatcher("login.jsp");  
			    rd.include(req, resp); 
		    }
		    }
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
		         throws ServletException, IOException {
		   
		   String action=req.getParameter("action");
		   
		   HttpSession session = req.getSession();
		   
		   String token=(String)session.getAttribute("token");
		   
		   if(null!=action && (action.equals("post")||action.equals("put")))
		   {
			   logger.info("ACTION CALLED: "+action);

			 String firstName=req.getParameter("firstName");
			
			 String middleName=req.getParameter("middleName");
			
			 String lastName=req.getParameter("lastName");
			
			 String dateOfBirth=req.getParameter("dateOfBirth");
			
			 String mobileNumber=req.getParameter("mobileNumber");
			
			 String gender=req.getParameter("gender");
			
			 String customerNumber=req.getParameter("customerNumber");
			
			 String countryOfBirth=req.getParameter("countryOfBirth");
			
			 String countryOfResidence=req.getParameter("countryOfResidence");
			
			 String customerSegment=req.getParameter("customerSegment");
		   
			 String typeResidence=req.getParameter("typeResidence");
				
			 String addrLine1Residence=req.getParameter("addrLine1Residence");

			 String addrLine2Residence=req.getParameter("addrLine2Residence");
				
			 String addrLine3Residence=req.getParameter("addrLine3Residence");
				
			 String addrLine4Residence=req.getParameter("addrLine4Residence");
				
			 String countryCodeResidence=req.getParameter("countryCodeResidence");
				
			 String zipResidence=req.getParameter("zipResidence");
				
			 String stateResidence=req.getParameter("stateResidence");
				
			 String cityResidence=req.getParameter("cityResidence");
			 
			 String typeOffice=req.getParameter("typeOffice");
				
			 String addrLine1Office=req.getParameter("addrLine1Office");

			 String addrLine2Office=req.getParameter("addrLine2Office");
				
			 String addrLine3Office=req.getParameter("addrLine3Office");
				
			 String addrLine4Office=req.getParameter("addrLine4Office");
				
			 String countryCodeOffice=req.getParameter("countryCodeOffice");
				
			 String zipOffice=req.getParameter("zipOffice");
				
			 String stateOffice=req.getParameter("stateOffice");
				
			 String cityOffice=req.getParameter("cityOffice");
			 
			 Address residenceAdderss= new Address(typeResidence, addrLine1Residence, addrLine2Residence, addrLine3Residence, addrLine4Residence, countryCodeResidence, zipResidence, stateResidence, cityResidence);
			 
			 Address officeAdderss= new Address(typeOffice, addrLine1Office, addrLine2Office, addrLine3Office, addrLine4Office, countryCodeOffice, zipOffice, stateOffice, cityOffice);
			 
			 List<Address> addrList = new ArrayList<Address>();
			 
			 addrList.add(residenceAdderss);
			 
			 addrList.add(officeAdderss);
			 
			 CustomerDetail customerDetail= new CustomerDetail(firstName, middleName, lastName, dateOfBirth, mobileNumber, gender, customerNumber, countryOfBirth, countryOfResidence, customerSegment, addrList) ;
			 
			 if(action.equals("post"))
			 SendRequest.sendPostRequest(customerDetail,token);
			 
			 if(action.equals("put"))
			 SendRequest.sendPutRequest(customerDetail,token);
			 
		   }
		   if(null!=action && action.equals("delete"))
		   {
			   
			   logger.info("ACTION CALLED: "+action);
			   
			   String[] custometIdArr=req.getParameterValues("customerId");
			   SendRequest.sendDeleteRequest(token,custometIdArr); 
		   }
		   
	
		    
		    if(session.getAttribute("token")!=null) {
		    	List<CustomerDetail> custDetailList=SendRequest.sendGetRequest((String)session.getAttribute("token"));
		    	req.setAttribute("custDetailList", custDetailList);
		    	RequestDispatcher rd=req.getRequestDispatcher("customer_management_landing.jsp");  
		    	rd.include(req, resp); 
		    }else {
		    	RequestDispatcher rd=req.getRequestDispatcher("login.jsp");  
			    rd.include(req, resp); 
		    }
		 }
	   
}
