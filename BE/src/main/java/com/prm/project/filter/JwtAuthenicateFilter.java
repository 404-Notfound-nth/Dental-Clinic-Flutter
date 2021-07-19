package com.prm.project.filter;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import io.jsonwebtoken.Jwts;

public class JwtAuthenicateFilter extends BasicAuthenticationFilter {

	private UserDetailsService userDetailsService;

	public JwtAuthenicateFilter(AuthenticationManager authenticationManager, UserDetailsService userDetailsService) {
		super(authenticationManager);
		this.userDetailsService = userDetailsService;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// B1: LẤY TOKEN TỪ REQUEST
		try {
			String authorization = request.getHeader("Authorization");
			System.out.println(authorization);
			if (authorization != null && !authorization.isEmpty()) {
				// B2: GIẢI NGƯỢC TOKEN => LẤY EMAIL ĐÃ LƯU VÀO TOKEN Ở BƯỚC ĐĂNG NHẬP
				String encodedString = Base64.getEncoder().encodeToString("NTH".getBytes());
				String email = Jwts.parser().setSigningKey(encodedString).parseClaimsJws(authorization).getBody()
						.getSubject();

				// B3: TRUY VẪN DN LẤY THÔNG TIN USER (SỬ DỤNG EMAIL VỪA LẤY TỪ TOKEN)
				UserDetails userDetails = userDetailsService.loadUserByUsername(email);
				// B4: LƯU THÔNG ITN USER VÀO SercurityContext (Để phân quyền)
				SecurityContextHolder.getContext().setAuthentication(
						new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities()));

				// Cấu hình không sử dụng session

			}
			// response.setStatus(401);
			chain.doFilter(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			response.setStatus(401);
		}

	}

}
