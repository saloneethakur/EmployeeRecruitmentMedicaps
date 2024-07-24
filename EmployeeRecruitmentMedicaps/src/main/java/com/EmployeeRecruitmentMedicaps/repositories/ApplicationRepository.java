package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.EmployeeRecruitmentMedicaps.entities.Application;
import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;

public interface ApplicationRepository extends JpaRepository<Application, Integer>{
		List<Application> findByVacancy(Vacancy vacancy);
}
