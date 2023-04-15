package com.student.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.student.mybatis.vo.SeatVO;
import com.student.mybatis.vo.StudentVO;


@Mapper
public interface StudentMapper {

	public void insert(StudentVO vo);
	
	public StudentVO studentCheck(@Param("number")int number,@Param("name") String name);
	
	public int update(StudentVO vo);
	
	public int loginCheck(@Param("student_id")String student_id,@Param("student_pw")String student_pw);
	
	public int idCheck(@Param("student_id") String student_id);
	
	
	
	//한 학생 정보
	public StudentVO oneStudent(String id);
	//도서관 자리 취소
	public int cencel(String id);
	//도서관 자리 확인
	public SeatVO seatCheck(String id);
	//비밀번호변경
	public int pwchange(@Param("vo") StudentVO vo, @Param("student_cpw") String student_cpw);
	//주소변경
	public int addresschange(@Param("vo") StudentVO vo, @Param("id") String id);
	//전화번호변경	
	public int telchange(StudentVO vo);
	//탈퇴
	public int studentdelete(@Param("id") String id);
}
