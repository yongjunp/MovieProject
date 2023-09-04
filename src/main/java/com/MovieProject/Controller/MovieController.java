package com.MovieProject.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject.Dto.Movie;
import com.MovieProject.Service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService mvsvc;
	
	@RequestMapping(value="/movieList")
	public ModelAndView movieList() {
		System.out.println("movieList - 영화 목록페이지");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Movie> movieList = mvsvc.getMovieList();
		System.out.println(movieList);
		mav.addObject("mvList",movieList);
		mav.setViewName("movie/MovieList");
		
		return mav;
	}
	
	
	@RequestMapping(value="/detailMovie")
	public ModelAndView detailMovie(String mvcode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("영화 상세페이지 이동 요청");
		Movie detail_mv = mvsvc.getMovie(mvcode);
		mav.addObject("mv", detail_mv);
		mav.setViewName("movie/DetailMovie");
		return mav;
	}
}