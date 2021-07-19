package com.prm.project.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.prm.project.dto.AccountDTO;
import com.prm.project.entity.Account;
import com.prm.project.repository.AccountRepository;
import com.prm.project.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public void registerAccount(AccountDTO accountDTO) {
		// TODO Auto-generated method stub
			accountDTO.setPhone(accountDTO.getPhone());
			accountDTO.setPassword(bCryptPasswordEncoder.encode(accountDTO.getPassword()));
			accountDTO.setEmail(accountDTO.getEmail());
			accountDTO.setFullname(accountDTO.getFullname());
			accountDTO.setRole_id("ROLE_USER");
			accountDTO.setStatus_id("ACTIVE");
			accountDTO.setBirthday(accountDTO.getBirthday());

			Account entity = modelMapper.map(accountDTO, Account.class);
			accountRepository.save(entity);
		}
		

	@Override
	public void updateToken(String phone, String token) {
		// TODO Auto-generated method stub

		Account entity = accountRepository.findByPhone(phone);
		if (entity != null) {
			entity.setToken(token);
			accountRepository.save(entity);
		}

	}

	@Override
	public AccountDTO getAccount(String phone) {
		// TODO Auto-generated method stub
		Account account = accountRepository.findByPhone(phone);
		AccountDTO accountDTO = modelMapper.map(account, AccountDTO.class);
		return accountDTO;
	}

}
