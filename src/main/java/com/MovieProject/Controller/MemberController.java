package com.MovieProject.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MovieProject.Dto.Member;
import com.MovieProject.Service.MemberService;
import com.google.gson.Gson;

@Controller
public class MemberController {

	@Autowired MemberService msvc;
	
	@RequestMapping("/memberLogout")
	public ModelAndView memberLogout(HttpSession session) {
		System.out.println("로그아웃 요청");
		session.removeAttribute("loginId");
		session.removeAttribute("loginName");
		session.removeAttribute("loginProfile");
		session.removeAttribute("loginState");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping("/memberJoin_kakao")
	public @ResponseBody boolean memberJoin_kakao(Member member) {
		System.out.println("카카오 계정 - 회원가입 요청 - /memberJoin_kakao");
		member.setMstate("YK");
		System.out.println(member);
		int result = msvc.registMember_kakao(member);
		if(result > 0) {
			return true;			
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="/memberLogin_kakao")
	public @ResponseBody boolean memberLogin_kakao(String id, String profile, HttpSession session) {
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
			session.setAttribute("loginProfile", profile);
			session.setAttribute("loginState", loginMember.getMstate());
			return true;
		}
	}
	
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(String userId, String userPw, HttpSession session, RedirectAttributes ra){
		System.out.println("로그인 요청");
		ModelAndView mav = new ModelAndView();
		Member mem = new Member();
		mem.setMid(userId);
		mem.setMpw(userPw);
		Member loginMember = msvc.getLoginMemberInfo(mem);
		if(loginMember == null) {
			ra.addFlashAttribute("msg", "로그인에 실패하였습니다.");
			mav.setViewName("redirect:/memberLoginForm");
		}else {
//			String mstate = loginMember.getMstate().substring(0,1);
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginName", loginMember.getMname());
			session.setAttribute("loginProfile", loginMember.getMprofile());
			session.setAttribute("loginState", loginMember.getMstate());
			ra.addFlashAttribute("msg","로그인 되었습니다.");
			mav.setViewName("redirect:/");
		}
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
	@RequestMapping(value = "/reserveList")
	public ModelAndView reserveList(HttpSession session, RedirectAttributes ra) {
		System.out.println("예매 내역 조회");
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("loginId");
		if(mid == null) {
			ra.addFlashAttribute("msg","로그인 후 이용해 주세요");
			mav.setViewName("redirect:/");
			return mav;
		}
		//예매 목록 조회 (영화 제목, 극장, 상영관, 상영시간)
		ArrayList<HashMap<String, String>> rsvList = msvc.getReserveList(mid);
		System.out.println(rsvList.get(0).get("SCDATE"));
		mav.addObject("rsvList",rsvList);
		mav.setViewName("member/ReserveList");
		return mav;
	}
	@RequestMapping(value="/deleteReserve")
	public ModelAndView deleteReserve(String recode, RedirectAttributes ra) {
		System.out.println("예약 취소 요청");
		System.out.println(recode);
		ModelAndView mav = new ModelAndView();
		int rs = msvc.deleteReserve(recode);
		if(rs > 0) {
			mav.setViewName("redirect:/");
			ra.addFlashAttribute("msg","예약취소에 성공하였습니다.");
		}else {
			mav.setViewName("reserveList");
			mav.addObject("msg","예약취소를 실패하였습니다.");
		}
		return mav;
	}
}
