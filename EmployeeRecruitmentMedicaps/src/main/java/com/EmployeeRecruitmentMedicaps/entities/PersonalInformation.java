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
    private String gender;
    
    @Column(nullable = false)
    private String caste;


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
    private String examQualified;

    @Column(nullable = true)
    private String researcherId;

    @Column(nullable = true)
    private String scopusId;

    @Column(nullable = true)
    private String orcid;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

	public PersonalInformation(String alternatePhoneNumber, Date dob, String gender, String caste, String address,
			String pincode, String district, String state, String country) {
		super();
		this.alternatePhoneNumber = alternatePhoneNumber;
		this.dob = dob;
		this.gender = gender;
		this.caste = caste;
		this.address = address;
		this.pincode = pincode;
		this.district = district;
		this.state = state;
		this.country = country;
	}

	public PersonalInformation(String alternatePhoneNumber, Date dob, String gender, String caste, String address,
			String pincode, String district, String state, String country, String examQualified) {
		super();
		this.alternatePhoneNumber = alternatePhoneNumber;
		this.dob = dob;
		this.gender = gender;
		this.caste = caste;
		this.address = address;
		this.pincode = pincode;
		this.district = district;
		this.state = state;
		this.country = country;
		this.examQualified = examQualified;
	}
    
    
    
    
    
    
}