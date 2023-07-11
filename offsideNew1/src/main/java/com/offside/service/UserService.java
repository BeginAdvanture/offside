package com.offside.service;

import com.offside.dto.Join;
import com.offside.dto.User;

public interface UserService {
	void join(Join join);
 
	int overlapCheck(String value, String valueType);
	
	void login(User user);
}