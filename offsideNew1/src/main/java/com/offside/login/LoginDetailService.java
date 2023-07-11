package com.offside.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.offside.dto.User;


@Service
public class LoginDetailService implements UserDetailsService {
	//사용자 정보 조회 기능
	@Autowired
	private SqlSession sql;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = sql.selectOne("user.login", username);

		if (user != null) {
			LoginService loginDetail = new LoginService();

			loginDetail.setUser(user);

			return loginDetail;
		} else {
			throw new UsernameNotFoundException("유저없음");
		}
	}

}
