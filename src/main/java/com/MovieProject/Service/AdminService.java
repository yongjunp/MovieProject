package com.MovieProject.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MovieProject.Dao.AdminDao;
import com.MovieProject.Dto.Movie;
import com.MovieProject.Dto.Theaters;

@Service
public class AdminService {

	@Autowired
	private AdminDao addao;

	/* addCgvMovie() 시작점 */
	public int addCgvMovie() throws IOException {
		System.out.println("AdminService - addCgvMovies 호출");
		// cgv 영화 정보 수집
		// jsoup 사용
		// 무비차트 페이지 접속 >> 영화 상세 페이지 URL(19개) 수집
		String ChartUrl = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		Document MovieChartDoc = Jsoup.connect(ChartUrl).get();
//		System.out.println(MovieChartDoc);
		Elements urlsItems = MovieChartDoc.select("div.sect-movie-chart>ol>li>div.box-image>a");
//		System.out.println(urlsItems);
		// 영화 상세 페이지 접속 >> 영화 상세 정보 수집

		ArrayList<Movie> movieList = new ArrayList<Movie>();

		for (Element urlItem : urlsItems) {
			String detailUrl = "http://www.cgv.co.kr/" + urlItem.attr("href");
//			System.out.println(detailUrl);
			Document detailDoc = Jsoup.connect(detailUrl).get();

			Movie movieInfo = new Movie();
			String Mvtitle = detailDoc
					.select("#select_main > div.sect-base-movie > div.box-contents > div.title > strong").text();
			System.out.println("영화제목 : " + Mvtitle);
			movieInfo.setMvtitle(Mvtitle);

			String Mvdirector = detailDoc
					.select("#select_main > div.sect-base-movie > div.box-contents > div.spec > dl > dd:nth-child(2)")
					.text();
			System.out.println("감독 : " + Mvdirector);
			Mvdirector = Mvdirector.replace(" , ", ",");
			movieInfo.setMvdirector(Mvdirector);

			String MvActors = detailDoc
					.select("#select_main > div.sect-base-movie > div.box-contents > div.spec > dl > dd.on").get(0)
					.text();
			MvActors = MvActors.replace(" , ", ",").trim(); // " ab c " >> "ab c" 여백을 없애줌
			System.out.println("배우 : " + MvActors);
			movieInfo.setMvactors(MvActors);

			String MvGenre = detailDoc
					.select("#select_main > div.sect-base-movie > div.box-contents > div.spec > dl > dd.on").get(0)
					.nextElementSibling().text();
			MvGenre = MvGenre.replace("장르 : ", "").replace(", ", ",");
			System.out.println("장르 : " + MvGenre); // 다음 요소 찾기
			movieInfo.setMvgenre(MvGenre);

			String MvInfo = detailDoc
					.select("#select_main > div.sect-base-movie > div.box-contents > div.spec > dl > dd.on").get(1)
					.text();
			MvInfo = MvInfo.replace(", ", ",");
			System.out.println("기본정보 : " + MvInfo);
			movieInfo.setMvinfo(MvInfo);

			String MvOpen = detailDoc
					.select("#select_main > div.sect-base-movie > div.box-contents > div.spec > dl > dd.on").get(2)
					.text();
			MvOpen = MvOpen.substring(0, 10);
			System.out.println("개봉일 : " + MvOpen);
			movieInfo.setMvopen(MvOpen);

			String MvPosterUrl = detailDoc.select("#select_main > div.sect-base-movie > div.box-image > a > span > img")
					.attr("src");
			System.out.println("포스터URL : " + MvPosterUrl);
			System.out.println("");
			movieInfo.setMvposter(MvPosterUrl);

			movieList.add(movieInfo);

		}
		// movieList >> 영화정보 19개 수집

		// DB - MOVIES 테이블에 INSERT
		// MOVIES 테이블 MVCODE 최대값 조회

		String maxMvCode = addao.selectMaxMvCode();
		System.out.println("maxMvCode : " + maxMvCode); // MV00000

		int insertCount = 0;
		for (Movie movieInfo : movieList) {
			// 1. 영화코드 생성
			String mvcode = genCode(maxMvCode);
			System.out.println("생성된 mvcode : " + mvcode);
			// 2. MOVIES 테이블 INSERT
			movieInfo.setMvcode(mvcode);
			System.out.println(movieInfo);
			try {
				int insertResult = addao.insertMovie(movieInfo);
				insertCount += insertResult; // insertCount = insertCount + insertResult
				maxMvCode = mvcode;
			} catch (Exception e) {
				continue; // 중복 영화 일 경우 다음 차시 반복으로
			}

		}

		return insertCount;
	}

	/* addCgvMovie() 코드 종료 */

	// 코드 생성 메소드
	private String genCode(String currentCode) {
		System.out.println("genCode() 호출 : " + currentCode);
		// currentCode = MV00000 >> MV00001
		// currentCode = MV00000 :: 앞 2자리 영문, 뒤 5자리 숫자
		// newCode = MV00001
		String strCode = currentCode.substring(0, 2); // "MV"
		int numCode = Integer.parseInt(currentCode.substring(2));
//		System.out.println("strCode : " + strCode);
//		System.out.println("numCode : " + numCode);
		String newCode = strCode + String.format("%05d", numCode + 1); // 5자리 문자로 만들고 비어있는 자리는 0으로 채움.

		return newCode;
	}

	private ArrayList<String> getCgvTheaterUrls() {
		System.out.println("AdminService - getCgvTheaterUrls() 호출");
		ChromeOptions options = new ChromeOptions(); // Selenium을 사용하기 위한 기본적인 크롬을 열어주는 코드
		options.setPageLoadStrategy(PageLoadStrategy.NORMAL);
//		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);
		String cgvtheaterUrl = "http://www.cgv.co.kr/theaters/";
		driver.get(cgvtheaterUrl);
		List<WebElement> theaterElements = driver.findElements(By.cssSelector("div.sect-city>ul>li>div.area>ul>li>a"));
//		System.out.println("theaterUrls.size() : "+theaterElements.size());

		ArrayList<String> thUrls = new ArrayList<String>();
		for (WebElement theaterElement : theaterElements) {
			thUrls.add(theaterElement.getAttribute("href"));
		}

		driver.quit();
		return thUrls;
	}

	public int addCgvTheaters() {
		System.out.println("AdminService - addCgvTheaters() 호출");
		// 극장 페이지 URL 수집 기능 호출
		ArrayList<String> theaterUrls = getCgvTheaterUrls();
		System.out.println(theaterUrls.size());

		ChromeOptions options = new ChromeOptions(); // Selenium을 사용하기 위한 기본적인 크롬을 열어주는 코드
		options.setPageLoadStrategy(PageLoadStrategy.NORMAL);
//		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);
		ArrayList<Theaters> thList = new ArrayList<Theaters>();
		for (String url : theaterUrls) {
			driver.get(url);
			try {
				Theaters theaters = new Theaters();

				WebElement titleElement = driver
						.findElement(By.cssSelector("#contents > div.wrap-theater > div.sect-theater > h4 > span"));
				String thname = titleElement.getText();
				System.out.println("극장 이름 : " + thname);
				theaters.setThname(thname);

				WebElement addrElement = driver.findElement(By.cssSelector(
						"#contents > div.wrap-theater > div.sect-theater > div > div.box-contents > div.theater-info > strong"));
				String thaddr = addrElement.getText();
				thaddr = thaddr.replace("위치/주차 안내 >", "");
				thaddr = thaddr.split("\n")[0]; // 줄바꿈을 기준으로 0번 인덱스에 있는 것을 고른다.
				/*
				 * Console 출력창 예시 주소 : 서울시 중랑구 상봉동 79-9 상봉듀오트리스 B2F 서울시 중랑구 상봉로 131 (상봉동)
				 * 
				 * -- split코드를 추가 한 후의 출력
				 * 
				 * 주소 : 서울시 중랑구 상봉동 79-9 상봉듀오트리스 B2F
				 */
				System.out.println("주소 : " + thaddr);
				theaters.setThaddr(thaddr);

				WebElement telElement = driver.findElement(By.cssSelector(
						"#contents > div.wrap-theater > div.sect-theater > div > div.box-contents > div.theater-info > span.txt-info > em:nth-child(1)"));
				String thtel = telElement.getText();
				System.out.println("전화번호 : " + thtel);
				theaters.setThtel(thtel);

				WebElement infoElement = driver.findElement(By.cssSelector(
						"#contents > div.wrap-theater > div.sect-theater > div > div.box-contents > div.theater-info > span.txt-info > em:nth-child(2)"));
				String thinfo = infoElement.getText();
				System.out.println("정보 : " + thinfo);
				theaters.setThinfo(thinfo);

				WebElement imgElement = driver.findElement(By.cssSelector("#theater_img_container > img"));
				String thimg = imgElement.getAttribute("src");
				System.out.println("이미지 : " + thimg);
				theaters.setThimg(thimg);

				thList.add(theaters); // ArrayList<Theaters>의 thList에 theaters 추가

			} catch (Exception e) {
				continue;
			}

		}
		// 극장 정보 202개 수집
		System.out.println("thList.size() : " + thList.size());
		// DB - THEATERS 테이블 INSERT

		// THEATERS 테이블 THCODE 최대값 조회 >> TH00000
		String selectMaxThcode = addao.selectMaxThcode();

		int insertThCount = 0;
		for (Theaters theaters : thList) {
			String thCode = genCode(selectMaxThcode);

			theaters.setThcode(thCode);
			System.out.println(theaters);
			// Insert

			try {
				int insertThValue = addao.insertThValue(theaters);
				insertThCount += insertThValue;
				selectMaxThcode = thCode;
			} catch (Exception e) {
				continue;
			}
		}

		driver.quit();
		return insertThCount;
	}

	public int addCgvScheduls() {
		System.out.println("AdminService - add CgvScheduls() 호출");
		// 극장 페이지 URL 수집 기능 호출
		ArrayList<String> theaterUrls = getCgvTheaterUrls();

		/* SELENIUM */
		ChromeOptions options = new ChromeOptions(); // Selenium을 사용하기 위한 기본적인 크롬을 열어주는 코드
		options.setPageLoadStrategy(PageLoadStrategy.NORMAL);
//		options.addArguments("headless");
		WebDriver driver = new ChromeDriver(options);

		for (String thurl : theaterUrls) {
			driver.get(thurl);// SELENIUM - Chrome 극장 페이지로 접속
			// SELENIUM - 극장 페이지 내부에 있는 스케쥴 프레임으로 변경
			driver.switchTo().frame(driver.findElement(By.cssSelector("#ifrm_movie_time_table")));
//			#slider > div:nth-child(1) > ul > li
			List<WebElement> dayList = driver.findElements(By.cssSelector("#slider > div:nth-child(1) > ul > li"));
//			for (WebElement day : dayList) {
//					
//				
//				break;
//			}
			
			/* 8월 24일 */
//			body > div > div.sect-showtimes > ul > li
			List<WebElement> showtimes = driver.findElements(By.cssSelector("body > div > div.sect-showtimes > ul > li"));
			System.out.println("showtimes.size() : " + showtimes.size());
			for(WebElement showtime : showtimes) {
				String mvtitle = showtime.findElement(By.cssSelector("div > div.info-movie > a > strong")).getText();
				System.out.println("mvtitle : " + mvtitle);
				List<WebElement> timehalls = showtime.findElements(By.cssSelector("div.col-times>div.type-hall"));
				System.out.println("timehalls : "+ timehalls.size());
			}
			
			break;
		}

		driver.quit();
		return 0;
	}

}
