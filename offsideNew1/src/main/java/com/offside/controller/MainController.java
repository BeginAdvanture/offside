package com.offside.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offside.dto.User;
import com.offside.service.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService userservice;

	@ResponseBody
	@PostMapping("/addressModify")
	public void addressModify(String address1, String address2, HttpServletResponse response, HttpSession session)
			throws UnsupportedEncodingException {
//		address1 = 우편번호
//		address2 = 주소

		System.out.println("address1 =" + address1);
		System.out.println("address2 =" + address2);

		String address = "{\"address1\" : \"" + address1 + "\",\"address2\" : \"" + address2 + "\"}";

		// 쿠키에 JSON으로 저장
		Cookie cookie = new Cookie("Offaddress", URLEncoder.encode(address, "UTF-8"));

		int age = 60 * 60 * 24 * 7; // 일주일
		cookie.setMaxAge(age);

		response.addCookie(cookie);

		// 세션에 map으로 저장
		Map<String, String> addMap = new HashMap<>();
		addMap.put("address1", address1);
		addMap.put("address2", address2);
		session.setMaxInactiveInterval(3600 * 3); // 3시간
		session.setAttribute("Offaddress", addMap);
	}

	@GetMapping("/home")
	public String homeGET(HttpServletRequest request,Model model, User user) throws Exception{
		/*
		 * User loggedInUser = userservice.login(user); if (loggedInUser != null) {
		 * model.addAttribute("member", loggedInUser); }
		 */
		HttpSession session = request.getSession();
		 String URL = "https://sports.news.naver.com/wfootball/index";
	        ArrayList<String> al1 = new ArrayList<>();
	        ArrayList<String> al2 = new ArrayList<>();
	        ArrayList<String> al3 = new ArrayList<>();

	        ArrayList<String> al5 = new ArrayList<>();
	        ArrayList<String> al6 = new ArrayList<>();
	        ArrayList<String> al7 = new ArrayList<>();
	        ArrayList<String> al8 = new ArrayList<>();

	        Document doc = Jsoup.connect(URL).get();
	        Elements elem = doc.select("ul.home_news_list a span");
	        Elements elem2 = doc.select("ul.home_news_list div a span");
	        Elements url1 = doc.select("#_team_rank_epl table tbody tr th span em span");
	        Elements url2 = doc.select("#_team_rank_epl table tbody tr td span");
	        Elements url3 = doc.select("#_team_rank_epl table tbody tr td div div.info span");
	        Elements url4 = doc.select("#_team_rank_epl table tbody tr td div div.image.emblem img");
	        // 기사 링크

	        Elements elem3 = doc.select("ul.home_news_list a");

	        for (int i = 0; i < elem.size(); i++) {
	            Element pn = elem.get(i);
	            System.out.println(pn.text());
	            al1.add(pn.text());
	        }
	        for (int i = 0; i < elem2.size(); i++) {
	            Element pn = elem2.get(i);
	            System.out.println(pn.text());
	            al2.add(pn.text());
	        }

	        for (int i = 0; i < elem3.size(); i++) {
	            String url = elem3.get(i).attr("abs:href");
	            System.out.println(url);
	            al3.add(url);
	        }

	        for (int i = 0; i < url1.size(); i++) {
	            Element pu = url1.get(i);
	            System.out.println(pu.text());
	            al5.add(pu.text());
	        }

	        // 승점

	        for (int i = 0; i < url2.size(); i++) {
	            Element p1 = url2.get(i);
	            System.out.println(p1.text());
	            al6.add(p1.text());
	        }

	        // 팀명

	        for (int i = 0; i < url3.size(); i++) {
	            Element p2 = url3.get(i);
	            System.out.println(p2.text());
	            al7.add(p2.text());
	        }

	        // 팀 이미지

	        for (int i = 0; i < url4.size(); i++) {
	            Element img = url4.get(i);
	            String src = img.attr("src");
	            System.out.println(src);
	            al8.add(src);
	        }
	        model.addAttribute("gisa1", al1);
	        model.addAttribute("gisa2", al2);
	        model.addAttribute("link", al3);

	        model.addAttribute("rank", al5);
	        model.addAttribute("teamname", al6);
	        model.addAttribute("image", al7);

	        return "/home";
	}

}
