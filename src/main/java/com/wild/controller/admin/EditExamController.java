package com.wild.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "editExamController")
public class EditExamController {
	
	@RequestMapping(value = "/admin/detailQuestions", method = RequestMethod.GET)
	public ModelAndView detailQuestions() {
		ModelAndView mav = new ModelAndView("admin/detailQuestions");
		return mav;
	}
	
}
