package com.bitcamp.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {

	private MemberDTO dto;

	public CustomUserDetails(MemberDTO dto) {
		this.dto = dto;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		System.out.println("★CustomUserDetails★");
		List<AuthorityDTO> list = dto.getAuthList();
		ArrayList<SimpleGrantedAuthority> auth = new ArrayList<>();
		
		for (int i = 0; i < list.size(); i++) {
			auth.add(new SimpleGrantedAuthority(list.get(i).getAuth()));
		} // end for
		
		System.out.println(auth);
		
		return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return dto.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return dto.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}

} // method CustomUserDetails class
