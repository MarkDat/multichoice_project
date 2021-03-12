package com.wild.controller.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.SubjectDao;
import com.wild.models.Subject;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		SubjectDao sd = new SubjectDao();
		List<Subject> listSup = sd.findAll();
		mav.addObject("listSup", listSup);
		return mav;
	}
	@RequestMapping(value = "/grade/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String method7(@PathVariable("id") int id){
		return "method7 with id="+id;
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("pages_other/login");
		return mav;
	}

	@RequestMapping(value = "/customer_info", method = RequestMethod.GET)
	public ModelAndView cusInfoPage() {
		ModelAndView mav = new ModelAndView("web/customer_info");
		return mav;
	}

	@RequestMapping(value = "/edit_password", method = RequestMethod.GET)
	public ModelAndView editPassPage() {
		ModelAndView mav = new ModelAndView("web/edit_password");
		return mav;
	}
}
