package com.prm.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.prm.project.entity.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, String>{
	
	List<Account> getListByPhone(String phone);
	Account findByPhone(String phone);
	
	@Query(value="UPDATE Account SET token= :token where phone= :phone", nativeQuery = true)
	void updateTokenByPhone(@Param("token") String token,@Param("phone") String phone);
}
