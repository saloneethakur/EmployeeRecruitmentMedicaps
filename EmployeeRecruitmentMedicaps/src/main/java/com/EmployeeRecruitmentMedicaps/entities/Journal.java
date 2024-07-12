package com.EmployeeRecruitmentMedicaps.entities;


import java.util.Date;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "journal")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Journal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "journal_id")
    private Integer journalId;

    @Column(name = "publication_title", nullable = false)
    private String publicationTitle;

    @Column(name = "journal_name", nullable = false)
    private String journalName;

    @Column(name = "volume", nullable = false)
    private String volume;

    @Column(name = "indexing", nullable = false)
    private String indexing;

    @Column(name = "year", nullable = false)
    private Date year;

    @ManyToOne
    @JoinColumn(name = "personal_information_id", nullable = false)
    private PersonalInformation personalInformation;
}