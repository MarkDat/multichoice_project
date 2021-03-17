package com.wild.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.ExamDTODao;
import com.wild.daos.impl.ExamDao;
import com.wild.daos.impl.GradeDao;
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.SubjectDao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.models.Exam;
import com.wild.models.Grade;
import com.wild.models.Question;
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
//		RankUserDao rud = new RankUserDao();
//		UserDao ud  = new UserDao();
//		List<Grade> grades = a.getAll();
		//List<Question> q = qs.findListQuesByIdExam(1L);
		//List<Exam> q = ex.findExamsBySubjectId(4L);
		
//		for (RankUser q : rud.findAll()) {
//			System.out.println(q.getName()+" "+q.getTotalMark());
//		}
//		
//
		List<Subject> listSup = sd.findAll();
		GradeDao a = new GradeDao();
		List<Grade> listGrade = a.getAll();
		
		mav.addObject("listSup", listSup);
		mav.addObject("listGrade", listGrade);
//		Exam objEx = new Exam(null, 3L, "Đề thi hóa phần hữu cơ");
//		System.out.println("OK add ? "+ex.addNewExam(objEx));
		
		
		
		return mav;
	}

	@RequestMapping(value = "/grade", method = RequestMethod.GET)
	public ModelAndView grade(@RequestParam(required = false, name = "id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("web/home");
		SubjectDao sd = new SubjectDao();

		long idGrade = Long.parseLong(request.getParameter("id"));

		List<Subject> listSup = sd.findSubjectsByIdGrade(idGrade);
		mav.addObject("listSup", listSup);
		return mav;
	}

	@RequestMapping(value = "/sup", method = RequestMethod.GET)
	public ModelAndView sup(@RequestParam(required = false, name = "id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("web/listExam");
		ExamDao ex = new ExamDao();

		long idSup = Long.parseLong(request.getParameter("id"));

		List<Exam> listExam = ex.findExamsBySubjectId(idSup);
		mav.addObject("listExam", listExam);
		return mav;
	}

	@RequestMapping(value = "/exam", method = RequestMethod.GET)
	public ModelAndView exam(@RequestParam(required = false, name = "id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("web/listQuestion");
		QuestionDao q = new QuestionDao();
		ExamDao ex = new ExamDao();

		long idEx = Long.parseLong(request.getParameter("id"));

		List<Question> listQuestion = q.findListQuesByIdExam(idEx);
		Exam exam = ex.findExamById(idEx);
		mav.addObject("listQuestion", listQuestion);
		mav.addObject("exam", exam);
		return mav;
	}

	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public ModelAndView result(@RequestParam(required = false, name = "id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("web/result");
	
		return mav;
	}

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public ModelAndView loginPage() {
//		ModelAndView mav = new ModelAndView("pages_other/login");
//		
//		//Code mẫu
////		User u = ud.findByUserInforNameAndPassword("admin", "123456");
////		if(u==null) System.out.println("Ok đéo đăng nhập đc");
////		else {
////			System.out.println(u.getFullName()+" "+u.getRole().getCode());
////		}
//		
//		return mav;
//	}
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
