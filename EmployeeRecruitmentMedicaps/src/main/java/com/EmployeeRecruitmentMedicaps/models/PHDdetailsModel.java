package com.EmployeeRecruitmentMedicaps.models;
import java.util.Date;

import com.EmployeeRecruitmentMedicaps.Utils.ApiResponse;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PHDdetailsModel {

	// PHD DETAILS
	private String PhDInstitution_name;
	private String PhD_Thesis_topic;
	private String percentage;
	    private String PhD_Field_name;
	    private String joiningYear;
	    private String PhD_year_of_passing;
	    private String PhD_Supervisor_name;
	    private String PhDSummary;
		public PHDdetailsModel(String phDInstitution_name, String phD_Thesis_topic, String percentage,
				String phD_Field_name,String joiningYear, String phD_year_of_passing, String phD_Supervisor_name) {
			super();
			PhDInstitution_name = phDInstitution_name;
			PhD_Thesis_topic = phD_Thesis_topic;
			this.percentage = percentage;
			PhD_Field_name = phD_Field_name;
			this.joiningYear=joiningYear;
			PhD_year_of_passing = phD_year_of_passing;
			PhD_Supervisor_name = phD_Supervisor_name;
		}
		
	    
	    
	    
	    
}
