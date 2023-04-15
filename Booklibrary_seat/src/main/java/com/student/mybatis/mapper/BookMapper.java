package com.student.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.student.mybatis.vo.BookVO;


@Mapper
public interface BookMapper {

	public int Bookinsert(BookVO vo);

	public int update(BookVO vo);

	public int loginCheck(@Param("id") String id, @Param("pw") String pw);

	public int idCheck(@Param("id") String id);
}
