package com.MovieProject.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Reserve;
import com.MovieProject.Service.MemberService;
import com.MovieProject.Service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService mvsvc;
	
	@RequestMapping(value="/movieList")
	public ModelAndView movieList() {
		System.out.println("movieList - 영화 목록페이지");
		ModelAndView mav = new ModelAndView();
		//mapper에서 thcode에 1값을 넣어주기위해서 "1"을 넣어줌
		ArrayList<Movie> movieList = mvsvc.getMovieList("1");
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
	

	@RequestMapping(value="/getMvList")
	public @ResponseBody String getMvList(String thcode){
		System.out.println("예매 가능 영화리스트");
		System.out.println(thcode);
		String mvList = mvsvc.getMvList(thcode);
		return mvList;
	}
	
	@RequestMapping(value="/getThList")
	public @ResponseBody String getThList( String mvcode){
		System.out.println("예매 가능 영화리스트");
		String thList = mvsvc.getThList(mvcode);
		return thList;
	}
	@RequestMapping(value="/getScList")
	public @ResponseBody String getScList(String mvcode, String thcode, String scdate) {
		System.out.println("스케쥴 날짜 목록 요청");
		System.out.println("mvcode : "+ mvcode);
		System.out.println("thcode : "+ thcode);
		System.out.println("scdate : "+scdate);
		String scList = mvsvc.getScList(mvcode, thcode, scdate);
		System.out.println(scList);
		return scList;
	}
	@RequestMapping(value = "/registReserveInfo")
	public @ResponseBody boolean registReserveInfo(Reserve rs) {
		System.out.println("예매하기");
		boolean result = mvsvc.insertReserve(rs);
		return result;
	}

}
