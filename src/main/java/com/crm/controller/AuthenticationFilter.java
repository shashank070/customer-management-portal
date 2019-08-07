package com.crm.controller;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crm.util.SendRequest;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class AuthenticationFilter implements Filter {

    private ServletContext context;
    private List<String> excludedUrls;

    public void init(FilterConfig config) throws ServletException {
        String excludePattern = config.getInitParameter("excludedUrls");
        excludedUrls = Arrays.asList(excludePattern.split(","));

        this.context = config.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        if(uri.equals("/")) {
            chain.doFilter(request, response);
            return;
        }

        String path = req.getServletPath();
        if(excludedUrls.stream().anyMatch(e -> path.contains(e))) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        if(session==null)
        {

            this.context.log("Unauthorized access request");
            res.sendRedirect("login.jsp");
        
        }
        else {
        String	token= (String) session.getAttribute("token");
        if (token==null ||!(SendRequest.checkTokenAuthentication(token))) {
            this.context.log("Unauthorized access request");
            res.sendRedirect("login.jsp");
        } else{
            // pass the request along the filter chain
            chain.doFilter(request, response);
        }
        }
        
    }

    @Override
    public void destroy() {
    }
}