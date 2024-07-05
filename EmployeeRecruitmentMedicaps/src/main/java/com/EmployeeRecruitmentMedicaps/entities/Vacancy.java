package com.EmployeeRecruitmentMedicaps.entities;


import java.util.Date;
import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "vacancy")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vacancy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    

    @Column(nullable = false)
    private String faculty;

    @Column(nullable = false)
    private String department;


    @Column(nullable = false)
    private String postAppliedFor;

    
    @Column(nullable = false)
	private Date vstart;
    
    @Column(nullable = false)
	private Date vlast;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
