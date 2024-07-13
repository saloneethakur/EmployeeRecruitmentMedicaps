package com.EmployeeRecruitmentMedicaps.models;

import java.util.Date;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EducationDetailsModel {
//can remove
	
	
	private String School_name10;
    private String Board_name10;
    private String Passing_year10;
    private String Percentage10;
    
    // 12th Details
    private String School_name12;
    private String Board_name12;
    private String Passing_year12;
    private String Percentage12;
    private String Field_of_study12;

    // Diploma Details
   
    private String DiplomaInstitutionName;
    private String Diploma_name;
    private String DiplomaFieldOfStudy;
    private String DiplomaCompletionYear;
    private String DiplomaPercentage;

    // UG details
    private String UGDegree_name;
    private String UGField_name;
    private String UGInstitution_name;
    private String Passing_yearUG;
    private String Percentage_UG;
    
    // PG details
    private String PGDegree_name;
    private String PGField_name;
    private String PGInstitution_name;
    private String Passing_yearPG;
    private String Percentage_PG;

    // Second PG details
    private String SecondPGDegree_name;
    private String SecondPGField_name;
    private String SecondPGInstitution_name;
    private String Passing_yearSecondPG;
    private String Percentage_SecondPG;

    // PHD DETAILS
    private String PhD_Field_name;
    private String PhD_Thesis_topic;
    private String PhDInstitution_name;
    private String PhD_year_of_passing;
    private String PhD_Supervisor_name;
    private String PhDSummary;

}
