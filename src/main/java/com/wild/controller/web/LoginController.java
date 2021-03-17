package com.wild.controller.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.UserDao;
import com.wild.models.User;

@Controller(value = "loginControllerOfWeb")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("pages_other/login");
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView("pages_other/login");
		UserDao userDao = new UserDao();
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);

		session.setAttribute("email", email);
		if (userDao.findByEmailAndPassword(user)) {
			if (userDao.isActiveUser(user) == 0) {
				session.setAttribute("user", user);
				return new ModelAndView("redirect:/trang-chu");
			} else {
				mav.addObject("msg", "Tài khoản đã bị khóa");
			}
		} else {
			mav.addObject("msg", "Sai mật khẩu hoặc tài khoản");
		}
		return mav;
	}
}