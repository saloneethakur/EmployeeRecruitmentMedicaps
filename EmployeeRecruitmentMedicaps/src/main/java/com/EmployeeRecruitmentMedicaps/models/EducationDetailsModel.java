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
	
	
	private String School_name;
    private String Board_name;
    private String Passing_year;
    private String Percentage;
    private String courseType;
    private String Field_of_study;
    
	public EducationDetailsModel(String school_name, String board_name, String passing_year, String percentage,
			String courseType) {
		super();
		School_name = school_name;
		Board_name = board_name;
		Passing_year = passing_year;
		Percentage = percentage;
		this.courseType = courseType;
	}
    
	
    
    
}

