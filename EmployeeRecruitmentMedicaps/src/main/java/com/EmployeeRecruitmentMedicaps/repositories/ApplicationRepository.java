package com.EmployeeRecruitmentMedicaps.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.EmployeeRecruitmentMedicaps.entities.Application;
import com.EmployeeRecruitmentMedicaps.entities.Education;

public interface ApplicationRepository extends JpaRepository<Application, Integer>{

}
