package com.prm.project.api;

import java.util.Base64;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.prm.project.dto.AccountDTO;
import com.prm.project.service.AccountService;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@RestController
@RequestMapping("api/auth")
public class ApiAuthController {
	@Autowired
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private AccountService accountService;
	
//	@Autowired
//	private AccountRepository accountRepository;

	public ApiAuthController(AuthenticationManager authenticationManager) {
		this.authenticationManager = authenticationManager;
	}

	@PostMapping("login")
	public ResponseEntity<Object> login(@RequestBody AccountDTO account) {
		try {
			System.out.println("==============================");
			System.out.println(account.getPhone());
			System.out.println(account.getPassword());
			// Gọi hàm thực hiện đăng nhập
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(account.getPhone(),account.getPassword()));
			Date now = new Date();
			// Nếu đăng nhập thành công trả về Token
			String encodedString = Base64.getEncoder().encodeToString("NTH".getBytes());
			// tạo token
			String token = Jwts.builder().setSubject(account.getPhone()).setIssuedAt(now)// lấy tại thời điểm này
					.setExpiration(new Date(now.getTime() + 864000000L)) // thời gian tồn tại token
					.signWith(SignatureAlgorithm.HS512, encodedString).compact();
			
			System.out.println("=============>>>>>.. token " + token);
			//accountRepository.setTokenByPhone(token, phone);
			accountService.updateToken(account.getPhone(), token);
			AccountDTO accountDTO = accountService.getAccount(account.getPhone());
			return new ResponseEntity<Object>( accountDTO, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return new ResponseEntity<Object>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
	}
}
