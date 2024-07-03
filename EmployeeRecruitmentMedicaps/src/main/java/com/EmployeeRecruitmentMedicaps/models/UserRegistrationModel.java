package com.EmployeeRecruitmentMedicaps.models;





import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegistrationModel {

	private String name;
	private String number;
	private String email;
	private String password;
}
