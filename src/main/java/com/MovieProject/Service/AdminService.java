package com.MovieProject.Service;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MovieProject.Dao.AdminDao;
import com.MovieProject.Dto.Movie;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	public int addCgvMovie() throws IOException {
		System.out.println("AdminService - addCgvMovies 호출");
		//cgv 영화 정보 수집
		// Jsoup 사용 
		// 무비차트 접속 >> 영화 상세 페이지 URL
		// 영화 상세 페이지 접속 >> 영화 상세 정보 수집
		Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/?lt=1&ft=0").get();
		Elements urlItems = doc.select("div.sect-movie-chart div.box-image>a");
		ArrayList<Movie> mvList = new ArrayList<Movie>();
		for(Element url : urlItems) {
			String detailUrl = "https://www.cgv.co.kr/" + url.attr("href");
			
			Movie mv = new Movie();
			Document mvdoc = Jsoup.connect(detailUrl).get();
			Elements mvitem = mvdoc.select("div.sect-base-movie");
			String mvposter = mvitem.select("div.box-image>a").attr("href");
			mv.setMvposter(mvposter);
			
			Elements mvitem_box = mvitem.select("div.box-contents");
			String mvtitle = mvitem_box.select("div.title>strong").text();
			mv.setMvtitle(mvtitle);
			
			String mvdirector = mvitem_box.select("div.spec > dl > dd:nth-child(2)").text();
			mv.setMvdirector(mvdirector);
			
			String mvactors = mvitem_box.select("div.spec>dl>dd.on").get(0).text();
			mv.setMvactors(mvactors);
			
			String mvgerne = mvitem_box.select("div.spec>dl>dd.on").get(0).nextElementSibling().text();
			mv.setMvgenre(mvgerne);
			
			String mvinfo = mvitem_box.select("div.spec>dl>dd.on").get(1).text();
			mv.setMvinfo(mvinfo);
			
			String mvopen = mvitem_box.select("div.spec>dl>dd.on").get(2).text();
			mvopen = mvopen.substring(0,10);
			mv.setMvopen(mvopen);
			mvList.add(mv);
		}
		
		// mvList >> 영화정보 19개 수집
		
		// DB - MOVIES 테이블 INSERT
		// MOVIES 테이블 MVCODE 최대값 조회
		
		String maxMvcode = adminDao.selectMaxMvCode();
		System.out.println("maxMvcode : " + maxMvcode);
		
		for(Movie mov : mvList) {
			//1. 영화코드 생성
			
			//2. MOVIE 테이블 INSERT
		}
		return mvList.size();
	}

}
