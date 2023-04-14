package com.student.mybatis.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.student.mybatis.mapper.SeatMapper;
import com.student.mybatis.vo.SeatVO;

@Controller
public class SeatController {

	@Autowired
	SeatMapper mapper;
	
	@GetMapping("/seatInsert.do")
	public  String seatInsert(SeatVO vo,String id,Model model) {
		System.out.println(vo);
	
		int result=	mapper.insert(vo);
		System.out.println(result);
		String msg="";
		
		if(result==1) {
			msg="예약 되었습니다";
			model.addAttribute("msg",msg);
		}else {
		}
	return "/seatForm";
	}
	
	@GetMapping("/seatList.do")
	public @ResponseBody ArrayList<SeatVO> seatList(Model model) {
		ArrayList<SeatVO> list = new ArrayList<SeatVO>();
		list = mapper.seatList();
		return list;
	}
	
}
