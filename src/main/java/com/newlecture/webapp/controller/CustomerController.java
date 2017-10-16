package com.newlecture.webapp.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.NoticeView;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	private NoticeDao noticeDao;


	@RequestMapping("notice")
	public String notice(
			@RequestParam(value="p", defaultValue="1")  Integer page,
			@RequestParam(value="f", defaultValue="title")  String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		/*List<NoticeView> list = noticeDao.getList(page, field, query);		
		model.addAttribute("list", list);*/
		
		
		model.addAttribute("list", noticeDao.getList(page, field, query));
		
		//String output = String.format("p:%s, q:%s", page, query);
		//output += String.format("title : %s\n", list.get(0).getTitle());
		
		//return "customer/notice";
		return "customer.notice.list";
	}
	

	@RequestMapping("notice/{id}")	
	public String noticeDetail(
				@PathVariable("id") String id,
				Model model) {
		
	/*	select * from NoticeView where id < 250 order by regDate desc limit 1;

		select * from NoticeView where id > 250 order by regDate asc limit 1;*/
	
		
		model.addAttribute("n", noticeDao.get(id));
		model.addAttribute("prev", noticeDao.getPrev(id));
		model.addAttribute("next", noticeDao.getNext(id));
		
		return "customer.notice.detail";
	}
	@RequestMapping("notice-ajax")
	@ResponseBody
	public String noticeAjax(
			@RequestParam(value="p", defaultValue="1")  Integer page,
			@RequestParam(value="f", defaultValue="title")  String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		List<NoticeView> list = noticeDao.getList(page, field, query);		
		
		
		
		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		StringBuilder builder = new StringBuilder();

		return json;
	}
}