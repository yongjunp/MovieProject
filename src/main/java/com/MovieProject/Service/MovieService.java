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
		return mvList;
	}

	public Movie getMovie(String mvcode) {
		System.out.println("getMovie()호출");
		return mvdao.selectMovie(mvcode);
	}

}