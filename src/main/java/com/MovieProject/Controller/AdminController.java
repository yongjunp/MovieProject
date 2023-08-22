package com.MovieProject.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject.Service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adsvc;
	private ModelAndView mav;
	
	@RequestMapping(value="/getCgvMovieInfo")
	public ModelAndView getCgvMovieInfo() throws IOException {
		System.out.println("영화정보 수집 요청 - /getCgvMovieInfo");
		mav = new ModelAndView();
		//추가된 영화 개수
		int addCount = adsvc.addCgvMovie();
		System.out.println("추가 : " + addCount);
		return null;
	}

}
