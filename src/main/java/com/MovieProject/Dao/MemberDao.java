package com.MovieProject.Dao;

import com.MovieProject.Dto.Member;

public interface MemberDao {

	Member selectMemberInfo(Member mem);

	int insertMember(Member member);

	String selectMid(String mid);
}
