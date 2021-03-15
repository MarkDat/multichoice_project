package com.wild.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.ExamDao;
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.SubjectDao;
import com.wild.models.Exam;
import com.wild.models.Question;
import com.wild.models.Subject;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("web/home");
		SubjectDao sd = new SubjectDao();
		List<Subject> listSup = sd.findAll();
		mav.addObject("listSup", listSup);
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
