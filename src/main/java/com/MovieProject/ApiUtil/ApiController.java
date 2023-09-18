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
		System.out.println("pg_token : "+pg_token);
		String tid = (String)session.getAttribute("tid");
		System.out.println("tid : "+tid);
		return null;
	}
}
