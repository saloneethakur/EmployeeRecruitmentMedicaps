package com.EmployeeRecruitmentMedicaps.models;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor


public class PersonalDetailsModel {
	 
	    private String alternatePhoneNumber;
	    private String dob;  // Date stored as String
	    private String gender;
	    private String caste;
	    private String address;
	    private String pincode;
	    private String district;
	    private String state;
	    private String country;
	    private String researcherId;
	    private String scopusId;
	    private String orcid;
	    private String examQualified;
		public PersonalDetailsModel(String alternatePhoneNumber, String dob, String gender, String caste,
				String address, String pincode, String district, String state, String country) {
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
		public PersonalDetailsModel(String alternatePhoneNumber, String dob, String gender, String caste,
				String address, String pincode, String district, String state, String country, String examQualified) {
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


