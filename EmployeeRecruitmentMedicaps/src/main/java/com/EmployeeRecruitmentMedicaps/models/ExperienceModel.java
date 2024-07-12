package com.EmployeeRecruitmentMedicaps.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExperienceModel {

   
    private String jobTitle;
    private String instituteName;
    private Date startDate;
    private Date endDate;
	public ExperienceModel(String jobTitle, String instituteName, Date startDate) {
		super();
		this.jobTitle = jobTitle;
		this.instituteName = instituteName;
		this.startDate = startDate;
	}
   
}