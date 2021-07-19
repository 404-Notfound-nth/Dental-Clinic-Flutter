package com.prm.project.service;

import com.prm.project.dto.AccountDTO;

public interface AccountService {
	void registerAccount(AccountDTO accountDTO);
	void updateToken(String phone,String token);
	AccountDTO getAccount(String phone);
}
