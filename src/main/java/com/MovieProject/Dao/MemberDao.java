package com.MovieProject.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.MovieProject.Dto.Member;

public interface MemberDao {

	Member selectMemberInfo(Member mem);

	int insertMember(Member member);

	String selectMid(String mid);

	ArrayList<HashMap<String, String>> getReserveList(@Param("mid")String mid);
}
