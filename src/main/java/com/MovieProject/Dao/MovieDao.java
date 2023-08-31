package com.MovieProject.Dao;

import java.util.ArrayList;

import com.MovieProject.Dto.Movie;

public interface MovieDao {

	ArrayList<Movie> selectMvList();

	Movie selectMovie(String mvcode);
	
	ArrayList<Movie> selectMovieList();

}
