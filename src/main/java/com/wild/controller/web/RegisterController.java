package com.wild.controller.web;

<<<<<<< Updated upstream
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
=======
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
>>>>>>> Stashed changes

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.UserDao;
import com.wild.models.Role;
import com.wild.models.User;
<<<<<<< Updated upstream
=======
import com.wild.utils.StringUtil;
>>>>>>> Stashed changes

/**
 * Servlet implementation class RegisterController
 */
<<<<<<< Updated upstream
@Controller(value = "registerControllerOfWeb")
=======
@Controller
>>>>>>> Stashed changes
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("pages_other/register");
		return mav;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerPage(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String fullName = request.getParameter("fullname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");

		ModelAndView mav = new ModelAndView("pages_other/register");
		UserDao userDao = new UserDao();

		if (!password.equals(repassword)) {
			mav.addObject("msg", "Password did not match");
		} else if (userDao.findUserByEmail(email) != null) {
			mav.addObject("msg", "Email has been registered");
		} else if (userDao.findUserByUsername(username) != null) {
			mav.addObject("msg", "Username has been registered");
		} else {

			User user = new User(fullName, email, address, phone, username, password, new Role("USER"));
			if (userDao.addNewUser(user) == 1) {
				mav = new ModelAndView("pages_other/login");
				return mav;
			} else {
				mav.addObject("msg", "Registration Failed");
			}
		}
		return mav;
	}
}
