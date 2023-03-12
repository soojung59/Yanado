package com.bit.yanado.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class QNA {

	private int qnaSeq;
	private String title;
	private Date writeDate;
	private String cont;
	private String reply;
	private String isReply;
	private Date replyDate;
	private String replyAdmin;
	private String id; 
	
	
}
