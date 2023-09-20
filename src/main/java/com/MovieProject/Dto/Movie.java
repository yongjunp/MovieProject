package com.MovieProject.Dto;

import lombok.Data;

@Data
public class Movie {
	private String mvcode;		//코드
	private String mvtitle;		//제목
	private String mvdirector;	//감독
	private String mvactors;	//배우
	private String mvgenre;		//장르
	private String mvinfo;		//정보
	private String mvopen;		//개봉
	private String mvposter;	//포스터
	private String mvstate;		//상태		

	private String recount;
}
