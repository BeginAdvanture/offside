package com.offside.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offside.dto.Join;
import com.offside.login.LoginFail;
import com.offside.login.LoginSuccess;
import com.offside.service.UserService;

@Controller
public class UserController {
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	@Autowired
	private UserService userService;
	@Autowired
	private LoginFail loginFail;
	 
	@Autowired
	private LoginSuccess loginSuccess;
	
	
	@GetMapping("/join")
	public String join() {
		return "user/join";
	}

	@PostMapping("/join")
	public String joinProc(Join join, BindingResult bindingResult, Model model) {
		// 비밀번호 암호화
	    String encPwd = pwdEncoder.encode(join.getPassword());
	    join.setPassword(encPwd);
	    
		System.out.println(join);
		if (bindingResult.hasErrors()) {
			List<FieldError> list = bindingResult.getFieldErrors();
			Map<String, String> errorMsg = new HashMap<>();
			for (int i = 0; i < list.size(); i++) {
				String field = list.get(i).getField();
				String message = list.get(i).getDefaultMessage();

				errorMsg.put(field, message);
			}
			model.addAttribute("errorMsg",errorMsg);
			return "user/join";
		}
		userService.join(join);
		return "redirect:/login";
	}
	
	@ResponseBody
	@GetMapping("/overlapCheck")
	public int overlapCheck(String value, String valueType) {
//		value = 중복체크할 값
//		valeuType = username, nickname
		System.out.println(value);
		System.out.println(valueType);
		int count = userService.overlapCheck(value, valueType);
		
		System.out.println(count);
		return count;
	}
	
	@GetMapping("/myPage")
	public String myPage() {
		return "user/myPage";
	}

	@GetMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		String referer = (String) request.getHeader("referer");
		
		session.setAttribute("referer", referer);
		return "user/login";
	}

}
