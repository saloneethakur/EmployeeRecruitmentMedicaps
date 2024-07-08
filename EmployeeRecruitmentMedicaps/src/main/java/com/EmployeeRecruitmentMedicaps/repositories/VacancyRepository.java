package com.EmployeeRecruitmentMedicaps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.EmployeeRecruitmentMedicaps.entities.Vacancy;
@Repository
public interface VacancyRepository extends JpaRepository<Vacancy, Integer>{

}
