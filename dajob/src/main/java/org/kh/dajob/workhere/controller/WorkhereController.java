package org.kh.dajob.workhere.controller;

import java.io.*;

import javax.servlet.http.*;

import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.powerlink.model.service.PowerLinkService;
import org.kh.dajob.workJobAndSkill.model.service.WorkJobAndSkillService;
import org.kh.dajob.workhere.model.service.WorkhereService;
import org.kh.dajob.workhere.model.vo.Workhere;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class WorkhereController {

	@Autowired
	private WorkhereService workhereService;
	
	@Autowired
	private WorkJobAndSkillService workJobnSkillService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "jobList.do")
	public String jobList(HttpSession session, Model model, HttpServletRequest request) throws IOException {

		int currentPage = 1;
		//한 페이지당 출력할 목록 갯수
		int limit = 8;
		int listCount = workhereService.getListCount();
		int maxPage = (int)((double)listCount / limit + 0.875);
		//전달된 페이지값 추출
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		model.addAttribute("workherelist",workhereService.selectWorkhereList(currentPage, limit));
		model.addAttribute("workAll",workhereService.selectWorkhereList());
		model.addAttribute("joblist", workJobnSkillService.selectJobList());
		model.addAttribute("skilllist", workJobnSkillService.selectSkillList());
		model.addAttribute("comtype", memberService.selectCompanyList());
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("maxPage",maxPage);
		model.addAttribute("listCount", listCount);
		model.addAttribute("powerlink", workhereService.selectPowerLinkList());
		
		
		return "workhere/joblist";
	}
	
	@RequestMapping(value = "jobsearch.do")
	public String jobSearch(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		
		String work_job = request.getParameter("jobkey");
		String work_skill = request.getParameter("skillkey");
		String work_title = request.getParameter("title");
		
		if(request.getParameter("jobkey").isEmpty()) {
			work_job = null;
		}
		if(request.getParameter("skillkey").isEmpty()) {
			work_skill = null;
		}
		if(request.getParameter("title").isEmpty()) {
			work_title = null;
		}
		
		Workhere wh = new Workhere();
		wh.setWork_job(work_job);
		wh.setWork_skill(work_skill);
		wh.setWork_title(work_title);
		
		model.addAttribute("workherelist",workhereService.selectJobSearchList(wh));
		model.addAttribute("joblist", workJobnSkillService.selectJobList());
		model.addAttribute("skilllist", workJobnSkillService.selectSkillList());
		model.addAttribute("comtype", memberService.selectCompanyList());
		return "workhere/joblist";
	}
	
	@RequestMapping(value = "skillList.do")
	public String skillList(HttpSession session, Model model, HttpServletRequest request) throws IOException {
		int currentPage = 1;
		//한 페이지당 출력할 목록 갯수
		int limit = 8;
		int listCount = workhereService.getListCount();
		int maxPage = (int)((double)listCount / limit + 0.875);
		//전달된 페이지값 추출
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		model.addAttribute("workherelist",workhereService.selectWorkhereList(currentPage, limit));
		model.addAttribute("comtype", memberService.selectCompanyList());
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("maxPage",maxPage);
		model.addAttribute("listCount", listCount);
		return "workhere/skilllist";
	}

	@RequestMapping(value = "workhereDetail.do")
	public String workhereDetail(HttpSession session, HttpServletRequest request, Model model) throws IOException {
		Workhere wh = workhereService.selectWorkhere(request.getParameter("workhere_no"));
		String[] skill = wh.getWork_skill().split(" ");
		model.addAttribute("comtype", memberService.selectCompanyList());
		model.addAttribute("workhere", wh);
		model.addAttribute("skill", skill);
		model.addAttribute("joblist", workJobnSkillService.selectJobList());
		model.addAttribute("skilllist", workJobnSkillService.selectSkillList());
		model.addAttribute("all",memberService.selectMemberAll());
		return "workhere/workheredetail";
	}
	
	@RequestMapping(value = "workhereDelete.do", produces = "text/plain;charset=UTF-8")
	public ModelAndView workhereDelete(@RequestParam("workhere_no") String workhere_no, ModelAndView mv) throws IOException{
		int result = workhereService.deleteWorkhere(workhere_no);
		System.out.println(result);
		if(result > 0) {
			mv.setViewName("index");
		} else {
			mv.addObject("msg", "공지사항 삭제 에러!!");
			mv.setViewName("404-page");
		}
		return mv;
	}
}
