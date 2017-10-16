package com.newlecture.webapp.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.dao.NoticeFileDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeFile;

@Controller
@RequestMapping("/admin/board/*")
public class BoardController {
	
	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private NoticeFileDao noticeFileDao;

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
		return "admin.board.notice.list";
	}
	
	@RequestMapping("notice/{id}")	
	public String noticeDetail(
				@PathVariable("id") String id,
				Model model) {
		
		model.addAttribute("n", noticeDao.get(id));
		model.addAttribute("prev", noticeDao.getPrev(id));
		model.addAttribute("next", noticeDao.getNext(id));
		
		return "admin.board.notice.detail";
	}
	@RequestMapping(value="notice/reg", method=RequestMethod.GET)
	public String noticeReg() {
		

		return "admin.board.notice.reg";
	}
	
	@RequestMapping(value="notice/reg", method=RequestMethod.POST)
	public String noticeReg(Notice notice, String aa, MultipartFile file, HttpServletRequest request) throws IOException {
		
		
		
		// 날짜 얻기1
		//Date curDate = new Date();
		
		// 날짜 얻기2
		Calendar cal = Calendar.getInstance();
		//Date curDate2 = cal.getTime();
		int year = cal.get(Calendar.YEAR);
		
		// 날짜 얻기3
		//SimpleDateFormat fmt = new SimpleDateFormat("hh:mm:ss");
		//SimpleDateFormat fmt = new SimpleDateFormat("yyyy");
		//String year = fmt.format(curDate);
		
		//file.getInputStream();
		
		String nextId = noticeDao.getNextId();
		
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(
				String.format("/resource/customer/notice/%d/%s",year,nextId)
				);
		
		System.out.println(path);
		
		File f =  new File(path);
		
		if(!f.exists()) {
			if(!f.mkdirs()) {
				System.out.println("디렉토리를 생성할 수 없습니다.");
			}
			
		}
		 // File.separator 얘가 구분자를 정해준다 환경에 따라 \ / 가 다를수있기때문에
		path += File.separator+file.getOriginalFilename();
		File f2 = new File(path);
		
		InputStream fis = file.getInputStream();
		OutputStream fos = new FileOutputStream(f2);
				
		byte[] buf = new byte[1024];
		
		int size = 0;
		while((size = fis.read(buf)) > 0)
			fos.write(buf, 0, size);
		
		fos.close();
		fis.close();
		
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		
		/*title = new String(title.getBytes("ISO-8859-1"), "utf-8");*/
		String writerId = "newlec";
		
		System.out.println(notice.getTitle());
		
		notice.setWriterId(writerId);	
		//int row = noticeDao.insert(title, content, writerId);
		int row = noticeDao.insert(notice);
		noticeFileDao.insert(new NoticeFile(null, fileName, nextId));
		
		
		
		return "redirect:../notice";
	}
	
}