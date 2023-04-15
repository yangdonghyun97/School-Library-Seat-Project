package com.student.mybatis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {
		
	
	@GetMapping("/")
	public  String root() {
		return "main";
	}
	@GetMapping("/myPage")
	public void myPage() {
		
	}
	@GetMapping("/seatForm")
	public void seatForm() {
		
	}
	
	@GetMapping("/checkForm")
	public void checkForm() {
		
	}
	@GetMapping("/loginForm")
	public void loginForm() {
	}
	@GetMapping("/regForm")
	public void regForm() {
		
	}
	
	@GetMapping("/regBookForm")
	public void regBookForm() {
		
	}
	
	
}
	
