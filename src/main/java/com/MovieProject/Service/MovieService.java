package com.MovieProject.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MovieProject.Dao.MovieDao;
import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Reserve;
import com.MovieProject.Dto.Theaters;
import com.google.gson.Gson;

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
	
	public ArrayList<Movie> getMovieList(String thcode) {
		System.out.println("getMovieList - 영화 전체목록 조회");
		
		ArrayList<Movie> movieList = mvdao.selectMovieList(thcode);
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

	public String getMvList(String thcode) {
		System.out.println("service - getMvList() 호출");
		ArrayList<Movie> mvList_array = getMovieList(thcode);
		return new Gson().toJson(mvList_array);
	}

	public String getThList(String mvcode) {
		System.out.println("service - getThList() 호출");
		ArrayList<Theaters> thList = mvdao.selectTheaterList(mvcode);
		return new Gson().toJson(thList);
	}

	public String getScList(String mvcode, String thcode, String scdate) {
		System.out.println("service - getScList()호출");
		
		return new Gson().toJson(mvdao.selectScList(mvcode, thcode, scdate));
	}

	public String insertReserve(Reserve rs) {
		System.out.println("servece - inserteReserve()호출");
		String maxRecode = mvdao.selectMaxRecode();
		String recode = "";
		if(maxRecode.equals("RE00000")) {
			recode = "RE00001";
			System.out.println("maxRecode");
		}else {
			String strCode = maxRecode.substring(0, 2);
			int numCode = Integer.parseInt(maxRecode.substring(2));
			recode = strCode + String.format("%05d", numCode + 1); // 5자리 문자로 만들고 비어있는 자리는 0으로 채움.
		}
		rs.setRecode(recode);
		System.out.println(rs);
		int result = mvdao.insertReserve(rs);
		if(result > 0) {
			return recode;
		}else {
			return null;
		}
	}

	public int cancelReserve(String recode) {
		System.out.println("service - cancelReserve()호출");
		return mvdao.deleteReserve(recode);
	}
}