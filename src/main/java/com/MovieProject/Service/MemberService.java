package com.MovieProject.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MovieProject.Dao.MemberDao;
import com.MovieProject.Dto.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;
	public Member getLoginMemberInfo_kakao(String id) {
		System.out.println("service-getLoginMemberInfo_kakao()");
		return mdao.selectMemberInfo(id);
	}
	public int registMember_kakao(Member member) {
		System.out.println("service - registMember_kakao()호출");
		return mdao.insertMember(member);
	}

}
