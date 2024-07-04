package com.EmployeeRecruitmentMedicaps.entities;

import java.util.Date;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "personal_information")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonalInformation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String alternatePhoneNumber;
    
    @Column(nullable = false)
	private Date dob;

    @Column(nullable = false)
    private String address;

    @Column(nullable = false)
    private String pincode;

    @Column(nullable = false)
    private String district;

    @Column(nullable = false)
    private String state;

    @Column(nullable = false)
    private String country;

    @Column(nullable = true)
    private String researcherId;

    @Column(nullable = true)
    private String scopusId;

    @Column(nullable = true)
    private String orcid;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
}