package com.student.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.student.mybatis.mapper.BookMapper;
import com.student.mybatis.vo.BookVO;

@Controller
public class BookController {

	@Autowired
	BookMapper mapper;
	
	
	@GetMapping("/regBook.do")
	public @ResponseBody String regBook(BookVO vo) {
		String msg=null;
		int result=mapper.Bookinsert(vo);
		if(result == 1) {
			msg="등록 되었습니다.";
		}else {
			msg="등록 불가 도서입니다.";
		}
		
		return msg;
	}
}
