package com.MovieProject.ApiUtil;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject.Dto.Reserve;

@Controller
public class ApiController {
	
	@Autowired
	ApiService apisvc;
	
	@RequestMapping(value="/kakaoPay_ready")
	public @ResponseBody String kakaoPay_ready(Reserve reInfo, HttpSession session) {
		System.out.println("카카오 결제 준비 요청 - /kakaoPay_ready()");
		String rs = apisvc.kakaoPay_ready(reInfo, session);
		System.out.println(reInfo);
		return rs;
	}
	
	@RequestMapping(value="/kakaoPay_approval")
	public ModelAndView kakaoPay_approval(String pg_token, HttpSession session) {
		System.out.println("카카오 결제 승인 요청");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("pg_token : "+pg_token);
		String tid = (String)session.getAttribute("tid");
		System.out.println("tid : "+tid);
		String recode = (String)session.getAttribute("recode");
		String mid = (String)session.getAttribute("loginId");
		String rs = apisvc.kakaoPay_approval(pg_token, tid,recode, mid);
		if(!rs.equals(null)) {
			System.out.println("결제 승인");
			mav.addObject("payResult","Y");
		} else {
			System.out.println("결제 오류");
			mav.addObject("payResult","N");
		}
		session.removeAttribute("tid");
		session.removeAttribute("recode");
		mav.setViewName("PayResult");
		return mav;
	}
	@RequestMapping(value="kakaoPay_cancel")
	public ModelAndView kakaoPay_cancel() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("payResult","N");
		mav.setViewName("PayResult");
		return mav;
	}
}
