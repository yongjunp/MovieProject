package com.MovieProject.Dao;

import java.util.ArrayList;

import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Theaters;

public interface MovieDao {

	ArrayList<Movie> selectMvList();

	Movie selectMovie(String mvcode);
	
	ArrayList<Movie> selectMovieList();

	ArrayList<Theaters> selectTheaterList();

}
