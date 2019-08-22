package com.bitcamp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CustomUserDetails;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.mapper.MemberMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		System.out.println("★CustomUserDetailsService★");
		MemberDTO dto = mapper.getUserById(email);
		System.out.println(dto);
		
		if (dto == null) {
			throw new UsernameNotFoundException(email);
		} // end if
		
		return new CustomUserDetails(dto);
		
	} // end loadUserByUsername method

} // end CustomUserDetailsService class
