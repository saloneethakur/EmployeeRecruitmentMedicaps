package com.EmployeeRecruitmentMedicaps.entities;


import java.util.Date;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "applications")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Application {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "personal_id", nullable = false)
    private PersonalInformation personalInformation;

    @ManyToOne
    @JoinColumn(name = "vacancy_id", nullable = false)
    private Vacancy vacancy;

    @Column(nullable = false)
    private Date appliedDate;

	public Application(PersonalInformation personalInformation, Vacancy vacancy, Date appliedDate) {
		super();
		this.personalInformation = personalInformation;
		this.vacancy = vacancy;
		this.appliedDate = appliedDate;
	}

	

    
}
