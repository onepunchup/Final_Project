package org.kh.dajob;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.kh.dajob.itinfo.model.service.ItinfoService;
import org.kh.dajob.itinfo.model.vo.Itinfo;
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
	private ItinfoService itinfoService;
	
	@Autowired
	private WorkhereService workhereService;
	
	@Autowired
	private WorkJobAndSkillService workJobnSkillService;
	
	
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
	public String powerLinkListView(ModelAndView mv) throws IOException {
		
		return "mypage/powerLinkList";
	}
	
	@RequestMapping(value = "dashBoard.do")
	public String dashBoard(ModelAndView mv) throws IOException {
		
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
