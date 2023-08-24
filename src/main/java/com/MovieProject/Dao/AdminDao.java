package com.MovieProject.Dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Theaters;

public interface AdminDao {

	@Select("SELECT NVL(MAX(MVCODE),'MV00000') FROM MOVIES") 
	String selectMaxMvCode();

	int insertMovie(Movie movieInfo);

	@Select("SELECT NVL(MAX(THCODE),'TH00000') FROM THEATERS")
	String selectMaxThcode();

	@Insert("INSERT INTO THEATERS(THCODE, THNAME, THADDR, THTEL, THINFO, THIMG) VALUES(#{thcode},#{thname},#{thaddr},#{thtel},#{thinfo},#{thimg})")
	int insertThValue(Theaters theaters);
}
