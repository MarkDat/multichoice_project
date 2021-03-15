package com.wild.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.daos.impl.ExamDTODao;
import com.wild.daos.impl.SubjectDao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.dtos.ExamDTO;
import com.wild.dtos.TestDTO;
import com.wild.models.Subject;
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
		List<ExamDTO> list = listExam.findExamsDTOAll();
		SubjectDao listDistinctSubject = new SubjectDao();
		List<Subject> listSubjectDistinct = listDistinctSubject.listDistinctSubject();

		mav.addObject("listSubjectDistinct", listSubjectDistinct);
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping(value = "/admin/tableMemberList", method = RequestMethod.GET)
	public ModelAndView memberList(@RequestParam(required = false, name = "id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("admin/tableMemberList");

		UserMarkDao userMarkDao = new UserMarkDao();

		List<UserMark> listUser = userMarkDao.findAll();
		mav.addObject("listUser", listUser);
//		 
//		
//		if(id != null) {
//			int idUser = Integer.parseInt(request.getParameter("id"));
//			UserMark userById = userMarkDao.findUserMarkById(idUser); 
//			mav.addObject("user", userById);
//			return mav;
//			
//		}

		return mav;
	}

	@RequestMapping(value = "/admin/editu", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody String edit(HttpServletRequest request) {
		int idUser = Integer.parseInt(request.getParameter("id"));

		UserMarkDao userMarkDao = new UserMarkDao();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(userMarkDao.findUserMarkById(idUser));
			System.out.println(ajaxResponse);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return ajaxResponse;
	}

	@RequestMapping(value = "/admin/editu", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String editSubmit(HttpServletRequest req, @RequestBody UserMark um) {
		System.out.println("CALL FUNCTION POST EDTI");
		System.out.println(um.getIdUser());
		System.out.println(um.getAddress());
		// System.out.println(req.getAttribute("idUser"));

		String ajaxResponse = "{\"status\":\"OK\"}";
		return ajaxResponse;
	}

}
