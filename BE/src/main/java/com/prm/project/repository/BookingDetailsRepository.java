package com.prm.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prm.project.entity.BookingDetails;

@Repository
public interface BookingDetailsRepository extends JpaRepository<BookingDetails, String>{

}
