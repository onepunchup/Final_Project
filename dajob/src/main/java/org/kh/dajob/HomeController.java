package org.kh.dajob;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.kh.dajob.dashboard.model.service.DashBoardService;
import org.kh.dajob.dashboard.model.vo.DashBoard;
import org.kh.dajob.itinfo.model.service.ItinfoService;
import org.kh.dajob.itinfo.model.vo.Itinfo;
import org.kh.dajob.member.model.service.MemberService;
import org.kh.dajob.powerlink.model.service.PowerLinkService;
import org.kh.dajob.workJobAndSkill.model.service.WorkJobAndSkillService;
import org.kh.dajob.workhere.model.service.WorkhereService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ItinfoService itinfoService;
	
	@Autowired
	private WorkhereService workhereService;
	
	@Autowired
	private WorkJobAndSkillService workJobnSkillService;
	
	@Autowired
	private PowerLinkService powerlinkService;
	
	@Autowired
	private DashBoardService dashboardService;
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		ArrayList<Itinfo> itlist = itinfoService.selectR5List();
		
		model.addAttribute("itlist", itlist);
		model.addAttribute("joblist", workJobnSkillService.selectJobList());
		model.addAttribute("skilllist", workJobnSkillService.selectSkillList());
		model.addAttribute("workPowerLink", workhereService.selectTopPower());
		
		return "index";
	}
	
	@RequestMapping(value = "powerLinkListView.do")
	public ModelAndView powerLinkListView(ModelAndView mv) throws IOException {
		mv.addObject("userCnt", memberService.selectUserAll());
		mv.addObject("compCnt", memberService.selectCompanyAll());
		mv.addObject("powerComp", memberService.selectPowerLinkComp());
		mv.addObject("comTypeList",memberService.selectCompanyList());
		mv.addObject("powerList",powerlinkService.selectPowerLinkAll());
		/*
		System.out.println("userCnt : " + memberService.selectUserAll());
		System.out.println("compCnt : " + memberService.selectCompanyAll());
		System.out.println("powerComp : " + memberService.selectPowerLinkComp());
		System.out.println("comTypeList : " + memberService.selectCompanyList());
		System.out.println("powerList : " + powerlinkService.selectPowerLinkAll());
		*/
		mv.setViewName("mypage/powerLinkList");
		
		return mv;
	}
	
	@RequestMapping(value = "dashBoard.do")
	public String dashBoard(HttpServletRequest request) throws IOException {
		//총수익
		request.setAttribute("tot_profit", dashboardService.totProfit());
		//월별 수익
		request.setAttribute("mon_profitArr", dashboardService.selectMonTot());
		//지역별 구인 정보 개수(top5)
		request.setAttribute("area_top5", dashboardService.areaTop5());
		//월별 구인 정보 등록 횟수(top5)
		request.setAttribute("mon_top5", dashboardService.monTop5());
		return "mypage/dashBoard";
	}
	
	@RequestMapping(value = "contact.do")
	public String contactGo() {
		
		return "contact";
	}
	
	@RequestMapping(value = "404-page.do")
	public String pageNotFound(HttpServletRequest request, Model model) throws IOException {
		request.setCharacterEncoding("UTF-8");
		model.addAttribute("msg", request.getParameter("message"));
		
		return "404-page";
	}
	
}
