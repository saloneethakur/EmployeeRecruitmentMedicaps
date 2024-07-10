package com.EmployeeRecruitmentMedicaps.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EducationForm{
    // 10th Details
    private String school_name10;
    private String board_name10;
    private String passing_year10;
    private String percentage10;

    // 12th Details
    private String school_name12;
    private String board_name12;
    private String passing_year12;
    private String percentage12;
    private String field_of_study12;

    // Diploma Details
    private String diplomaInstitutionName;
    private String diplomaFieldOfStudy;
    private String passingYearDiploma;
    private String percentageDiploma;
    

    // UG Details
    private String uGDegreeName;
    private String uGFieldName;
    private String uGInstitutionName;
    private String passingYearUG;
    private String percentageUG;

    // PG Details
    private String pGDegreeName;
    private String pGFieldName;
    private String pGInstitutionName;
    private String passingYearPG;
    private String percentagePG;

    // PG 2 Details
    private String pGDegreeName2;
    private String pGFieldName2;
    private String pGInstitutionName2;
    private String passingYearPG2;
    private String percentagePG2;

    // PhD Details
    private String phDFieldName;
    private String phDThesisTopic;
    private String phDInstitutionName;
    private String phDYearOfPassing;
    private String phDSupervisorName;
    private String pHDSummary;
    
    
/*
    // Constructor for condition 1: 10th, 12th, UG, PG
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String school_name12, String board_name12, String passing_year12, String percentage12,String field_of_study12,
                         String uGDegreeName, String uGFieldName, String uGInstitutionName, String passingYearUG,
                         String percentageUG, String pGDegreeName, String pGFieldName, String pGInstitutionName,
                         String passingYearPG, String percentagePG) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.school_name12 = school_name12;
        this.board_name12 = board_name12;
        this.passing_year12 = passing_year12;
        this.field_of_study12=field_of_study12;
        this.percentage12 = percentage12;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
    }
    

    // Constructor for condition 2: 10th, 12th, UG, PG, PG2
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String school_name12, String board_name12, String passing_year12, String percentage12,String field_of_study12,
                         String uGDegreeName, String uGFieldName, String uGInstitutionName, String passingYearUG,
                         String percentageUG, String pGDegreeName, String pGFieldName, String pGInstitutionName,
                         String passingYearPG, String percentagePG, String pGDegreeName2, String pGFieldName2,
                         String pGInstitutionName2, String passingYearPG2, String percentagePG2) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.school_name12 = school_name12;
        this.board_name12 = board_name12;
        this.passing_year12 = passing_year12;
        this.percentage12 = percentage12;
        this.field_of_study12=field_of_study12;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.pGDegreeName2 = pGDegreeName2;
        this.pGFieldName2 = pGFieldName2;
        this.pGInstitutionName2 = pGInstitutionName2;
        this.passingYearPG2 = passingYearPG2;
        this.percentagePG2 = percentagePG2;
    }
 
    // Constructor for condition 3: 10th, 12th, UG, PG, PhD
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String school_name12, String board_name12, String passing_year12, String percentage12,String field_of_study12,
                         String uGDegreeName, String uGFieldName, String uGInstitutionName, String passingYearUG,
                         String percentageUG, String pGDegreeName, String pGFieldName, String pGInstitutionName,
                         String passingYearPG, String percentagePG, String phDFieldName, String phDThesisTopic,
                         String phDInstitutionName, String phDYearOfPassing, String phDSupervisorName,
                         String pHDSummary) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.school_name12 = school_name12;
        this.board_name12 = board_name12;
        this.passing_year12 = passing_year12;
        this.percentage12 = percentage12;
        this.field_of_study12=field_of_study12;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.phDFieldName = phDFieldName;
        this.phDThesisTopic = phDThesisTopic;
        this.phDInstitutionName = phDInstitutionName;
        this.phDYearOfPassing = phDYearOfPassing;
        this.phDSupervisorName = phDSupervisorName;
        this.pHDSummary = pHDSummary;
    }

    // Constructor for condition 4: 10th, 12th, UG, PG, PG2, PhD
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String school_name12, String board_name12, String passing_year12, String percentage12,String field_of_study12,
                         String uGDegreeName, String uGFieldName, String uGInstitutionName, String passingYearUG,
                         String percentageUG, String pGDegreeName, String pGFieldName, String pGInstitutionName,
                         String passingYearPG, String percentagePG, String pGDegreeName2, String pGFieldName2,
                         String pGInstitutionName2, String passingYearPG2, String percentagePG2, String phDFieldName,
                         String phDThesisTopic, String phDInstitutionName, String phDYearOfPassing,
                         String phDSupervisorName, String pHDSummary) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.school_name12 = school_name12;
        this.board_name12 = board_name12;
        this.passing_year12 = passing_year12;
        this.percentage12 = percentage12;
        this.field_of_study12=field_of_study12;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.pGDegreeName2 = pGDegreeName2;
        this.pGFieldName2 = pGFieldName2;
        this.pGInstitutionName2 = pGInstitutionName2;
        this.passingYearPG2 = passingYearPG2;
        this.percentagePG2 = percentagePG2;
        this.phDFieldName = phDFieldName;
        this.phDThesisTopic = phDThesisTopic;
        this.phDInstitutionName = phDInstitutionName;
        this.phDYearOfPassing = phDYearOfPassing;
        this.phDSupervisorName = phDSupervisorName;
        this.pHDSummary = pHDSummary;
    }
 // Constructor for condition 5: 10th, Diploma, UG, PG
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String diplomaInstitutionName, String diplomaFieldOfStudy, String passingYearDiploma,
                         String percentageDiploma, String uGDegreeName, String uGFieldName, String uGInstitutionName,
                         String passingYearUG, String percentageUG, String pGDegreeName, String pGFieldName,
                         String pGInstitutionName, String passingYearPG, String percentagePG) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.diplomaInstitutionName = diplomaInstitutionName;
        this.diplomaFieldOfStudy = diplomaFieldOfStudy;
        this.passingYearDiploma = passingYearDiploma;
        this.percentageDiploma = percentageDiploma;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
    }


    

    // Constructor for condition 6: 10th, Diploma, UG, PG, PG2
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String diplomaInstitutionName, String diplomaFieldOfStudy, String passingYearDiploma,
                         String percentageDiploma, String uGDegreeName, String uGFieldName, String uGInstitutionName,
                         String passingYearUG, String percentageUG, String pGDegreeName, String pGFieldName,
                         String pGInstitutionName, String passingYearPG, String percentagePG, String pGDegreeName2,
                         String pGFieldName2, String pGInstitutionName2, String passingYearPG2, String percentagePG2) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.diplomaInstitutionName = diplomaInstitutionName;
        this.diplomaFieldOfStudy = diplomaFieldOfStudy;
        this.passingYearDiploma = passingYearDiploma;
        this.percentageDiploma = percentageDiploma;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.pGDegreeName2 = pGDegreeName2;
        this.pGFieldName2 = pGFieldName2;
        this.pGInstitutionName2 = pGInstitutionName2;
        this.passingYearPG2 = passingYearPG2;
        this.percentagePG2 = percentagePG2;
    }

    // Constructor for condition 7: 10th, Diploma, UG, PG, PhD
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String diplomaInstitutionName, String diplomaFieldOfStudy, String passingYearDiploma,
                         String percentageDiploma, String uGDegreeName, String uGFieldName, String uGInstitutionName,
                         String passingYearUG, String percentageUG, String pGDegreeName, String pGFieldName,
                         String pGInstitutionName, String passingYearPG, String percentagePG, String phDFieldName,
                         String phDThesisTopic, String phDInstitutionName, String phDYearOfPassing,
                         String phDSupervisorName, String pHDSummary) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.diplomaInstitutionName = diplomaInstitutionName;
        this.diplomaFieldOfStudy = diplomaFieldOfStudy;
        this.passingYearDiploma = passingYearDiploma;
        this.percentageDiploma = percentageDiploma;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.phDFieldName = phDFieldName;
        this.phDThesisTopic = phDThesisTopic;
        this.phDInstitutionName = phDInstitutionName;
        this.phDYearOfPassing = phDYearOfPassing;
        this.phDSupervisorName = phDSupervisorName;
        this.pHDSummary = pHDSummary;
    }

    // Constructor for condition 8: 10th, Diploma, UG, PG, PG2, PhD
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String diplomaInstitutionName, String diplomaFieldOfStudy, String passingYearDiploma,
                         String percentageDiploma, String uGDegreeName, String uGFieldName, String uGInstitutionName,
                         String passingYearUG, String percentageUG, String pGDegreeName, String pGFieldName,
                         String pGInstitutionName, String passingYearPG, String percentagePG, String pGDegreeName2,
                         String pGFieldName2, String pGInstitutionName2, String passingYearPG2, String percentagePG2,
                         String phDFieldName, String phDThesisTopic, String phDInstitutionName, String phDYearOfPassing,
                         String phDSupervisorName, String pHDSummary) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.diplomaInstitutionName = diplomaInstitutionName;
        this.diplomaFieldOfStudy = diplomaFieldOfStudy;
        this.passingYearDiploma = passingYearDiploma;
        this.percentageDiploma = percentageDiploma;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.pGDegreeName2 = pGDegreeName2;
        this.pGFieldName2 = pGFieldName2;
        this.pGInstitutionName2 = pGInstitutionName2;
        this.passingYearPG2 = passingYearPG2;
        this.percentagePG2 = percentagePG2;
        this.phDFieldName = phDFieldName;
        this.phDThesisTopic = phDThesisTopic;
        this.phDInstitutionName = phDInstitutionName;
        this.phDYearOfPassing = phDYearOfPassing;
        this.phDSupervisorName = phDSupervisorName;
        this.pHDSummary = pHDSummary;
    }

    // Constructor for condition 9: 10th, 12th, Diploma, UG, PG
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String school_name12, String board_name12, String passing_year12, String percentage12,String field_of_study12,
                         String diplomaInstitutionName, String diplomaFieldOfStudy, String passingYearDiploma,
                         String percentageDiploma, String uGDegreeName, String uGFieldName, String uGInstitutionName,
                         String passingYearUG, String percentageUG, String pGDegreeName, String pGFieldName,
                         String pGInstitutionName, String passingYearPG, String percentagePG) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.school_name12 = school_name12;
        this.board_name12 = board_name12;
        this.passing_year12 = passing_year12;
        this.percentage12 = percentage12;
        this.field_of_study12=field_of_study12;
        this.diplomaInstitutionName = diplomaInstitutionName;
        this.diplomaFieldOfStudy = diplomaFieldOfStudy;
        this.passingYearDiploma = passingYearDiploma;
        this.percentageDiploma = percentageDiploma;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
    }

    // Constructor for condition 10: 10th, 12th, Diploma, UG, PG, PG2
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String school_name12, String board_name12, String passing_year12, String percentage12,String field_of_study12,
                         String diplomaInstitutionName, String diplomaFieldOfStudy, String passingYearDiploma,
                         String percentageDiploma, String uGDegreeName, String uGFieldName, String uGInstitutionName,
                         String passingYearUG, String percentageUG, String pGDegreeName, String pGFieldName,
                         String pGInstitutionName, String passingYearPG, String percentagePG, String pGDegreeName2,
                         String pGFieldName2, String pGInstitutionName2, String passingYearPG2, String percentagePG2) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.school_name12 = school_name12;
        this.board_name12 = board_name12;
        this.passing_year12 = passing_year12;
        this.percentage12 = percentage12;
        this.field_of_study12=field_of_study12;
        this.diplomaInstitutionName = diplomaInstitutionName;
        this.diplomaFieldOfStudy = diplomaFieldOfStudy;
        this.passingYearDiploma = passingYearDiploma;
        this.percentageDiploma = percentageDiploma;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.pGDegreeName2 = pGDegreeName2;
        this.pGFieldName2 = pGFieldName2;
        this.pGInstitutionName2 = pGInstitutionName2;
        this.passingYearPG2 = passingYearPG2;
        this.percentagePG2 = percentagePG2;
    }

    // Constructor for condition 11: 10th, 12th, Diploma, UG, PG, PhD
    public EducationForm(String school_name10, String board_name10, String passing_year10, String percentage10,
                         String school_name12, String board_name12, String passing_year12, String percentage12,String field_of_study12,
                         String diplomaInstitutionName, String diplomaFieldOfStudy, String passingYearDiploma,
                         String percentageDiploma, String uGDegreeName, String uGFieldName, String uGInstitutionName,
                         String passingYearUG, String percentageUG, String pGDegreeName, String pGFieldName,
                         String pGInstitutionName, String passingYearPG, String percentagePG, String phDFieldName,
                         String phDThesisTopic, String phDInstitutionName, String phDYearOfPassing,
                         String phDSupervisorName, String pHDSummary) {
        this.school_name10 = school_name10;
        this.board_name10 = board_name10;
        this.passing_year10 = passing_year10;
        this.percentage10 = percentage10;
        this.school_name12 = school_name12;
        this.board_name12 = board_name12;
        this.passing_year12 = passing_year12;
        this.percentage12 = percentage12;
        this.field_of_study12=field_of_study12;
        this.diplomaInstitutionName = diplomaInstitutionName;
        this.diplomaFieldOfStudy = diplomaFieldOfStudy;
        this.passingYearDiploma = passingYearDiploma;
        this.percentageDiploma = percentageDiploma;
        this.uGDegreeName = uGDegreeName;
        this.uGFieldName = uGFieldName;
        this.uGInstitutionName = uGInstitutionName;
        this.passingYearUG = passingYearUG;
        this.percentageUG = percentageUG;
        this.pGDegreeName = pGDegreeName;
        this.pGFieldName = pGFieldName;
        this.pGInstitutionName = pGInstitutionName;
        this.passingYearPG = passingYearPG;
        this.percentagePG = percentagePG;
        this.phDFieldName = phDFieldName;
        this.phDThesisTopic = phDThesisTopic;
        this.phDInstitutionName = phDInstitutionName;
        this.phDYearOfPassing = phDYearOfPassing;
        this.phDSupervisorName = phDSupervisorName;
        this.pHDSummary = pHDSummary;
    }

   */ 
   
}
