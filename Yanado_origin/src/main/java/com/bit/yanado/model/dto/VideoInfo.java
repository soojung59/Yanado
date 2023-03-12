package com.bit.yanado.model.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class VideoInfo {

	
	private String uniqueNo;
	private  String title;
	private  String link;
	private  String titleSeq;
	private  String season;
	private  String episode;
	private  Date uploadDate;
	private  String people;
	private  String synop;
	private  String subEng;
	private  String subKor;
	private  String subMix;
	


	
}
