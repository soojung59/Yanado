package com.bit.yanado.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemInfo {
	
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	private Date joinDate;
	private int isOut;
	private Date outDate;
	private String isPay;
	private String emailAuthNum;
	private Date lastLoginDate;
	private String defaultCap;
	private int phAuthNum;
	
	
	
}
