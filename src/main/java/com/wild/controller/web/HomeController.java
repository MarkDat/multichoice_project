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
import com.wild.models.RankUser;
import com.wild.models.Subject;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		GradeDao a = new GradeDao();
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

		mav.addObject("listSup", listSup);

//		Exam objEx = new Exam(null, 3L, "Đề thi hóa phần hữu cơ");
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
