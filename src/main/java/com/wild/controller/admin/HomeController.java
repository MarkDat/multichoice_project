package com.wild.controller.admin;

import java.util.List;

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


		return mav;
	}

	@RequestMapping(value = "/admin/editu", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody String edit(HttpServletRequest request) {
		int idUser = Integer.parseInt(request.getParameter("id"));
		System.out.println("id nguoi dung: "+idUser);
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
		String ajaxResponse;

		
		UserMarkDao userMarkDao = new UserMarkDao();
		int result = userMarkDao.editListMember(um);
		
		if(result != 0) {
			ajaxResponse = "{\"status\":\"SUCCEED\"}";
		}
		else
			ajaxResponse = "{\"status\":\"FAILED\"}";
		
		
		return ajaxResponse;
	}
	

	
	
	@RequestMapping(value = "/admin/deleteu", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateStatusSubmit(HttpServletRequest request, @RequestBody UserMark um) {

		UserMarkDao userMarkDao = new UserMarkDao();
		String ajaxResponse = "";
		System.out.println("Id user : "+um.getIdUser());
		System.out.println("Status user : "+um.getStatus());
		;
		
		
		int result;
		if(um.getStatus() == 0) {
			um.setStatus(1);
			result = userMarkDao.updateStatusListMember(um);
		}
		else {
			um.setStatus(0);
			result = userMarkDao.updateStatusListMember(um);
		}
		 
		
		if(result != 0) {
			ajaxResponse = "{\"status\":\"SUCCEED\"}";
		}
		else
			ajaxResponse = "{\"status\":\"FAILED\"}";
		
		System.out.println("Ket qua cap nhat : "+result);
		
		return ajaxResponse;
	}

	

}
