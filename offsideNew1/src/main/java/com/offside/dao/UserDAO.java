package com.offside.dao;

import com.offside.dto.Join;
import com.offside.dto.User;

public interface UserDAO {
	void join(Join join);
	int overlapCheck(String value, String valueType);
	void login(User user);
}
