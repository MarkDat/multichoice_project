package com.wild.controller.web;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.wild.daos.IUserDao;
import com.wild.daos.impl.ExamDTODao;
import com.wild.daos.impl.ExamDao;
import com.wild.daos.impl.GradeDao;
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.SubjectDao;
import com.wild.dtos.ExamDTO;
import com.wild.models.Exam;
import com.wild.models.Grade;
import com.wild.models.Question;
import com.wild.models.Role;
import com.wild.models.Subject;
import com.wild.models.User;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		GradeDao a = new GradeDao();
		QuestionDao qs = new QuestionDao();
		ExamDTODao exd = new ExamDTODao();
		ExamDao ex = new ExamDao();
		SubjectDao sd = new SubjectDao();
		//List<Grade> grades = a.getAll();
		//List<Question> q = qs.findListQuesByIdExam(1L);
		//List<Exam> q = ex.findExamsBySubjectId(4L);
		
		for (Subject q : sd.findSubjectsByIdGrade(1L)) {
			System.out.println(q.getNameSubject());
		}
		
//		Exam objEx = new Exam(null, 3L, "Ä�á»� thi hÃ³a pháº§n há»¯u cÆ¡");
//		System.out.println("OK add ? "+ex.addNewExam(objEx));
		return mav;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("pages_other/login");
		return mav;
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage() {
		ModelAndView mav = new ModelAndView("pages_other/register");
		return mav;
	}
}
