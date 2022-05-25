package com.example.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
	  response.setContentType("text/html; charset=UTF-8");
	  PrintWriter out = response.getWriter();

      if(request.getSession().getAttribute("uid")==null) {
         String path=request.getServletPath();
         String query=request.getQueryString() == null ? "":"?" + request.getQueryString();
         request.getSession().setAttribute("dest", path+query);

         out.println("<script language='javascript'>'");
         out.println("alert("+(path+query)+")");
         out.println("</script>");

         out.flush();
      }
      
      return super.preHandle(request, response, handler);
   }

   
}