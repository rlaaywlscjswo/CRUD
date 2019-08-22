package com.bitcamp.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bitcamp.dto.CustomUserDetails;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.mapper.MemberMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		MemberDTO dto = mapper.getUserById(email);
		
		if (dto == null) {
			throw new UsernameNotFoundException(email);
		} // end if
		
		return new CustomUserDetails(dto);
		
	} // end loadUserByUsername method

} // end CustomUserDetailsService class
