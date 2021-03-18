package com.wild.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.constants.CheckAdmin;
import com.wild.daos.impl.ExamDTODao;
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.SubjectDao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.dtos.ExamDTO;
import com.wild.models.FileQuestion;
import com.wild.models.Question;
import com.wild.models.Subject;
import com.wild.models.UserMark;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {
	
	public HomeController() {
		// TODO Auto-generated constructor stub
		
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView homePage0(HttpServletRequest res) {
		Boolean check = CheckAdmin.checkAdmin(res);
		if(!check) return new ModelAndView("redirect:/trang-chu");
		
		
		ModelAndView mav = new ModelAndView("admin/tableMemberList");
		return mav;
	}
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public ModelAndView homePage(HttpServletRequest res) {
		Boolean check = CheckAdmin.checkAdmin(res);
		if(!check) return new ModelAndView("redirect:/trang-chu");
		
		
		ModelAndView mav = new ModelAndView("admin/tableMemberList");
		return mav;
	}

	@RequestMapping(value = "/admin/tableExamList", method = RequestMethod.GET)
	public ModelAndView tablePage(HttpServletRequest res) {
		Boolean check = CheckAdmin.checkAdmin(res);
		if(!check) return new ModelAndView("redirect:/trang-chu");
		
		
		ModelAndView mav = new ModelAndView("admin/tableExamList");

		ExamDTODao listExam = new ExamDTODao();
		List<ExamDTO> list = listExam.findExamsDTOAll();
		SubjectDao listDistinctSubject = new SubjectDao();
		List<Subject> listSubjectDistinct = listDistinctSubject.listSubject();

		mav.addObject("listSubjectDistinct", listSubjectDistinct);
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping(value = "/admin/tableMemberList", method = RequestMethod.GET)
	public ModelAndView memberList(@RequestParam(required = false, name = "id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		Boolean check = CheckAdmin.checkAdmin(request);
		if(!check) return new ModelAndView("redirect:/trang-chu");
		
		ModelAndView mav = new ModelAndView("admin/tableMemberList");

		UserMarkDao userMarkDao = new UserMarkDao();

		List<UserMark> listUser = userMarkDao.findAll();
		mav.addObject("listUser", listUser);


		return mav;
	}

	@RequestMapping(value = "/admin/editu", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody String edit(HttpServletRequest request) {
		
		Boolean check = CheckAdmin.checkAdmin(request);
		if(!check) return "";
		
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
		Boolean check = CheckAdmin.checkAdmin(req);
		if(!check) return "";
		
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
		Boolean check = CheckAdmin.checkAdmin(request);
		if(!check) return "";
		
		UserMarkDao userMarkDao = new UserMarkDao();
		String ajaxResponse = "";
		System.out.println("Id user : "+um.getIdUser());
		System.out.println("Status user : "+um.getStatus());
		
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

	
	@RequestMapping(value = "/admin/uploadexcel", method = RequestMethod.POST)
	@ResponseBody
	public String postFile(HttpServletRequest req, @RequestBody List<Question> qs) {
		Boolean check = CheckAdmin.checkAdmin(req);
		if(!check) return "";
		
		ModelAndView mav = new ModelAndView("web/detailQuestions");
//		System.out.println(qs.get(0).getContent());
//		System.out.println(qs.get(0).getIdExam());
//		//Chỗ này để add vô db
//		
//		
//		System.out.println(req.getAttribute("idExam"));
//		
		Boolean checkOK = true;
		int result = 0;
		for (int i = 0; i < qs.size(); i++) {
			String rs = qs.get(i).getRs();
			String rsA = qs.get(i).getRsA();
			String rsB = qs.get(i).getRsB();
			String rsC = qs.get(i).getRsC();
			String rsD = qs.get(i).getRsD();
			if(!rsA.equals(rs) && !rsB.equals(rs) && !rsC.equals(rs) && !rsD.equals(rs)) {
				result = -1;
				checkOK = false;
			}
		}
		
		if(checkOK) {
			QuestionDao qd = new QuestionDao();
			result= qd.addListQuestionByIdExam(qs);
		}
		
		String ajaxResponse="";
		
		switch (result) {
		case 0:
			ajaxResponse = "{\"status\":\"FAILED\"}";
			break;
		case -1:
			ajaxResponse = "{\"status\":\"NOTSAME\"}";
			break;
		default:
			ajaxResponse = "{\"status\":\"SUCCEED\"}";
			break;
		}
		
			
		return ajaxResponse;
	}

}
