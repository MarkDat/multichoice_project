package com.wild.controller.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.UserDao;
import com.wild.models.Role;
import com.wild.models.User;
import com.wild.utils.StringUtil;

/**
 * Servlet implementation class RegisterController
 */
@Controller
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("pages_other/register");
		return mav;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerPage(HttpServletRequest request) {
		String fullName = request.getParameter("fullname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		
		ModelAndView mav;
		UserDao userDao = new UserDao();
		
		if(!password.equals(repassword)) {
			mav = new ModelAndView("pages_other/register?msg=1");
			return mav;
		} else if(userDao.findUserByEmail(email) != null) {
			mav = new ModelAndView("pages_other/register?msg=2");
			return mav;
		} else if(userDao.findUserByUsername(username) != null) {
			mav = new ModelAndView("pages_other/register?msg=3");
			return mav;
		}
		
		User user = new User(fullName, email, address, phone, username, password, new Role("USER"));
		if(userDao.addNewUser(user) == 1) {
			mav = new ModelAndView("pages_other/login");
		} else {
			mav = new ModelAndView("pages_other/register?msg=4");
		}
		return mav;
	}
}
