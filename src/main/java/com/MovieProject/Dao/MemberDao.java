package com.MovieProject.Dao;

import org.apache.ibatis.annotations.Param;

import com.MovieProject.Dto.Member;

public interface MemberDao {

	Member selectMemberInfo(@Param("id")String id);

	int insertMember(Member member);
}
