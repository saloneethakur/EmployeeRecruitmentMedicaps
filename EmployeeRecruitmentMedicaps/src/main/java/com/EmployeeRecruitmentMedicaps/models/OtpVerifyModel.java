package com.EmployeeRecruitmentMedicaps.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OtpVerifyModel {

	public String mail;
	public String otp;
	
}
