package com.MovieProject.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MovieProject.Dao.MovieDao;
import com.MovieProject.Dto.Movie;

@Service
public class MovieService {

	@Autowired 
	private MovieDao mvdao;
	
	public ArrayList<Movie> selectMvList() {
		System.out.println("selectMvList()호출");
		ArrayList<Movie> mvList = mvdao.selectMvList();
		for(Movie mv : mvList) {
			String mvgrade = mv.getMvinfo().split(",")[0];
			if(mvgrade.equals("전체관람가")) {
				mvgrade = "All";
			}else if(mvgrade.equals("12세이상관람가")) {
				mvgrade = "12";
			}else if(mvgrade.equals("15세이상관람가")) {
				mvgrade = "15";
			}else {
				mvgrade = "19";
			}
			mv.setMvstate(mvgrade);
		}
		return mvList;
	}

	public Movie getMovie(String mvcode) {
		System.out.println("getMovie()호출");
		return mvdao.selectMovie(mvcode);
	}
	
	public ArrayList<Movie> getMovieList() {
		System.out.println("getMovieList - 영화 전체목록 조회");
		
		ArrayList<Movie> movieList = mvdao.selectMovieList();
//		System.out.println("movieList : " + movieList);
		for(Movie mv : movieList) {
			String mvGrade = mv.getMvinfo().split(",")[0];
//			mvGrade=mvGrade.subString(0,2);
			
			if(mvGrade.equals("전체관람가")) {
				mvGrade = "All";
			} else if(mvGrade.equals("청소년관람불가")) {
				mvGrade="19";
			} else if(mvGrade.equals("15세이상관람가")) {
				mvGrade="15";
			} else {
				mvGrade="12";
			}
			
			
			mv.setMvstate(mvGrade);
		}
		
		return movieList;
	}

}