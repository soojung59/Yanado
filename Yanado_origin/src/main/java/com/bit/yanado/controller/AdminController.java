package com.bit.yanado.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.print.attribute.standard.PrinterInfo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFileChooser;

import org.apache.commons.compress.compressors.FileNameUtil;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.yanado.model.dto.Criteria;
import com.bit.yanado.model.dto.MemInfo;
import com.bit.yanado.model.dto.PageDTO;
import com.bit.yanado.model.dto.Paging;
import com.bit.yanado.model.dto.Poster;
import com.bit.yanado.model.dto.QNA;
import com.bit.yanado.model.dto.Tag;
import com.bit.yanado.model.dto.TagName;
import com.bit.yanado.model.dto.Teaser;
import com.bit.yanado.model.dto.VideoInfo;
import com.bit.yanado.model.dto.VideoTitle;
import com.bit.yanado.service.AwsS3;
import com.bit.yanado.service.MemInfoService;
import com.bit.yanado.service.VideoService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("admin/*")
public class AdminController {

	@Autowired
	VideoService videoService;

	@Autowired
	MemInfoService memInfoService;
	
	@Autowired
	AwsS3 awsS3;

	/* video list */
	@RequestMapping(value = "/video/list", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) {
		model.addAttribute("list", videoService.getListWithPaging(cri));
		int total = videoService.countVideo(cri);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);

		return "/admin/video/board";
	}

	/* member list */
	@RequestMapping("member")
	public String boardList2(@ModelAttribute("MemInfo") MemInfo mem, Model model) {
		List<MemInfo> list = memInfoService.listMem(mem);
		model.addAttribute("list", list);
		return "admin/member";
	}

	/* go to video write form */
	@GetMapping("/video/write")
	public String writeVideo(Model model) {
		model.addAttribute("title", videoService.getTitle());
		model.addAttribute("tag", videoService.getTag());
		model.addAttribute("maxUnique", videoService.maxUniqueNo());
		return "/admin/video/write";
	}

	/* video write action */
	@RequestMapping(value = "videoUpload", method = RequestMethod.GET)
	public String videoUpload(VideoInfo videoinfo, Poster poster, Teaser teaser, TagName tagname, Tag tag,VideoTitle title) {
		String S3URL = "amazons3adress/";
		String madeUnique = videoinfo.getTitleSeq() + videoinfo.getSeason() + videoinfo.getEpisode();
		String madeUniSeason = videoinfo.getTitleSeq()+videoinfo.getSeason();
		videoinfo.setUniqueNo(madeUnique);

		/* upload S3 video & set the videoLink to s3URL */
		File videoFile = new File(videoinfo.getLink());
		String videoKey = "video/" + madeUnique;
		awsS3.upload(videoFile, videoKey);
		videoinfo.setLink(S3URL + videoKey);

		/* upload S3 subTitle & set the subTitle to s3URL */
		File submixFile = new File(videoinfo.getSubMix());
		String submixKey = "submix/" + madeUnique;
		awsS3.upload(submixFile, submixKey);
		videoinfo.setSubMix(S3URL + submixKey);

		File subengFile = new File(videoinfo.getSubEng());
		String subengKey = "subeng/" + madeUnique;
		awsS3.upload(subengFile, subengKey);
		videoinfo.setSubEng(S3URL + subengKey);

		File subkorFile = new File(videoinfo.getSubKor());
		String subkorKey = "subkor/" + madeUnique;
		awsS3.upload(subkorFile, subkorKey);
		videoinfo.setSubKor(S3URL + subkorKey);

		videoService.insertVideo(videoinfo);

		/* upload S3 poster & set the poster to s3URL */
		if (Integer.parseInt(videoinfo.getEpisode()) == 01) {
			File posterFile = new File(poster.getPoster());
			String posterKey = "poster/" + madeUnique;
			awsS3.upload(posterFile, posterKey);
			poster.setTitleSeq(madeUniSeason);
			poster.setPoster(S3URL + posterKey);

			/* upload S3 teaser & set the teaser to s3URL */
			File teaserFile = new File(teaser.getTeaserLink());
			String teaserKey = "teaser/" + madeUnique;
			awsS3.upload(teaserFile, teaserKey);
			teaser.setTeaserLink(S3URL + teaserKey);
			teaser.setTitleSeq(madeUniSeason);
			videoService.insertPoster(poster);
			videoService.insertTeaser(teaser);
			
			title.setTitleSeq(madeUniSeason);
			videoService.insertTitle(title);
		}

		/* update tagName */
		String tagName = tagname.getTagName();
		String[] tagNamearray = tagName.split(",");
		for (int i = 0; i < tagNamearray.length; i++) {
			videoService.updateTagNameCount(tagNamearray[i]);
		}
		/* insert tagNameSeq */
		String TagNameSeq = tag.getTagNameSeq();
		String[] TagNameSeqArray = TagNameSeq.split(",");
		int[] test = new int[TagNameSeqArray.length];
		for (int j = 0; j < TagNameSeqArray.length; j++) {
			tag.setTagNameSeq(TagNameSeqArray[j]);
			tag.setUniqueNo(madeUnique);
			videoService.insertTag(tag);
		}

		return "redirect:/admin/video/list";
	}

	/* read video & poster & teaser information */
	@RequestMapping("/video/read")
	public void viewForm(VideoInfo videoinfo, Poster poster, Teaser teaser, Model model) {
		model.addAttribute("result", videoService.selectVideo(videoinfo));
		String str = videoinfo.getUniqueNo();
		int result = Integer.parseInt(str.substring(str.length() - 2, str.length()));
		int titleSeq = Integer.parseInt(str.substring(0, 5));
		int titleSeqSeason = Integer.parseInt(str.substring(0, 7));
		if (result == 01) {
			model.addAttribute("teaser", videoService.selectTeaser(titleSeq));
			model.addAttribute("poster", videoService.selectPoster(titleSeqSeason));
		}
	}

	/* go to video modify form */
	@GetMapping("/video/modify")
	public void modifyForm(VideoInfo videoinfo, Poster poster, Teaser teaser, Model model) {

		model.addAttribute("result", videoService.selectVideo(videoinfo));
		String str = videoinfo.getUniqueNo();
		int titleSeq = Integer.parseInt(str.substring(0, 7));
		int result = Integer.parseInt(str.substring(str.length() - 2, str.length()));

		if (result == 01) {
			model.addAttribute("teaser", videoService.selectTeaser(titleSeq));
			model.addAttribute("poster", videoService.selectPoster(titleSeq));
		}

	}

	/* update DB & S3 of video, poster and teaser */
	@RequestMapping("/video/modify.do")
	public String update(VideoInfo videoinfo, Model model, Poster poster, Teaser teaser) {
		String str = videoinfo.getUniqueNo();
		int titleSeq = Integer.parseInt(str.substring(0, 7));
		int result = Integer.parseInt(str.substring(str.length() - 2, str.length()));

		File videoFile = new File(videoinfo.getLink());
		String videoKey = "video/" + videoinfo.getUniqueNo();
		awsS3.upload(videoFile, videoKey);

		File submixFile = new File(videoinfo.getSubMix());
		String submixKey = "submix/" + videoinfo.getUniqueNo();
		awsS3.upload(submixFile, submixKey);

		File subengFile = new File(videoinfo.getSubEng());
		String subengKey = "subeng/" + videoinfo.getUniqueNo();
		awsS3.upload(subengFile, subengKey);

		File subkorFile = new File(videoinfo.getSubKor());
		String subkorKey = "subkor/" + videoinfo.getUniqueNo();
		awsS3.upload(subkorFile, subkorKey);

		if (result == 01) {
			File posterFile = new File(poster.getPoster());
			String posterKey = "poster/" + videoinfo.getUniqueNo();
			awsS3.upload(posterFile, posterKey);

			/* upload S3 teaser & set the teaser to s3URL */
			File teaserFile = new File(teaser.getTeaserLink());
			String teaserKey = "teaser/" + videoinfo.getUniqueNo();
			awsS3.upload(teaserFile, teaserKey);

			videoService.updatePoster(titleSeq);
			videoService.updateTeaser(titleSeq);
		}
		videoService.updateVideo(videoinfo);
		return "redirect:/admin/video/list";
	}

	/* delete DB & S3 of video, poster and teaser */
	@RequestMapping("/video/delete.do")
	public String selectDelete(VideoInfo videoinfo, RedirectAttributes rttr) {
		System.out.println("test");
		String str = videoinfo.getUniqueNo();
		String[] uniqueArray = str.split(",");
		for (int i = 0; i < uniqueArray.length; i++) {
			videoService.deleteVideo(uniqueArray[i]);

			/* make a titleSeq for poster and teaser */
			int titleSeq = Integer.parseInt(uniqueArray[i].substring(0, 7));
			int result = Integer.parseInt(uniqueArray[i].substring(uniqueArray[i].length() - 2, uniqueArray[i].length()));


			String videoKey = "video/" + uniqueArray[i];
			awsS3.delete(videoKey);

			String submixKey = "submix/" + uniqueArray[i];
			awsS3.delete(submixKey);

			String subengKey = "subeng/" + uniqueArray[i];
			awsS3.delete(subengKey);

			String subkorKey = "subkor/" + uniqueArray[i];
			awsS3.delete(subkorKey);

			/* if episode number 01 delte poster and teaser */
			if (result == 01) {
				String teaserKey = "teaser/" + uniqueArray[i];
				awsS3.delete(teaserKey);

				String posterKey = "poster/" + uniqueArray[i];
				awsS3.delete(posterKey);

				videoService.deletePoster(titleSeq);
				videoService.deleteTeaser(titleSeq);

			}
		}
		return "redirect:/admin/video/list";
	}

	@RequestMapping("/video/stat")
	public String stat(Model model) {
		model.addAttribute("todayLogin", videoService.todayLogin());
		model.addAttribute("countMem", videoService.countMem());
		model.addAttribute("countVideo", videoService.countVd());
		model.addAttribute("watchiedVideo", videoService.watchiedVideo());
		return "/admin/video/stat";
	}

	@RequestMapping("/video/teaser")
	public String teaser(Model model) {
		model.addAttribute("teaser", videoService.teaserList());
		return "/admin/video/teaser";
	}

	/* admin qna board */
	@RequestMapping("/qna")
	public String qna(Criteria cri, Model model) {
		model.addAttribute("qnaList", memInfoService.listQna(cri));
		int total = memInfoService.countQna(cri);
		PageDTO pageMake = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "/admin/qna";
	}

	@RequestMapping("/qna.do")
	public String qna(QNA qna) {
		memInfoService.replyQna(qna);
		System.out.println(qna);
		return "redirect:/admin/qna";
	}

}