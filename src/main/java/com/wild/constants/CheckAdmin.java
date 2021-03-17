package com.wild.constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.wild.models.User;
@Component
public class CheckAdmin {
	public static Boolean checkAdmin(HttpServletRequest res) {
		HttpSession ss = res.getSession();
		User u = (User) ss.getAttribute("user");
		if(u==null || !u.getRole().getCode().equals("ADMIN"))  return false;
		 return true;
	}
}
