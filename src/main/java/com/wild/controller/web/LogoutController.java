package com.wild.controller.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "logoutControllerOfWeb")
public class LogoutController {
	private static final long serialVersionUID = 1L;

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
			return new ModelAndView("redirect:/trang-chu");
		}
		else
			return new ModelAndView("redirect:/trang-chu");	
	}

//	@RequestMapping(value = "/logout", method = RequestMethod.POST)
//	public ModelAndView logoutPage(HttpServletRequest request, HttpServletResponse response)
//			throws UnsupportedEncodingException {
//		request.setCharacterEncoding("UTF-8"); 
//		HttpSession session = request.getSession(false);
//		if (session.getAttribute("user") != null) {
//			session.removeAttribute("user");
//			return new ModelAndView("redirect:/trang-chu");
//		}
//		else
//			return new ModelAndView("redirect:/trang-chu");	
//	}
}
