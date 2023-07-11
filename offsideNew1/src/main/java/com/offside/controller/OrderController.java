package com.offside.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.offside.dto.OrderDTO;
import com.offside.dto.OrderPageDTO;
import com.offside.dto.User;
import com.offside.login.LoginService;
import com.offside.service.OrderService;
import com.offside.service.UserService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	@GetMapping("/order/{matchId}")
	public String orderPageGET(@PathVariable("matchId") String matchId, @AuthenticationPrincipal LoginService user,
			OrderPageDTO opd, Model model) {

		System.out.println("matchId: " + matchId);
		System.out.println("orders: " + opd.getOrders());
		
		long userId = user.getUser().getId();
		System.out.println(userId);
		model.addAttribute("orderList", orderService.getMatchInfo(opd.getOrders()));
		model.addAttribute("memberInfo", orderService.getMemberInfo(userId));

		return "/order";
	}


	@PostMapping("/order")
	public String orderPagePOST(OrderDTO od, HttpServletRequest request) {
		 
		System.out.println(od);
		orderService.order(od);
		System.out.println(od.getId() + " " + od.getOrderState() + " " + od.getUsePoint());

		HttpSession session = request.getSession();
		
	
		return "redirect:/home";
	}
}