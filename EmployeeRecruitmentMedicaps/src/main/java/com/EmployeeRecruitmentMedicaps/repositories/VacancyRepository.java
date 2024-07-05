package com.EmployeeRecruitmentMedicaps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.EmployeeRecruitmentMedicaps.entities.Vacancy;

public interface VacancyRepository extends JpaRepository<Vacancy, Integer>{

}
