package com.MovieProject.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject.Dto.Member;
import com.MovieProject.Service.MemberService;

@Controller
public class MemberController {

	@Autowired MemberService msvc;
	
	@RequestMapping("/memberLogout")
	public ModelAndView memberLogout(HttpSession session) {
		System.out.println("로그아웃 요청");
		session.removeAttribute("loginId");
		session.removeAttribute("loginName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping("/memberJoin_kakao")
	public @ResponseBody boolean memberJoin_kakao(Member member) {
		System.out.println("카카오 계정 - 회원가입 요청 - /memberJoin_kakao");
		member.setMstate("YK");
		int result = msvc.registMember_kakao(member);
		if(result > 0) {
			return true;			
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="/memberLogin_kakao")
	public @ResponseBody boolean memberLogin_kakao(String id, HttpSession session) {
		System.out.println("카카오 로그인 요청");
		System.out.println("카카오 id : "+id);
		
		Member loginMember = msvc.getLoginMemberInfo_kakao(id);
		if(loginMember == null) {
			System.out.println("카카오 계정 정보 없음");
			return false;
		}else {
			System.out.println("카카오 계정 정보 있음");
			System.out.println("로그인 처리");
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginName", loginMember.getMname());
			return true;
		}
	}
	
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(String userId, String userPw){
		System.out.println("로그인 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping(value="/memberLoginForm")
	public ModelAndView memberLoginForm() {
		System.out.println("로그인 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberLogin");
		return mav;
	}
	
	@RequestMapping(value="/memberJoinForm")
	public ModelAndView memberJoinForm() {
		System.out.println("회원가입 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberJoin");
		return mav;
		
	}
	
	@RequestMapping(value="/memberJoin")
	public ModelAndView memberJoin(Member mem, String EmailDomain, String EmailId,HttpSession session) {
		System.out.println("회원가입 요청");
		ModelAndView mav = new ModelAndView();
		mem = msvc.setMprofile(mem, EmailDomain, EmailId, session);
		System.out.println(mem);
		int result = msvc.registMember(mem);
		if(result >0) {
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("redirect:/memberJoin");
		}
		return mav;
	}
	@RequestMapping(value="/checkId")
	public @ResponseBody String checkId(String mid) {
		System.out.println("아이디 중복확인 요청");
		String rs = msvc.checkId(mid);
		return rs;
	}
}
