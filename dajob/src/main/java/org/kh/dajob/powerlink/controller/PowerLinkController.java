package org.kh.dajob.powerlink.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.dajob.member.controller.MemberController;
import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.powerlink.model.service.PowerLinkService;
import org.kh.dajob.powerlink.model.vo.PowerLink;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PowerLinkController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private PowerLinkService powerlinkService;
	
	@RequestMapping(value="powerlink.do", method=RequestMethod.GET)
	public String powerlinkInfo(HttpSession session, HttpServletRequest request){
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMember_id();
		PowerLink pl = powerlinkService.selectId(memberId);
		ArrayList<PowerLink> list = powerlinkService.selectPercentage();
		ArrayList<PowerLink> list2 = powerlinkService.selectMyPw(memberId);
		if(pl != null){
			request.setAttribute("powerlink", pl);
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
		}else{
			
		}
		return "powerlink/powerlinkInfo";
	}
	
	@RequestMapping(value="powerLink_offer.do", method=RequestMethod.GET)
	public String powerlinkOffer(HttpSession session, HttpServletRequest request){
		return "powerlink/powerlink_offer";
	}
	
	@RequestMapping(value="powerlink_payment.do", method=RequestMethod.POST)
	public void powerlinkPayment(HttpServletResponse response, HttpServletRequest request) throws Exception{
		PrintWriter chk = response.getWriter();
		String member_id = request.getParameter("member_id");
		int result = powerlinkService.updateCnt(member_id);
		if(result > 0){
			chk.append("success");
			chk.flush();
		}else{
			chk.append("fail");
			chk.flush();
		}
		chk.close();
	}

}
