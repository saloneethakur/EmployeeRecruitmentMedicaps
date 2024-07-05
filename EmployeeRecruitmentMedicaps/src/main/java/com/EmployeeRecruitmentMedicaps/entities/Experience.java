package com.EmployeeRecruitmentMedicaps.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "experience")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Experience {

    @Id
    @Column(name = "experience_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer experienceId;

    @Column(name = "job_title", nullable = false)
    private String jobTitle;

    @Column(name = "institute_name", nullable = false)
    private String instituteName;

    @Column(name = "year", nullable = false)
    private Integer year;

   

    @Column(name = "start_date", nullable = false)
    private Date startDate;

    @Column(name = "end_date", nullable = false)
    private Date endDate;
    
    @ManyToOne
    @JoinColumn(name = "PersonalInformation_id", nullable = false)
    private PersonalInformation PersonalInformation;

    
}