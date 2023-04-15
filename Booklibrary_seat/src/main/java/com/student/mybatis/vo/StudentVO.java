package com.student.mybatis.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class StudentVO {
	private String student_id;
	private String student_pw;
	private String student_name;
	private String student_tel;
	private String number;
	
}
