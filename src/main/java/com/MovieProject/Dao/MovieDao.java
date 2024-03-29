package com.MovieProject.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Reserve;
import com.MovieProject.Dto.Schedule;
import com.MovieProject.Dto.Theaters;

public interface MovieDao {

	ArrayList<Movie> selectMvList();

	Movie selectMovie(String mvcode);
	
	ArrayList<Movie> selectMovieList(String thcode);

	ArrayList<Theaters> selectTheaterList(@Param("mvcode")String mvcode);

	ArrayList<Schedule> selectScList(@Param("mvcode")String mvcode, @Param("thcode")String thcode, @Param("scdate")String scdate);

	String selectMaxRecode();

	int insertReserve(Reserve rs);

	int deleteReserve(String recode);

}
