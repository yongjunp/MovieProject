package com.MovieProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

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
		mav.setViewName("member/MemberRegist");
		return mav;
		
	}
}
