package com.EmployeeRecruitmentMedicaps.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.EmployeeRecruitmentMedicaps.entities.Application;
import com.EmployeeRecruitmentMedicaps.entities.Education;
import com.EmployeeRecruitmentMedicaps.entities.PersonalInformation;
import com.EmployeeRecruitmentMedicaps.entities.User;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;

public interface ApplicationRepository extends JpaRepository<Application, Integer>{
		List<Application> findByVacancy(Vacancy vacancy);
		List<Application> findAllByPersonalInformation(PersonalInformation personalInformation);
		void deleteAll();
		int deleteByVacancyId(Integer vacancyId);
}
