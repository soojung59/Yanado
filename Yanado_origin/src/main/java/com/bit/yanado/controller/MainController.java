package com.bit.yanado.controller;

import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SessionAttributeMethodArgumentResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.yanado.model.dto.BookMark;
import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.MemInfo;
import com.bit.yanado.model.dto.PageDTO;
import com.bit.yanado.model.dto.Poster;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.WatchingReco;
import com.bit.yanado.service.MemInfoService;
import com.bit.yanado.service.VideoService;

@Log4j
@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	VideoService videoService;

	@Autowired
	MemInfoService memInfoServcie;

	@Autowired
	JavaMailSender mailSender;

	@RequestMapping("/")
	public String main(Poster poster, Model model, HttpServletRequest request,HttpSession session )  {
		model.addAttribute("poster", videoService.posterList(poster));
		return "main";
	}

	@RequestMapping("/afterLogin")
	public String loginMain(Poster poster, Model model, HttpSession session){
		model.addAttribute("poster", videoService.posterList(poster));
		
		return "main";
	}

	
	@RequestMapping(value = "login", method = { RequestMethod.POST, RequestMethod.GET })
	public String login(HttpServletRequest request, MemInfo mem, WatchingReco record, RedirectAttributes rttr,
			VideoInfo video, Model model)  {
		HttpSession session = request.getSession();
		MemInfo mem2 = memInfoServcie.loginMem(mem);
		if (mem2 == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "/login";
		}
		session.setAttribute("member", mem2);
		memInfoServcie.loginData(mem2.getId());
//		model.addAttribute("list", videoService.selectVideo(video));
		return"redirect:/afterLogin";
	}

	@RequestMapping(value = "/video/search", method = RequestMethod.GET)
	public String search(Model model,@RequestParam(value = "navKeyword") String navKeyword) {
		String keyword = navKeyword;
		model.addAttribute("navKeyword", keyword);
		model.addAttribute("search", videoService.searchList(keyword));
		return "/video/search";
	}
	
	/* 회원가입 jsp 이동 */
	@RequestMapping("join")
	public String joinForm() {
		return "join";
	}

	/* 회원가입 action */
	@RequestMapping("join.do")
	public String join(@ModelAttribute("MemInfo") MemInfo mem) {
		memInfoServcie.insertMem(mem);
		return "redirect:/login";
	}

	/* 아이디 중복확인 */
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memIdCheck(String id) {
		int resutl = memInfoServcie.idCheck(id);
		if (resutl != 0) {
			return "fail";
		} else {
			return "success";
		}

	}
	
	/* 회원가입 메일 확인 */
	@RequestMapping(value = "mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email)  {

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		String setFrom = "sujeongchoe85@gmail.com";
		String toMail = email;
		String title = "yanado email";
		String content = "welcom yanado homepage" + "<br><br>" + "number :" + checkNum + "<br>";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			System.out.println("8");

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		return num;
	}

	/* 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	/* 영상 시청 */
	@RequestMapping(value = "/video/play", method = { RequestMethod.POST, RequestMethod.GET })
	public String play(Model model,@RequestParam(value = "uniqueNo") int uniqueNo, BookMark book, HttpServletRequest request, VideoInfo video, WatchingReco watchi)
			 {
		model.addAttribute("video", videoService.selectVideo(video));
		return "/video/play";
	}

	/* 마지막 시점부터 영상 시청 */
	@RequestMapping(value = "/video/playReco", method = RequestMethod.GET)
	public String playReco(Model model, VideoInfo video, BookMark book, HttpSession session,
			@RequestParam(value = "uniqueNo") int uniqueNo,
			@RequestParam(value = "recentPo", defaultValue = "0") String recentPo)  {
		MemInfo member = (MemInfo) session.getAttribute("member");
		model.addAttribute("video", videoService.selectVideo(video));
		model.addAttribute("recentPo", recentPo);
		model.addAttribute("book", memInfoServcie.getBookmark(member.getId()));
	
		return "/video/play";
	}

	@RequestMapping(value = "/video/playBookmark", method = RequestMethod.GET)
	public String playBookmark(Model model, VideoInfo video, BookMark book, HttpServletRequest request,
			@RequestParam(value = "uniqueNo") int uniqueNo,
			@RequestParam(value = "recentPo", defaultValue = "0") String recentPo)  {
		model.addAttribute("video", videoService.selectVideo(video));
		model.addAttribute("recentPo", recentPo);
		return "/video/play";
	}

	/* 시청기록 저장 */
	@RequestMapping(value = "/video/play/record.do", method = RequestMethod.GET)
	@ResponseBody
	public void videoRecord(WatchingReco rec, Model model, @RequestParam Map<String, Object> record) {
		int checkReco = memInfoServcie.checkRecord(record);
		if (checkReco == 1) {
			memInfoServcie.updateRecord(rec);
			System.out.println("시청기록저장");
		} else {
			memInfoServcie.videoRecord(rec);
			System.out.println("새로운 시청기록 저장");
		}

	}

	/* 북마크 저장 */
	@RequestMapping("/video/bookmark.do")
	@ResponseBody
	public void bookmark(HttpServletRequest request, BookMark book, @RequestParam Map<String, Object> bookmark) {
		int check = memInfoServcie.checkBookMark(bookmark);
		if (check == 1) {
			memInfoServcie.delBookMark(bookmark);
		} else {
			memInfoServcie.bookmark(bookmark);
		}

	}

}