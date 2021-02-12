package com.spring.cjs200809.vo;

import lombok.Data;

@Data
public class BoardVo {
	private int idx;
	private String mid;
	private String name;
	private String title;
	private String wdate;
	private int viewCnt;
	private String content;
}
