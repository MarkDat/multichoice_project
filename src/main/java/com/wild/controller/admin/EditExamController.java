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
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.models.Question;
import com.wild.models.UserMark;

@Controller(value = "editExamController")
public class EditExamController {
	
	@RequestMapping(value = "/admin/detailQuestions", method = RequestMethod.GET)
	public ModelAndView detailQuestions(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/detailQuestions");
		
		long idExam = Long.parseLong(request.getParameter("idexam"));
		
		System.out.println("Day la id exam : " + idExam);
		
		QuestionDao questionDetails = new QuestionDao();
		List<Question> listQuestionDetails= questionDetails.findListQuesByIdExam(idExam);
		 
		mav.addObject("listQuestionDetails", listQuestionDetails);
		
		
		return mav;
	}
	
	
	@RequestMapping(value = "/admin/editExam", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public @ResponseBody String editExam(HttpServletRequest request) {
		int idQ = Integer.parseInt(request.getParameter("idQ"));
		System.out.println("id cau hoi: "+idQ);
		
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
		String ajaxResponse;

		System.out.println("idq : "+question.getIdQ());
		System.out.println("content : "+question.getContent());
		System.out.println("rsA : "+question.getRsA());
		System.out.println("rsB : "+question.getRsB());
		System.out.println("rsC : "+question.getRsC());
		System.out.println("rsD : "+question.getRsD());
		
		QuestionDao questionDao = new QuestionDao();
		int result = questionDao.editQues(question);
		
		if(result != 0) {
			ajaxResponse = "{\"status\":\"SUCCEED\"}";
		}
		else
			ajaxResponse = "{\"status\":\"FAILED\"}";
		
		System.out.println("Ket qua edit exam : "+result);
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/admin/deleteExam", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteExam(HttpServletRequest request, @RequestBody Question question) {
		String ajaxResponse;

		System.out.println("idq : "+question.getIdQ());
		
		QuestionDao questionDao = new QuestionDao();
		int result = questionDao.deleteQuesById(question.getIdQ());
		
		if(result != 0) {
			ajaxResponse = "{\"status\":\"SUCCEED\"}";
		}
		else
			ajaxResponse = "{\"status\":\"FAILED\"}";
		
		System.out.println("Ket qua delete exam : "+result);
		
		return ajaxResponse;
	}
	
	
}
