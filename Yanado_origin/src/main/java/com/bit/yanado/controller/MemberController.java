package com.bit.yanado.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.bit.yanado.model.dto.BookMark;
import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.MemInfo;
import com.bit.yanado.model.dto.PageDTO;
import com.bit.yanado.model.dto.QNA;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.WatchingReco;
import com.bit.yanado.service.MemInfoService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	MemInfoService memInfoServcie;

	/* 북마크 조회 */
	@RequestMapping(value = "/bookmark", method = RequestMethod.GET)
	public String bookmark(Model model,HttpSession session, BookMark book) {
		MemInfo member = (MemInfo) session.getAttribute("member");
		model.addAttribute("bookmark", memInfoServcie.selectBookMark(member.getId()));
		return "member/bookmark";
	}

	/* mypage 첫 화면, 시청기록 화면 */
	@RequestMapping(value = "/mypage")
	public String mypage(Model model, HttpSession session, VideoInfo video, WatchingReco rec, RedirectAttributes redirectAttributes) {
		MemInfo member = (MemInfo) session.getAttribute("member");
		model.addAttribute("rec", memInfoServcie.selectwatchReco(member.getId()));
		session.setAttribute("record", memInfoServcie.selectwatchReco(member.getId()));
		return "/member/mypage";
	}

	/* Q&A 게시판 조회 */
	@RequestMapping("/qna/board")
	public String board(Criteria cri, Model model) {
		model.addAttribute("qnaList", memInfoServcie.listQna(cri));
		int total = memInfoServcie.countQna(cri);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "member/qna/board";
	}

	/* Q&A 글작성 jsp 이동 */
	@RequestMapping("/qna/write")
	public String write() {
		return "/member/qna/write";
	}
	
	/* Q&A 글 작성 */
	@RequestMapping("/qna/write.do")
	public String write(@ModelAttribute("QNA")QNA qna ) {
		memInfoServcie.writeQna(qna);
		return "redirect:/member/qna/board";
	}
	
	/* Q&A 내글보기 */
	@RequestMapping("/qna/myqna")
	public String myqna(HttpSession session, Model model ) {
		MemInfo member = (MemInfo) session.getAttribute("member");
		session.setAttribute("myQna", memInfoServcie.myQna(member.getId()));
		return "/member/qna/myqna";
	}
	
	/* 개인정보 jsp 이동 */
	@RequestMapping("/modify")
	public String modify() {
		return "member/modify";
	}
	
	/* 개인정보 수정*/
	@RequestMapping("/modify.do")
	public String modify(@ModelAttribute("member")MemInfo member) {
		memInfoServcie.modifyMem(member);
		System.out.println(member);
		return "forward:/";
	}
	
	/* 회원탈퇴 jsp 이동*/
	@RequestMapping("/leaving")
	public String leaving() {
		return "/member/leaving";
	}
	
	/* 회원탈퇴 */
	@RequestMapping("/leaving.do")
	public String leavingAction(@ModelAttribute("member")MemInfo member,HttpSession session) {
		memInfoServcie.leavingMem(member);
		session.invalidate();
		return "redirect:/";
	}
}
