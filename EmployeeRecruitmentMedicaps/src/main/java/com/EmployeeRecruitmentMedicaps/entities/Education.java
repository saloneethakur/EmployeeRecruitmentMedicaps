package com.EmployeeRecruitmentMedicaps.entities;


import javax.persistence.*;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String institutionName;

    @Column(nullable = false)
    private String educationClass;

    @Column(nullable = false)
    private Integer completionYear;

    @Column(nullable = false)
    private String percentage;

    @Column(nullable = true)
    private String fieldOfStudy;
    
    @Column(nullable = false)
    private String courseType;

    
    @ManyToOne
    @JoinColumn(name = "PersonalInformation_id", nullable = false)
    private PersonalInformation PersonalInformation;
}