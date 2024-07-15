package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.PhdEducation;
import com.EmployeeRecruitmentMedicaps.entities.User;
@Repository
public interface PHDRepository extends JpaRepository<PhdEducation, Integer>{
	List<PhdEducation> findByPersonalInformationId(Integer personalInformationId);
}
