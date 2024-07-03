package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.entities.Otp;

@Repository
public interface OtpRepo extends JpaRepository<Otp, Integer> {

	Optional<Otp> findByUser(User user);
}
