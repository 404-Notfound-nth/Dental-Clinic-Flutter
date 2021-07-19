package com.prm.project.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.prm.project.entity.Account;
import com.prm.project.repository.AccountRepository;

@Service
public class UserDetailsServiceimpl implements UserDetailsService{
	
	@Autowired
	private AccountRepository accountRepository;
	
//	@Autowired
//	private ModelMapper modelMapper;
	
	public UserDetailsServiceimpl(AccountRepository accountRepository) {
		// TODO Auto-generated constructor stub
		this.accountRepository = accountRepository;
	}
	

	@Override
	public UserDetails loadUserByUsername(String phone) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Account account = accountRepository.findByPhone(phone);
		//AccountDTO accountDTO = modelMapper.map(account, AccountDTO.class);
		
		if(account == null) throw new UsernameNotFoundException("Phone not exist");
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(account.getRole_id()));
		
		return new User(account.getPhone(),account.getPassword(), authorities);
	}

}
