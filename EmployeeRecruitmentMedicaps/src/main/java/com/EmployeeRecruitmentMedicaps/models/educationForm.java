package com.EmployeeRecruitmentMedicaps.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class educationForm{
    //10th Details
	private String school_name10;
	private String board_name10;
	private String passing_year10;
	private String percentage10;
	
	//12th Details
	private String school_name12;
	private String board_name12;
	private String passing_year12;
	private String percentage12;
	private String field_of_study12;
	
	//UG details
	private String UGDegree_name;
	private String UGField_name;//*
	private String UGInstitution_name;
	private String passsing_yearUG;
	//*
	private String percentage_UG;
	
	//PG details
	private String PGDegree_name;
	private String PGField_name;
	private String PGInstitution_name;
	private String passsing_yearpG;
	private String percentage_PG;//*
	
	//PHD DETAILS
	private String PhD_Field_name;
	private String PhD_Thesis_topic;
	private String PhDInstitution_name;
	private String PhD_year_of_passing;
	private String PhD_Supervisor_name;
	private String PhDSummary;
	
}



