package com.offside.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offside.dto.MatchVO;
import com.offside.dto.StoreDetail;
import com.offside.login.LoginService;
import com.offside.service.OrderService;
import com.offside.service.StoreService;

@Controller
public class StoreController {
	@Autowired
	private StoreService storeSerivce;
	@Autowired OrderService orderService;
	
	@GetMapping("/store/{category}/{address1}")
	public String store(@PathVariable int category, @PathVariable int address1,Model model) {
		List<MatchVO> storeList = storeSerivce.storeList(category, address1 / 100);
		
		/*
		 * model.addAttribute("memberList",orderService.getMemberInfo(username));
		 * System.out.println(username);
		 */
		 
		model.addAttribute("storeList", storeList);
		return "store/store";
	}
	
	
	@GetMapping("/store/detail/{matchId}")
	public String storeDetail(@PathVariable long matchId, Model model,@AuthenticationPrincipal LoginService user) {
		
		StoreDetail storeDetail = storeSerivce.storeDetail(matchId);
		long userId = user.getUser().getId();
		System.out.println(userId);
		
		model.addAttribute("memberInfo", orderService.getMemberInfo(userId));
		model.addAttribute("store", storeDetail);
		
		return "store/detail";
	}
	@ResponseBody
	@PostMapping("/store/likes")
	public long likes(long id, String likes, int matchId,@AuthenticationPrincipal LoginService user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		System.out.println(id + "" + likes);
		long userId = 0;
		if(user == null) {
			
		}
		else {
			System.out.println("찜");
			
			userId = user.getUser().getId();
			System.out.println(userId+"sdfsdfsdfs");
			System.out.println(id+"sdfsdfsdfs");
			System.out.println(matchId + "sdfadasd");
			storeSerivce.likes(id,likes,matchId);
		}
		return userId;
	}
}
