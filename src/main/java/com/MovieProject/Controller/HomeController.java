package com.MovieProject.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject.Dto.Member;
import com.MovieProject.Dto.Movie;
import com.MovieProject.Service.MemberService;
import com.MovieProject.Service.MovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MovieService mvsvc;
	@Autowired
	private MemberService msvc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		System.out.println("메인 페이지 이동요청");
		ModelAndView mav = new ModelAndView();
		//1. 영화 랭킹 목록 조회
		// select * from movies order by mvopen desc
		ArrayList<Movie> rankMovList = mvsvc.selectMvList();
		mav.addObject("mvList",rankMovList);
		//2. 이동할 페이지 설정
		mav.setViewName("index");
		return mav;
	}
	
}
