package org.kh.dajob.workboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.workboard.model.service.WorkBoardService;
import org.kh.dajob.workboard.model.vo.WorkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WorkBoardController {

	@Autowired
	private WorkBoardService workboardService;
	
	@RequestMapping(value = "likeCompList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String likeCompList(HttpSession session, HttpServletRequest request){
		String returnPage = null;
		Member m = (Member)session.getAttribute("member");
		String memberId = m.getMember_id();
		
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = workboardService.getListCount(memberId);
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (((int)((double)page / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
    
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		ArrayList<WorkBoard> list = workboardService.likeCompList(memberId, page, limit);
		if(list != null){
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("maxPage", maxPage);
			returnPage = "workboard/likeListBoard";
		}
		return returnPage;
	}
	
	@RequestMapping("lsearch.do")
	public String searchTitleList(HttpSession session, HttpServletRequest request){
		String returnPage = null;
		Member m = (Member)session.getAttribute("member");
		
		int page = 1;
		int limit = 10;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		WorkBoard w = new WorkBoard();
		w.setMember_id(m.getMember_id());
		w.setWork_writer(request.getParameter("comp"));
		
		int listCount = workboardService.getListCount(w);
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (((int)((double)page / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
    
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		ArrayList<WorkBoard> list = workboardService.likeCompList(w, page, limit);
		if(list != null){
			request.setAttribute("list", list);
			request.setAttribute("page", page);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("maxPage", maxPage);
			returnPage = "workboard/likeListBoard";
		}
		return returnPage;
	}
	@RequestMapping(value = "deleteLikeOne.do", method = RequestMethod.POST)
	public void deleteOne(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		Member m = (Member)session.getAttribute("member");
		String member_id = m.getMember_id();
		String workNo = request.getParameter("work_no");
		//System.out.println("work_no : " + workNo);
		WorkBoard w = new WorkBoard();
		w.setMember_id(member_id);
		w.setWork_no(workNo);
		PrintWriter chk = response.getWriter();
		int result = workboardService.deleteOne(w);
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