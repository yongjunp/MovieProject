package com.MovieProject.Dao;

import java.util.ArrayList;

import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Schedule;
import com.MovieProject.Dto.Theaters;

public interface AdminDao {

	String selectMaxMvCode();

	int insertMovie(Movie movieInfo);

	String selectMaxThcode();

	int insertThValue(Theaters theaters);

	int insertSchedule(Schedule sc);

	ArrayList<Movie> selectMapperTest(String thcode);
}
