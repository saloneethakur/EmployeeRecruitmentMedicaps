package com.EmployeeRecruitmentMedicaps.entities;



import javax.persistence.Column;
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
@Table
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Otp {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer otpId;
	
	@ManyToOne
	@JoinColumn(unique = true, nullable = false)
	private User user;
	
	@Column(nullable = false)
	private String otpNumber;

	public Otp(User user, String otpNumber) {
		super();
		this.user = user;
		this.otpNumber = otpNumber;
	}
	
}