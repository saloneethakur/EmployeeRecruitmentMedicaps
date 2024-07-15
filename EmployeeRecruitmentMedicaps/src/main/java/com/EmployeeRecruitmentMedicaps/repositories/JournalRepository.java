package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.Journal;

public interface JournalRepository extends JpaRepository<Journal, Integer>{
	List<Journal> findByPersonalInformationId(Integer personalInformationId);

}
