package com.MovieProject.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Theaters;

public interface MovieDao {

	ArrayList<Movie> selectMvList();

	Movie selectMovie(String mvcode);
	
	ArrayList<Movie> selectMovieList(String thcode);

	ArrayList<Theaters> selectTheaterList(@Param("mvcode")String mvcode);

}
