package com.student.mybatis.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.student.mybatis.mapper.StudentMapper;
import com.student.mybatis.vo.SeatVO;
import com.student.mybatis.vo.StudentVO;

@Controller
public class StudentController {
	
	@Autowired
	StudentMapper mapper;

	@PostMapping("/studentCheck.do")
	public  @ResponseBody String studentCheck(@RequestParam("num") String num, @RequestParam("name")String name, Model model, HttpServletRequest request) throws IOException {
		StudentVO vo= new StudentVO();
		int number=Integer.parseInt(num);
		String reg="";
		System.out.println(num+name);
		vo=mapper.studentCheck(number, name);
		if(vo != null) {
		  if(vo.getStudent_id() == null) {
			  reg="인증 되었습니다.";
			  HttpSession session = request.getSession();
				session.setAttribute("number",number);
				session.setAttribute("name",name);
		  }else
		  reg="이미 가입된 아이디가 존재합니다.";
		  return reg;
		
		}else {
			reg="인증 실패 되었습니다.";
		}

		return reg;
	}
	
	@PostMapping("/reg.do")
	public String reg(StudentVO vo, Model model) {
		 int result=mapper.update(vo);
		 String alert="가입되었습니다";
		 String alert2="가입 실패입니다";
		 String view;
		 if(result==1) {
			 model.addAttribute("alert",alert);
			 view="/main";
		 }else {
			 model.addAttribute("alert2",alert2);
			 view="/regForm";
		 }
		return view;
	}
	@PostMapping("login.do")
	public String loginCheck(@Param("student_id") String student_id,@Param("student_pw") String student_pw, HttpSession session) {
		String view;
		int result=0;
		result=mapper.loginCheck(student_id, student_pw);
		 if(result==1) {
			 view="/main";
			 session.setAttribute("id", student_id);
		 }else {
			 session.setAttribute("msg", "없는 정보입니다");
			 view="/loginForm";
		 }
		return view;
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "/main";
	}
	
	@GetMapping("/idCheck.do")
		public @ResponseBody String idCheck(@RequestParam("student_id") String student_id) {
			int result=0;
			String check="";
			result = mapper.idCheck(student_id);
			if(result==1) {
				check="1";
			}else {
				check="0";
			}
			return check;
			
		}
	
	public int userdelete(@Param("id") String id) {
		return mapper.studentdelete(id);
	}
	
	@PostMapping("changePw.do")
	public @ResponseBody  String pwchange(StudentVO vo, String student_cpw) {
		int result=mapper.pwchange(vo, student_cpw);
		String msg = "";
 		if (result == 1) {
 			msg = "변경완료";
 		} else {
 			msg = "틀린 비밀번호입니다";
 		}
 		return msg;
	}
	
	
	@PostMapping("/telchange.do")
	public @ResponseBody String telchange(StudentVO vo) {
 		String msg="";
 		int result = mapper.telchange(vo);
 		if (result == 1) {
 			msg = "변경완료";
 		} else {
 			msg = "변경 실패";
 		}
 		
 		return msg;
	}
	
	@GetMapping("/oneStudent.do")
	public String oneStudent(String id,Model model) {
		StudentVO vo= new StudentVO();
		SeatVO svo= new SeatVO();
		vo=mapper.oneStudent(id);
		svo=mapper.seatCheck(id);
		System.out.println(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("svo",svo);
		return "/myPage";
	}
	
	@GetMapping("/delete.do")
	public @ResponseBody String cencel(String id) {
		String msg="";
		int result=mapper.cencel(id);
		if(result==1) {
			msg="취소되었습니다";
		}else {
			msg="다시 시도해주세요";
		}
		return msg;
	}
}
