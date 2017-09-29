package org.kh.dajob.itinfo.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.kh.dajob.itinfo.model.service.ItinfoService;
import org.kh.dajob.itinfo.model.vo.Itinfo;
import org.kh.dajob.member.controller.MemberController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItinfoController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private String fileName = null;
	
	@Autowired
	private ItinfoService itinfoService;

	@RequestMapping(value = "itinfo.do")
	public String ininfoGo(Model mv, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		int currentPage = 1;
		// 한 페이지당 출력할 목록 갯수
		int limit = 5;
		int listCount = itinfoService.getListCount();
		int maxPage = (int) ((double) listCount / limit + 0.8);
		// 전달된 페이지값 추출
		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		mv.addAttribute("list", itinfoService.selectList(currentPage, limit));
		mv.addAttribute("currentPage", currentPage);
		mv.addAttribute("maxPage", maxPage);
		mv.addAttribute("listCount", listCount);

		return "itinfo/itinfoList";
	}

	@RequestMapping(value = "itinfoDetail.do")
	public String ininfoDetailView(@RequestParam("itinfo_no") String itinfo_no, Model mv, HttpServletRequest request)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		int currentPage = 1;
		// 한 페이지당 출력할 목록 갯수

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		mv.addAttribute("itinfo", itinfoService.selectOne(itinfo_no));
		mv.addAttribute("currentPage", currentPage);

		return "itinfo/itinfoDetailView";
	}
	
	@RequestMapping(value = "itinsertView.do")
	public String itinfoInsertView() {
		return "itinfo/itinfoInsertView";
	}
	
	@RequestMapping(value = "itinsert.do")
	public ModelAndView itinfoInsert(ModelAndView mv, Itinfo itinfo) throws IOException {
		String fileImg = itinfo.getItinfo_img();
		String tmp = "itinfoImage/"+fileImg.substring(fileImg.lastIndexOf('\\')+1);
		itinfo.setItinfo_img(tmp);
		
		int result = itinfoService.insertItinfo(itinfo);
		if(result > 0) {
			mv.setViewName("redirect:itinfo.do");
		} else {
			mv.addObject("msg", "공지사항 등록 실패!");
			mv.setViewName("404-page");
		}
		return mv;
	}
	
	@RequestMapping(value = "itupdateView.do")
	public String itupdateView(@RequestParam("itinfo_no") String itinfo_no, Model mv, HttpServletRequest request)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		int currentPage = 1;
		// 한 페이지당 출력할 목록 갯수

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		mv.addAttribute("itinfo", itinfoService.selectOne(itinfo_no));
		mv.addAttribute("currentPage", currentPage);

		return "itinfo/itinfoupdateView";
	}
	
	@RequestMapping(value = "itupdate.do")
	public ModelAndView itupdate(@RequestParam("itinfo_img_rep") String rep_file, Itinfo itinfo, ModelAndView mv)
			throws IOException {
		if(rep_file != null && !rep_file.isEmpty() && !rep_file.equals("")) {
			String tmp = "itinfoImage/"+rep_file.substring(rep_file.lastIndexOf('\\')+1);
			itinfo.setItinfo_img(tmp);
		}
		int result = itinfoService.updateItinfo(itinfo);
		if(result > 0) {
			mv.setViewName("redirect:itinfoDetail.do?itinfo_no="+itinfo.getItinfo_no());
		} else {
			mv.addObject("msg", "IT 정보 수정 실패!!");
			mv.setViewName("404-page");
		}
		
		return mv;
	}

	@RequestMapping(value = "itdelete.do")
	public ModelAndView itdelete(@RequestParam("itinfo_no") String itinfo_no, ModelAndView mv, HttpServletRequest request)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		int currentPage = 1;
		// 한 페이지당 출력할 목록 갯수

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		int result = itinfoService.deleteItinfo(itinfo_no);
		
		if(result > 0) {
			mv.setViewName("redirect:itinfo.do?page="+currentPage);
		} else {
			mv.addObject("msg", "IT정보 게시글 삭제 실패!!");
			mv.setViewName("404-page");
		}
		
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "itinfofileUpload.do") //ajax에서 호출하는 부분
	   @ResponseBody // 결과를 응답 페이지에 담아 보냄
	   public String upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws UnsupportedEncodingException { //Multipart로 받는다.
		   //String member_id = multipartRequest.getParameter("member_id");
		   multipartRequest.setCharacterEncoding("UTF-8");
		   response.setContentType("application/json");
		   
		   String fileFullPath = "";
		      
	       Iterator<String> itr =  multipartRequest.getFileNames();
	       String root = multipartRequest.getSession().getServletContext().getRealPath("resources");
	       String savePath = root + "\\images\\itinfoImage"; //설정파일로 뺀다.
	       logger.info("root : "+root);
	       logger.info("savePath : "+savePath);
	       while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
	            
	           /* 기존 주석처리
	           MultipartFile mpf = multipartRequest.getFile(itr.next());
	           String originFileName = mpf.getfileName();
	           System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
	           */
	    	    
	           MultipartFile mpf = multipartRequest.getFile(itr.next());
	           
	           fileName = mpf.getOriginalFilename(); //파일명
	           
	           File folder = new File(savePath);
	           File replaceFile = new File(savePath+"\\"+fileName);
	           
	           logger.info("folder : "+folder);
	           logger.info("replaceFile : "+replaceFile);
	           
	           if(!folder.exists()) {
	        	   logger.info("folder Create : "+folder);
	        	   folder.mkdir();
	           }
	           if(replaceFile.exists()) {
	        	   File tmp = new File(savePath+"\\"+('R'+fileName));
	        	   logger.info("File rename Start : "+tmp);
	        	   logger.info("File rename result : " +replaceFile.renameTo(tmp));
	        	   replaceFile = tmp;
	           }
	             // 폴더가 없다면 생성하세요~
	           
	           //logger.info("need Folder : "+folder+"\\"+member_id);
	           
	           fileFullPath = replaceFile.getPath(); //파일 전체 경로
           		try {
               //파일 저장
        	   		mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
        	   		logger.info("fileName => "+fileName);
        	   		logger.info("fileFullPath => "+fileFullPath);
               } catch (Exception e) {
            	   logger.info("postTempFile_ERROR======>"+fileFullPath);
            	   e.printStackTrace();
               }
           }
	       
	       JSONObject jsonObj = new JSONObject();
	       jsonObj.put("path",URLEncoder.encode(fileFullPath , "UTF-8"));
	       
	   return jsonObj.toString();
       //return fileFullPath;
       }
}
