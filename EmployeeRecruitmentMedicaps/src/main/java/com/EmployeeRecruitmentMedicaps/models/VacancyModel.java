package com.EmployeeRecruitmentMedicaps.models;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VacancyModel {

    
    private String faculty;
    private String department;
    private String postAppliedFor;
    private String vstart; // Date stored as String
    private String vlast;  // Date stored as String
    
   
}