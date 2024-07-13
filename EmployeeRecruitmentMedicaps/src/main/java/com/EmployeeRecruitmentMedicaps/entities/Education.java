package com.EmployeeRecruitmentMedicaps.entities;


import java.util.Date;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "education")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Education {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer educationId;

    @Column(nullable = false)
    private String institutionName;

    @Column(nullable = false)
    private String educationClass;

    @Column(nullable = false)
    private Date completionYear;

    @Column(nullable = false)
    private String percentage;

    @Column(nullable = true)
    private String fieldOfStudy;
    
    @Column(nullable = false)
    private String courseType;

    
    @ManyToOne
    @JoinColumn(name = "PersonalInformation_id", nullable = false)
    private PersonalInformation personalInformation;


	public Education(String institutionName, String educationClass, Date completionYear, String percentage,
			String courseType, PersonalInformation personalInformation) {
		super();
		this.institutionName = institutionName;
		this.educationClass = educationClass;
		this.completionYear = completionYear;
		this.percentage = percentage;
		this.courseType = courseType;
		this.personalInformation = personalInformation;
	}


	public Education(String institutionName, String educationClass, Date completionYear, String percentage,
			String fieldOfStudy, String courseType, PersonalInformation personalInformation) {
		super();
		this.institutionName = institutionName;
		this.educationClass = educationClass;
		this.completionYear = completionYear;
		this.percentage = percentage;
		this.fieldOfStudy = fieldOfStudy;
		this.courseType = courseType;
		this.personalInformation = personalInformation;
	}
	
    
    
}