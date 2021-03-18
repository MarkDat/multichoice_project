package com.wild.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wild.daos.impl.ExamDao;
import com.wild.constants.CheckAdmin;
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.models.Exam;
import com.wild.models.Question;
import com.wild.models.UserMark;

@Controller(value = "editExamController")
public class EditExamController {

	@RequestMapping(value = "/admin/detailQuestions", method = RequestMethod.GET)
	public ModelAndView detailQuestions(HttpServletRequest request) {
		Boolean check = CheckAdmin.checkAdmin(request);
		if(!check) return new ModelAndView("redirect:/trang-chu");
		
		ModelAndView mav = new ModelAndView("admin/detailQuestions");

		long idExam = Long.parseLong(request.getParameter("idexam"));

		QuestionDao questionDetails = new QuestionDao();
		List<Question> listQuestionDetails= questionDetails.findListQuesByIdExam(idExam);
		//Question getIdExam = questionDetails.getIdExam(idExam);
		
		mav.addObject("listQuestionDetails", listQuestionDetails);
		mav.addObject("idExam", idExam);
		
		return mav;
	}

	@RequestMapping(value = "/admin/editExam", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody String editExam(HttpServletRequest request) {
		Boolean check = CheckAdmin.checkAdmin(request);
		if(!check) return "";
		
		int idQ = Integer.parseInt(request.getParameter("idQ"));

		QuestionDao question = new QuestionDao();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(question.editQuesById(idQ));
			System.out.println(ajaxResponse);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return ajaxResponse;
	}

	@RequestMapping(value = "/admin/editExam", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String editExam(HttpServletRequest request, @RequestBody Question question) {
		Boolean check = CheckAdmin.checkAdmin(request);
		if(!check) return "";
		
		String ajaxResponse;

		System.out.println("idq : " + question.getIdQ());
		System.out.println("content : " + question.getContent());
		System.out.println("rsA : " + question.getRsA());
		System.out.println("rsB : " + question.getRsB());
		System.out.println("rsC : " + question.getRsC());
		System.out.println("rsD : " + question.getRsD());
		System.out.println("rs : " + question.getRs());

		QuestionDao questionDao = new QuestionDao();
		int result = questionDao.editQues(question);
		result += questionDao.editResult(question);
		
		
		if (result != 0) {
			ajaxResponse = "{\"status\":\"SUCCEED\"}";
		} else
			ajaxResponse = "{\"status\":\"FAILED\"}";

		System.out.println("Ket qua edit exam : " + result);

		return ajaxResponse;
	}

	@RequestMapping(value = "/admin/deleteExam", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteExam(HttpServletRequest request, @RequestBody Question question) {
		Boolean check = CheckAdmin.checkAdmin(request);
		if(!check) return "";
		
		String ajaxResponse;

		System.out.println("idq : " + question.getIdQ());

		QuestionDao questionDao = new QuestionDao();
		int result = questionDao.deleteQuesById(question.getIdQ());

		if (result != 0) {
			ajaxResponse = "{\"status\":\"SUCCEED\"}";
		} else
			ajaxResponse = "{\"status\":\"FAILED\"}";

		System.out.println("Ket qua delete exam : " + result);

		return ajaxResponse;
	}

	@RequestMapping(value = "/admin/deleteExamItems", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteExamItems(HttpServletRequest request, @RequestBody List<Exam> exam) {
		String ajaxResponse = "";
		long result = 0;
		ExamDao deleteExam = new ExamDao();
		for (Exam ex : exam) {
			System.out.println(ex.getIdExam());
			deleteExam = new ExamDao();
			result += deleteExam.deleteExamByIdExam(ex.getIdExam());
			
		}
		
		
		if(result != 0) { 
			ajaxResponse = "{\"status\":\"SUCCEED\"}"; 
		} 
		else
			ajaxResponse = "{\"status\":\"FAILED\"}";
		
		System.out.println("Ket qua delete exam : "+result);
		
		return ajaxResponse;
	}
	
	
	@RequestMapping(value = "/admin/addNewExam", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addNewExam(HttpServletRequest request, @RequestBody Question question) {
		String ajaxResponse="";

		System.out.println("id exam : " + question.getIdExam());
		System.out.println("content : " + question.getContent());
		System.out.println("rsA : " + question.getRsA());
		System.out.println("rsB : " + question.getRsB());
		System.out.println("rsC : " + question.getRsC());
		System.out.println("rsD : " + question.getRsD());
		System.out.println("rs : " + question.getRs());

		
		QuestionDao questionDao = new QuestionDao(); 
		long result = questionDao.addNewQuesByIdExam(question);
		
		if (result != 0) { 
			ajaxResponse = "{\"status\":\"SUCCEED\"}"; 
		} 
		else
			ajaxResponse = "{\"status\":\"FAILED\"}";
		
		System.out.println("Ket qua edit exam : " + result);
		

		return ajaxResponse;
	}
	
	
	
	
	
	

}
