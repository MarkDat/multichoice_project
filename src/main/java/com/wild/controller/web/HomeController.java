package com.wild.controller.web;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wild.daos.impl.ExamDTODao;
import com.wild.daos.impl.ExamDao;
import com.wild.daos.impl.GradeDao;
import com.wild.daos.impl.QuestionDao;
import com.wild.daos.impl.SubjectDao;
import com.wild.daos.impl.UserMarkDao;
import com.wild.dtos.ExamDTO;
import com.wild.models.Exam;
import com.wild.models.Grade;
import com.wild.models.Question;
import com.wild.models.Subject;
import com.wild.models.UserMark;

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
		UserMarkDao umd = new UserMarkDao();
//		List<Grade> grades = a.getAll();
		//List<Question> q = qs.findListQuesByIdExam(1L);
		//List<Exam> q = ex.findExamsBySubjectId(4L);
		
		for (UserMark q : umd.findAll()) {
			System.out.println(q.getFullName() + " " + q.getPoint()+"/"+q.getTimes());
		}
		
//		Exam objEx = new Exam(null, 3L, "Đề thi hóa phần hữu cơ");
//		System.out.println("OK add ? "+ex.addNewExam(objEx));
		return mav;
	}
}
