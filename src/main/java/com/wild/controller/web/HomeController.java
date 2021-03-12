package com.wild.controller.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.ExamDTODao;
import com.wild.daos.impl.ExamDao;
import com.wild.daos.impl.GradeDao;
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.RankUserDao;
import com.wild.daos.impl.SubjectDao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.models.Grade;
import com.wild.models.RankUser;
import com.wild.models.Subject;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		QuestionDao qs = new QuestionDao();
		ExamDTODao exd = new ExamDTODao();
		ExamDao ex = new ExamDao();
		// List<Grade> grades = a.getAll();
		// List<Question> q = qs.findListQuesByIdExam(1L);
		// List<Exam> q = ex.findExamsBySubjectId(4L);

		SubjectDao sd = new SubjectDao();

		UserMarkDao umd = new UserMarkDao();
		RankUserDao rud = new RankUserDao();
		
//		List<Grade> grades = a.getAll();
		//List<Question> q = qs.findListQuesByIdExam(1L);
		//List<Exam> q = ex.findExamsBySubjectId(4L);
		
		for (RankUser q : rud.findAll()) {
			System.out.println(q.getName()+" "+q.getTotalMark());
		}
		

		List<Subject> listSup = sd.findAll();
		GradeDao a = new GradeDao();
		List<Grade> listGrade = a.getAll();
		
		mav.addObject("listSup", listSup);
		mav.addObject("listGrade", listGrade);
//		Exam objEx = new Exam(null, 3L, "Đề thi hóa phần hữu cơ");
//		System.out.println("OK add ? "+ex.addNewExam(objEx));
		return mav;
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
