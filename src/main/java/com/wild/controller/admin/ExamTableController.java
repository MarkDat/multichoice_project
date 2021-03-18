package com.wild.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wild.daos.impl.ExamDTODao;
import com.wild.dtos.ExamDTO;


@Controller(value = "examTableController")
public class ExamTableController {

	@RequestMapping(value = "/admin/addNewExamTable", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateStatusSubmit(HttpServletRequest request, @RequestBody ExamDTO examDTO) {
		System.out.println("updateStatusSubmit called");
		String ajaxResponse = "";
		System.out.println("id subject : "+examDTO.getIdSubject());
		System.out.println("Title exam : "+examDTO.getTitleExam());
		System.out.println("Name subject : "+examDTO.getNameSubject());
		
		ExamDTODao examDTODao = new ExamDTODao();
		long result = examDTODao.addNewExam(examDTO);

		
		if(result != 0) { 
			ajaxResponse = "{\"status\":\"SUCCEED\"}"; 
		} 
		else
			ajaxResponse = "{\"status\":\"FAILED\"}";
		 
		System.out.println("Ket qua cap nhat : "+result);
	
		
		return ajaxResponse;
	}
}