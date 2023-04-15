package com.student.mybatis.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.student.mybatis.vo.SeatVO;



@Mapper
public interface SeatMapper {

	public int insert(SeatVO vo);
	
	public ArrayList<SeatVO> seatList();
}
