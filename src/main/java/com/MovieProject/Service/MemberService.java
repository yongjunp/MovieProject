package com.MovieProject.Service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.MovieProject.Dao.MemberDao;
import com.MovieProject.Dto.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;
	public Member getLoginMemberInfo_kakao(String id) {
		System.out.println("MemberService - getLoginMemberInfo_kakao()");
		Member mem = new Member();
		mem.setMid(id);
		return mdao.selectMemberInfo(mem);
	}
	public Member getLoginMemberInfo(Member mem) {
		System.out.println("MemberService - getLoginMemberInfo");
		System.out.println(mem);
		return mdao.selectMemberInfo(mem);
	}
	public int registMember_kakao(Member member) {
		System.out.println("MemberService - registMember_kakao()호출");
		return mdao.insertMember(member);
	}
	public Member setMprofile(Member mem, String emailDomain, String emailId, HttpSession session) {
		System.out.println("MemberService - registMember()호출");
		//이메일 형식으로 바꿔주기
		String memail = emailId + "@" + emailDomain;
		mem.setMemail(memail);
		
		MultipartFile mprofiledata = mem.getMprofiledata();
		String mprofile = "";
		String savePath="";
		//첨부파일이 있을 경우 파일 이름과 경로를 설정 
		UUID uuid = UUID.randomUUID();
		savePath = session.getServletContext().getRealPath("/resources/memberProfile");
		System.out.println(savePath);
		
		if(!mprofiledata.isEmpty()) {
			System.out.println("첨부파일 O");
			mprofile = uuid+"_"+mprofiledata.getOriginalFilename();
			File newFile = new File(savePath, mprofile);//File("경로", "파일이름")
			try {
				mprofiledata.transferTo(newFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		mem.setMprofiledata(mprofiledata);
		mem.setMprofile(mprofile);
		return mem;
	}
	public int registMember(Member mem) {
		mem.setMstate("YC");
		return mdao.insertMember(mem);
	}
	public String checkId(String mid) {
		System.out.println("MemberService - checkId()");
		return mdao.selectMid(mid);
	}
	

}
