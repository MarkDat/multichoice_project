package com.wild.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.ExamDTODao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.dtos.ExamDTO;
import com.wild.models.UserMark;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
	
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}

	@RequestMapping(value = "/admin/tableExamList", method = RequestMethod.GET)
	public ModelAndView tablePage() {
		ModelAndView mav = new ModelAndView("admin/tableExamList");
		
		
		ExamDTODao listExam = new ExamDTODao();
		List<ExamDTO> list= listExam.findExamsDTOAll();
		
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "/admin/tableExamList", method = RequestMethod.GET)
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView("admin/listMember");
		
		UserMarkDao userListResult = new UserMarkDao();
		List<UserMark> listUser = userListResult.findAll(); 
		
		mav.addObject("list", listUser);
		return mav;
	}
	
	
	
	
}
