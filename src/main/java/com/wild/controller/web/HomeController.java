package com.wild.controller.web;

import java.util.ArrayList;
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
import com.wild.utils.ReadWriteExcel;

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
		
		
		mav.addObject("listSup", listSup);
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

		long idEx = Long.parseLong(request.getParameter("idExam"));
		QuestionDao q = new QuestionDao();
		List<Question> listQuestion = q.findListQuesByIdExam(idEx);
		ExamDao ex = new ExamDao();

		Exam exam = ex.findExamById(idEx);

		float resultMark = 0;
		float markOfEachQ = listQuestion.size() / 10;
		int countResult = 0;

		for (int i = 0; i < listQuestion.size(); i++) {
			String resultOfQ = request.getParameter(listQuestion.get(i).getIdQ() + "");
			if (listQuestion.get(i).getRs().equals(resultOfQ)) {
				resultMark += markOfEachQ;
				countResult++;
			}
			if (listQuestion.get(i).getRsA().equals(resultOfQ))
				listQuestion.get(i).setChoseA(true);
			else if (listQuestion.get(i).getRsB().equals(resultOfQ))
				listQuestion.get(i).setChoseB(true);
			else if (listQuestion.get(i).getRsC().equals(resultOfQ))
				listQuestion.get(i).setChoseC(true);
			else if (listQuestion.get(i).getRsD().equals(resultOfQ))
				listQuestion.get(i).setChoseD(true);
		}

		System.out.println("Tổng kết điểm : " + resultMark);

		mav.addObject("mark", resultMark);
		mav.addObject("countResult", countResult);
		mav.addObject("listQuestion", listQuestion);
		mav.addObject("exam", exam);
		return mav;
	}


	@RequestMapping(value = "/customer_info", method = RequestMethod.GET)
	public ModelAndView getCusInfoPage() {
		ModelAndView mav = new ModelAndView("web/customer_info");
		return mav;
	}

//	@RequestMapping(value = "/customer_info", method = RequestMethod.POST)
//	public ModelAndView postCusInfoPage(@RequestParam(required = false, name = "email") String email, HttpServletRequest request,
//			HttpServletResponse response) {
//		ModelAndView mav = new ModelAndView("web/result");
//		System.out.println(request.getParameter("email"));
//		return mav;
//	}

	@RequestMapping(value = "/edit_password", method = RequestMethod.GET)
	public ModelAndView editPassPage() {
		ModelAndView mav = new ModelAndView("web/edit_password");
		return mav;
	}
	
	
}
