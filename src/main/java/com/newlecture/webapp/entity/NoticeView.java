package com.newlecture.webapp.entity;

import java.util.Date;

import com.newlecture.webapp.entity.Notice;

public class NoticeView extends Notice{
	private String writerName;
	private int countCmt;
	
	public NoticeView() {
		// TODO Auto-generated constructor stub
	}

	public NoticeView(String id, String title, String content, String writerId, Date regDate, int hit) {
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public int getCountCmt() {
		return countCmt;
	}

	public void setCountCmt(int countCmt) {
		this.countCmt = countCmt;
	}
	
	
	
	
}
