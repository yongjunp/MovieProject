package com.MovieProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		System.out.println("메인 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		//1. 영화 랭킹 목록 조회
		//ArrayList<Movie> rankMovList = .....
		//mav.addObject("",rankMovList);
		//2. 이동할 페이지 설정
		mav.setViewName("index");
		return mav;
	}
	
}
