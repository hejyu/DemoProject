package org.iclass.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iclass.controller.Controller;

import lombok.extern.slf4j.Slf4j;

//new RequestKeyValue("/logout.hrd", "GET")
@Slf4j
public class LogoutController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그 아웃
		HttpSession session = request.getSession();
		log.info("session =  {}", session);
		session.invalidate(); 			//세션 무효화:기존 세션ID 삭제 
	//	response.sendRedirect(request.getContextPath());
		
		log.info("session invalidate =  {}", session);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("logout.jsp");
		dispatcher.forward(request, response);
	}

}
