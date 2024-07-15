package com.EmployeeRecruitmentMedicaps.entities;


import java.util.Date;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "phd_education")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PhdEducation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String institutionName;

    @Column(nullable = false)
    private String thesis;

    @Column(nullable = false)
    private String percentage;

    @Column(nullable = false)
    private String fieldOfStudy;

    @Column(nullable = false)
	private Date joiningYear;
    
    @Column(nullable = false)
	private Date completionYear;
    

    @Column(nullable = false)
    private String supervisorOrAdvisor;

    @Column(nullable = true)
    private String researchSummary;

    @ManyToOne
    @JoinColumn(name = "PersonalInformation_id", nullable = false)
    private PersonalInformation PersonalInformation;

	public PhdEducation(String institutionName, String thesis, String percentage, String fieldOfStudy, Date joiningYear,
			Date completionYear, String supervisorOrAdvisor, String researchSummary,
			com.EmployeeRecruitmentMedicaps.entities.PersonalInformation personalInformation) {
		super();
		this.institutionName = institutionName;
		this.thesis = thesis;
		this.percentage = percentage;
		this.fieldOfStudy = fieldOfStudy;
		this.joiningYear = joiningYear;
		this.completionYear = completionYear;
		this.supervisorOrAdvisor = supervisorOrAdvisor;
		this.researchSummary = researchSummary;
		PersonalInformation = personalInformation;
	}

	public PhdEducation(String institutionName, String thesis, String percentage, String fieldOfStudy, Date joiningYear,
			Date completionYear, String supervisorOrAdvisor,
			com.EmployeeRecruitmentMedicaps.entities.PersonalInformation personalInformation) {
		super();
		this.institutionName = institutionName;
		this.thesis = thesis;
		this.percentage = percentage;
		this.fieldOfStudy = fieldOfStudy;
		this.joiningYear = joiningYear;
		this.completionYear = completionYear;
		this.supervisorOrAdvisor = supervisorOrAdvisor;
		PersonalInformation = personalInformation;
	}

	    
    
    
    
    
}