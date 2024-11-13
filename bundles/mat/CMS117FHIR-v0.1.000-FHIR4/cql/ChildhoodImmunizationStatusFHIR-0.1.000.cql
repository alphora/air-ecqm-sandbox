library ChildhoodImmunizationStatusFHIR version '0.1.000'

using QICore version '4.1.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include SupplementalDataElements version '3.5.000' called SDE
include CQMCommon version '2.2.000' called CQMCommon
include Hospice version '6.12.000' called Hospice
include Status version '1.8.000' called Status
include QICoreCommon version '2.1.000' called QICoreCommon

codesystem "SNOMEDCT": 'http://snomed.info/sct' 
codesystem "CPT": 'http://www.ama-assn.org/go/cpt' 
codesystem "CVX": 'http://hl7.org/fhir/sid/cvx' 
codesystem "ICD10": 'http://www.cms.gov/Medicare/Coding/ICD10'

valueset "Anaphylactic Reaction to DTaP Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1031' 
valueset "Disorders of the Immune System": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.120.12.1001' 
valueset "DTaP Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1214' 
valueset "DTaP Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1022' 
valueset "Encephalitis Due to Diphtheria, Tetanus or Pertussis Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.1164' 
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307' 
valueset "Haemophilus Influenzae Type B (Hib) Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1043' 
valueset "Hepatitis A": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1024' 
valueset "Hepatitis A Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1215' 
valueset "Hepatitis A Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1041' 
valueset "Hepatitis B": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1025' 
valueset "Hepatitis B Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1216' 
valueset "Hepatitis B Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1042' 
valueset "Hib Vaccine (3 dose schedule)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1083' 
valueset "Hib Vaccine (3 dose schedule) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1084' 
valueset "Hib Vaccine (4 dose schedule)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1085' 
valueset "Hib Vaccine (4 dose schedule) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1086' 
valueset "HIV": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.120.12.1003' 
valueset "Home Healthcare Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1016' 
valueset "Hospice care ambulatory": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1108.15' 
valueset "Inactivated Polio Vaccine (IPV)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1219' 
valueset "Inactivated Polio Vaccine (IPV) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1045' 
valueset "Child Influenza Immunization Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1218' 
valueset "Child Influenza Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1044' 
valueset "Influenza Virus LAIV Immunization": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1087' 
valueset "Influenza Virus LAIV Procedure": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1088' 
valueset "Intussusception": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.199.12.1056' 
valueset "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.108.12.1009' 
valueset "Measles": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1053' 
valueset "Measles, Mumps and Rubella (MMR) Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1224' 
valueset "Measles, Mumps and Rubella (MMR) Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1031' 
valueset "Mumps": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1032' 
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001' 
valueset "Online Assessments": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1089' 
valueset "Pneumococcal Conjugate Vaccine": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1221' 
valueset "Pneumococcal Conjugate Vaccine Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1046' 
valueset "Preventive Care Services, Initial Office Visit, 0 to 17": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1022' 
valueset "Preventive Care, Established Office Visit, 0 to 17": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1024' 
valueset "Rotavirus Vaccine (2 dose schedule) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1048' 
valueset "Rotavirus Vaccine (3 dose schedule)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1223' 
valueset "Rotavirus Vaccine (3 dose schedule) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1047' 
valueset "Rubella": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1037' 
valueset "Severe Combined Immunodeficiency": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.120.12.1007' 
valueset "Telephone Visits": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1080' 
valueset "Varicella Zoster": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1039' 
valueset "Varicella Zoster Vaccine (VZV)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.196.12.1170' 
valueset "Varicella Zoster Vaccine (VZV) Administered": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.110.12.1040' 

code "Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)": '433621000124101' from "SNOMEDCT" display 'Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)'
code "Anaphylaxis due to Hepatitis B vaccine (disorder)": '428321000124101' from "SNOMEDCT" display 'Anaphylaxis due to Hepatitis B vaccine (disorder)'
code "Anaphylaxis due to rotavirus vaccine (disorder)": '428331000124103' from "SNOMEDCT" display 'Anaphylaxis due to rotavirus vaccine (disorder)'
code "Office or other outpatient visit for the evaluation and management of an established patient that may not require the presence of a physician or other qualified health care professional": '99211' from "CPT" display 'Office or other outpatient visit for the evaluation and management of an established patient that may not require the presence of a physician or other qualified health care professional'
code "rotavirus, live, monovalent vaccine": '119' from "CVX" display 'rotavirus, live, monovalent vaccine'
code "Anaphylaxis caused by vaccine product containing Hepatitis A virus antigen (disorder)": '471311000124103' from "SNOMEDCT" display 'Anaphylaxis caused by vaccine product containing Hepatitis A virus antigen (disorder)'
code "Introduction of Serum, Toxoid and Vaccine into Muscle, Percutaneous Approach": '3E0234Z' from "ICD10" display 'Introduction of Serum, Toxoid and Vaccine into Muscle, Percutaneous Approach'
code "Anaphylaxis caused by vaccine product containing Influenza virus antigen (disorder)": '471361000124100' from "SNOMEDCT" display 'Anaphylaxis caused by vaccine product containing Influenza virus antigen (disorder)'
code "Anaphylaxis caused by vaccine product containing Measles morbillivirus and Mumps orthorubulavirus and Rubella virus antigens (disorder)": '471331000124109' from "SNOMEDCT" display 'Anaphylaxis caused by vaccine product containing Measles morbillivirus and Mumps orthorubulavirus and Rubella virus antigens (disorder)'
code "Anaphylaxis caused by vaccine product containing Streptococcus pneumoniae antigen (disorder)": '471141000124102' from "SNOMEDCT" display 'Anaphylaxis caused by vaccine product containing Streptococcus pneumoniae antigen (disorder)'
code "Anaphylaxis caused by vaccine product containing human poliovirus antigen (disorder)": '471321000124106' from "SNOMEDCT" display 'Anaphylaxis caused by vaccine product containing human poliovirus antigen (disorder)'
code "Anaphylaxis caused by vaccine containing Human alphaherpesvirus 3 antigen (disorder)": '471341000124104' from "SNOMEDCT" display 'Anaphylaxis caused by vaccine containing Human alphaherpesvirus 3 antigen (disorder)'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Initial Population":
  AgeInYearsAt(date from 
    end of "Measurement Period"
  ) = 2
    and exists ( "Qualifying Encounters" )

//@MADiE export includes 'Status."Finished Encounter"([Encounter: "Office Visit"] union... )' but Status library currently in this repo doesn't include "Finished Encounter"
define "Qualifying Encounters":
  ( [Encounter: "Office Visit"]
    union [Encounter: "Home Healthcare Services"]
    union [Encounter: "Preventive Care, Established Office Visit, 0 to 17"]
    union [Encounter: "Preventive Care Services, Initial Office Visit, 0 to 17"]
    union ( [Encounter] E
        where exists ( ( E.type ) T
            where T ~ "Office or other outpatient visit for the evaluation and management of an established patient that may not require the presence of a physician or other qualified health care professional"
        )
    )
    union [Encounter: "Online Assessments"]
    union [Encounter: "Telephone Visits"] ) ValidEncounters
    where QICoreCommon."ToInterval" ( ValidEncounters.period ) during day of "Measurement Period"

define "Denominator":
  "Initial Population"

define "Denominator Exclusions":
  Hospice."Has Hospice Services"
    or "Has Severe Combined Immunodeficiency"
    or "Has Immunodeficiency"
    or "Has HIV"
    or "Has Lymphoreticular Cancer, Multiple Myeloma or Leukemia"
    or "Has Intussusception"

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Has Severe Combined Immunodeficiency":
  exists ( ( [Condition: "Severe Combined Immunodeficiency"] ) SevereImmuneDisorder
      where date from start of QICoreCommon."ToPrevalenceInterval" ( SevereImmuneDisorder ) during day of "First Two Years"
  )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Has Immunodeficiency":
  exists ( ( [Condition: "Disorders of the Immune System"] ) ImmuneDisorder
      where date from start of QICoreCommon."ToPrevalenceInterval" ( ImmuneDisorder ) during day of "First Two Years"
  )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Has HIV":
  exists ( ( [Condition: "HIV"] ) HIV
      where date from start of QICoreCommon."ToPrevalenceInterval" ( HIV ) during day of "First Two Years"
  )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Has Lymphoreticular Cancer, Multiple Myeloma or Leukemia":
  exists ( ( [Condition: "Malignant Neoplasm of Lymphatic and Hematopoietic Tissue"] ) LymphaticMalignantNeoplasm
      where date from start of QICoreCommon."ToPrevalenceInterval" ( LymphaticMalignantNeoplasm ) during day of "First Two Years"
  )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Has Intussusception":
  exists ( ( [Condition: "Intussusception"] ) IntussusceptionDisorder
      where date from start of QICoreCommon."ToPrevalenceInterval" ( IntussusceptionDisorder ) during day of "First Two Years"
  )

define "Numerator":
  ( exists ( "Four DTaP Vaccinations" )
      or exists ( "DTaP Numerator Inclusion Conditions" )
  )
    and ( exists ( "Three Polio Vaccinations" )
        or exists ( "Polio Numerator Inclusion Conditions" )
    )
    and ( exists ( "One MMR Vaccination" )
        or exists ( "MMR Numerator Inclusion Conditions" )
        or ( exists ( "Measles Indicators" )
            and exists ( "Mumps Indicators" )
            and exists ( "Rubella Indicators" )
        )
    )
    and ( "Has Appropriate Number of Hib Immunizations"
        or exists ( "Hib Numerator Inclusion Conditions" )
    )
    and ( exists ( "Three Hepatitis B Vaccinations" )
        or ( exists ( "Meets HepB Vaccination Requirement" )
            or exists ( "Hepatitis B Numerator Inclusion Conditions" )
        )
    )
    and ( exists ( "One Chicken Pox Vaccination" )
        or exists ( "Varicella Zoster Numerator Inclusion Conditions" )
    )
    and ( exists ( "Four Pneumococcal Conjugate Vaccinations" )
        or exists ( "Pneumococcal Conjugate Numerator Inclusion Conditions" )
    )
    and ( exists ( "One Hepatitis A Vaccinations" )
        or exists ( "Hepatitis A Numerator Inclusion Conditions" )
    )
    and ( "Has Appropriate Number of Rotavirus Immunizations"
        or exists ( "Rotavirus Numerator Inclusion Conditions" )
    )
    and ( exists ( "Two Influenza Vaccinations" )
        or ( "Two Influenza Vaccinations Including One LAIV Vaccination" )
        or exists ( "Influenza Numerator Inclusion Conditions" )
    )

define "Vaccine Administration Interval - 180 Days up to 2 Years Old":
  Interval[date from Patient.birthDate + 180 days, "Date of Second Birthday"]

define "First Two Years":
  Interval[date from Patient.birthDate, "Date of Second Birthday"]

define "Vaccine Administration Interval - 42 Days up to 2 Years Old":
  Interval[date from Patient.birthDate + 42 days, "Date of Second Birthday"]

define "Date of Second Birthday":
  Patient.birthDate + 2 years

define "Date of First Birthday":
  date from Patient.birthDate + 1 year

define "Date of First Birthday to Date of Second Birthday":
  Interval["Date of First Birthday", "Date of Second Birthday"]

define "Four DTaP Vaccinations":
  from
    "DTaP Immunizations or Procedures" DTaPVaccination1,
    "DTaP Immunizations or Procedures" DTaPVaccination2,
    "DTaP Immunizations or Procedures" DTaPVaccination3,
    "DTaP Immunizations or Procedures" DTaPVaccination4
    where DTaPVaccination2 1 day or more after day of DTaPVaccination1
      and DTaPVaccination3 1 day or more after day of DTaPVaccination2
      and DTaPVaccination4 1 day or more after day of DTaPVaccination3
    return all DTaPVaccination1 

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "DTaP Numerator Inclusion Conditions":
  ( [Condition: "Anaphylactic Reaction to DTaP Vaccine"]
    union [Condition: "Encephalitis Due to Diphtheria, Tetanus or Pertussis Vaccine"] ) DTaPConditions
    where date from start of QICoreCommon."ToPrevalenceInterval" ( DTaPConditions ) during day of "First Two Years"

define "DTaP Immunizations or Procedures":
  ( ( ( [Immunization: "DTaP Vaccine"] ).isImmunizationAdministered() ) DTaPVaccination
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( DTaPVaccination.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return all date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( DTaPVaccination.occurrence ) )
    )
      union ( ( ( [Procedure: "DTaP Vaccine Administered"] ).isProcedurePerformed() ) DTaPProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( DTaPProcedure.performed ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
          return all date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( DTaPProcedure.performed ) )
    )

define "Polio Immunizations or Procedures":
  ( ( ( [Immunization: "Inactivated Polio Vaccine (IPV)"] ).isImmunizationAdministered() ) PolioVaccination
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PolioVaccination.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PolioVaccination.occurrence ) )
    )
      union ( ( ( [Procedure: "Inactivated Polio Vaccine (IPV) Administered"] ).isProcedurePerformed() ) PolioProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PolioProcedure.performed ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PolioProcedure.performed ) )
    )

define "Three Polio Vaccinations":
  from
    "Polio Immunizations or Procedures" PolioVaccination1,
    "Polio Immunizations or Procedures" PolioVaccination2,
    "Polio Immunizations or Procedures" PolioVaccination3
    where PolioVaccination2 1 day or more after day of PolioVaccination1
      and PolioVaccination3 1 day or more after day of PolioVaccination2
    return PolioVaccination1

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Polio Numerator Inclusion Conditions":
  ( [Condition: "Anaphylaxis caused by vaccine product containing human poliovirus antigen (disorder)"] ) PolioConditions
    where date from start of QICoreCommon."ToPrevalenceInterval" ( PolioConditions ) during day of "First Two Years"

define "One MMR Vaccination":
  ( ( ( [Immunization: "Measles, Mumps and Rubella (MMR) Vaccine"] ).isImmunizationAdministered() ) MMRVaccination
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( MMRVaccination.occurrence ) ) during "Date of First Birthday to Date of Second Birthday"
    )
      union ( ( ( [Procedure: "Measles, Mumps and Rubella (MMR) Vaccine Administered"] ).isProcedurePerformed() ) MMRProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( MMRProcedure.performed ) ) during "Date of First Birthday to Date of Second Birthday"
    )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Measles Indicators":
  ( [Condition: "Measles"] ) MeaslesDiagnosis
    where date from start of QICoreCommon."ToPrevalenceInterval" ( MeaslesDiagnosis ) during day of "First Two Years"

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Mumps Indicators":
  ( [Condition: "Mumps"] ) MumpsDiagnosis
    where date from start of QICoreCommon."ToPrevalenceInterval" ( MumpsDiagnosis ) during day of "First Two Years"

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Rubella Indicators":
  ( [Condition: "Rubella"] ) RubellaDiagnosis
    where date from start of QICoreCommon."ToPrevalenceInterval" ( RubellaDiagnosis ) during day of "First Two Years"

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "MMR Numerator Inclusion Conditions":
  ( [Condition: "Anaphylaxis caused by vaccine product containing Measles morbillivirus and Mumps orthorubulavirus and Rubella virus antigens (disorder)"] ) MMRConditions
    where date from start of QICoreCommon."ToPrevalenceInterval" ( MMRConditions ) during day of "First Two Years"

define "Has Appropriate Number of Hib Immunizations":
  exists ( "All Hib Vaccinations" HibImmunization //union of 3 and 4 dose immunizations
//4 dose test
      
      
      let HasFourDose: Count("Hib 4 Dose Immunizations or Procedures") > 0
      where ( HasFourDose //if pt had at least one 4 dose code
          
          and Count(distinct("All Hib Vaccinations" HibVaccinations
                return HibVaccinations
            )
          ) >= 4 //pt must have 4 regimens (e.g., 3,3,4,4 or 4,3,4,4)
      
      )
        or ( HasFourDose is false //if pt did not have at least one 4 dose code
            
            and Count(distinct("All Hib Vaccinations" HibVaccinations
                  return HibVaccinations
              )
            ) >= 3 //pt must have 3 regimens of 3 dose codes
        
        )
  )

define "All Hib Vaccinations":
  "Hib 3 or 4 Dose Immunizations" AllHibDoses1
    without "Hib 3 or 4 Dose Immunizations" AllHibDoses2
      such that AllHibDoses1 less than 1 day before AllHibDoses2

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Hib Numerator Inclusion Conditions":
  ( [Condition: "Anaphylaxis due to Haemophilus influenzae type b vaccine (disorder)"] ) HibReaction
    where date from start of QICoreCommon."ToPrevalenceInterval" ( HibReaction ) during day of "First Two Years"

define "Hib 3 Dose Immunizations or Procedures":
  ( ( ( [Immunization: "Hib Vaccine (3 dose schedule)"] ).isImmunizationAdministered() ) ThreeDoseHibVaccine
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseHibVaccine.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseHibVaccine.occurrence ) )
    )
      union ( ( ( [Procedure: "Hib Vaccine (3 dose schedule) Administered"] ).isProcedurePerformed() ) ThreeDoseHibProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseHibProcedure.performed ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseHibProcedure.performed ) )
    )

define "Hib 3 or 4 Dose Immunizations":
  "Hib 3 Dose Immunizations or Procedures"
    union "Hib 4 Dose Immunizations or Procedures"

define "Hib 4 Dose Immunizations or Procedures":
  ( ( ( [Immunization: "Hib Vaccine (4 dose schedule)"] ).isImmunizationAdministered() ) HibVaccine
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HibVaccine.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HibVaccine.occurrence ) )
    )
      union ( ( ( [Procedure: "Hib Vaccine (4 dose schedule) Administered"] ).isProcedurePerformed() ) HibProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HibProcedure.performed ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HibProcedure.performed ) )
    )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Hepatitis B Numerator Inclusion Conditions":
    ( [Condition: "Anaphylaxis due to Hepatitis B vaccine (disorder)"]
        union [Condition: "Hepatitis B"] ) HepBConditions
            where date from start of QICoreCommon."ToPrevalenceInterval" ( HepBConditions ) during day of "First Two Years"

define "Three Hepatitis B Vaccinations":
  from
    "Hepatitis B Immunizations or Procedures" HepatitisBVaccination1,
    "Hepatitis B Immunizations or Procedures" HepatitisBVaccination2,
    "Hepatitis B Immunizations or Procedures" HepatitisBVaccination3
    where HepatitisBVaccination2 1 day or more after day of HepatitisBVaccination1
      and HepatitisBVaccination3 1 day or more after day of HepatitisBVaccination2
    return HepatitisBVaccination1

define "Hepatitis B Immunizations or Procedures":
  ( ( ( [Immunization: "Hepatitis B Vaccine"] ).isImmunizationAdministered() ) HepatitisBVaccination
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HepatitisBVaccination.occurrence ) ) during day of "First Two Years"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HepatitisBVaccination.occurrence ) )
    )
      union ( ( ( [Procedure: "Hepatitis B Vaccine Administered"] ).isProcedurePerformed() ) HepatitisBProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HepatitisBProcedure.performed ) ) during day of "First Two Years"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HepatitisBProcedure.performed ) )
    )

define "Meets HepB Vaccination Requirement":
  from
    "Hepatitis B Immunizations or Procedures" HepatitisBVaccination1,
    "Hepatitis B Immunizations or Procedures" HepatitisBVaccination2,
    "NewBorn Vaccine Requirement" NewBornVaccine3
    where HepatitisBVaccination2 1 day or more after day of HepatitisBVaccination1
      and HepatitisBVaccination1 1 day or more after day of NewBornVaccine3
      and HepatitisBVaccination2 1 day or more after day of NewBornVaccine3
    return HepatitisBVaccination1

define "NewBorn Vaccine Requirement":
  ( ( [Procedure: "Introduction of Serum, Toxoid and Vaccine into Muscle, Percutaneous Approach"] ).isProcedurePerformed() ) NewBornVaccine
    where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( NewBornVaccine.performed ) ) during day of Interval[date from Patient.birthDate, date from Patient.birthDate + 7 days]
    return date from start of QICoreCommon."ToInterval" ( NewBornVaccine.performed )

define "One Chicken Pox Vaccination":
  ( ( ( [Immunization: "Varicella Zoster Vaccine (VZV)"] ).isImmunizationAdministered() ) ChickenPoxVaccination
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ChickenPoxVaccination.occurrence ) ) during "Date of First Birthday to Date of Second Birthday"
    )
      union ( ( ( [Procedure: "Varicella Zoster Vaccine (VZV) Administered"] ).isProcedurePerformed() ) ChickenPoxProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ChickenPoxProcedure.performed ) ) during "Date of First Birthday to Date of Second Birthday"
    )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Varicella Zoster Numerator Inclusion Conditions":
  ( [Condition: "Varicella Zoster"]
    union [Condition: "Anaphylaxis caused by vaccine containing Human alphaherpesvirus 3 antigen (disorder)"] ) VaricellaZoster
    where date from start of QICoreCommon."ToPrevalenceInterval" ( VaricellaZoster ) during day of "First Two Years"

define "Four Pneumococcal Conjugate Vaccinations":
  from
    "Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination1,
    "Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination2,
    "Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination3,
    "Pneumococcal Conjugate Immunizations or Procedures" PneumococcalVaccination4
    where PneumococcalVaccination2 1 day or more after day of PneumococcalVaccination1
      and PneumococcalVaccination3 1 day or more after day of PneumococcalVaccination2
      and PneumococcalVaccination4 1 day or more after day of PneumococcalVaccination3
    return PneumococcalVaccination1

define "Pneumococcal Conjugate Immunizations or Procedures":
  ( ( ( [Immunization: "Pneumococcal Conjugate Vaccine"] ).isImmunizationAdministered() ) PneumococcalVaccination
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PneumococcalVaccination.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PneumococcalVaccination.occurrence ) )
    )
      union ( ( ( [Procedure: "Pneumococcal Conjugate Vaccine Administered"] ).isProcedurePerformed() ) PneumococcalProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PneumococcalProcedure.performed ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( PneumococcalProcedure.performed ) )
    )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Pneumococcal Conjugate Numerator Inclusion Conditions":
  ( [Condition: "Anaphylaxis caused by vaccine product containing Streptococcus pneumoniae antigen (disorder)"] ) PneumococcalReaction
    where date from start of QICoreCommon."ToPrevalenceInterval" ( PneumococcalReaction ) during day of "First Two Years"

define "One Hepatitis A Vaccinations":
  ( ( ( [Immunization: "Hepatitis A Vaccine"] ).isImmunizationAdministered() ) HepatitisAVaccination
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HepatitisAVaccination.occurrence ) ) during "Date of First Birthday to Date of Second Birthday"
    )
      union ( ( ( [Procedure: "Hepatitis A Vaccine Administered"] ).isProcedurePerformed() ) HepatitisAProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( HepatitisAProcedure.performed ) ) during "Date of First Birthday to Date of Second Birthday"
    )

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Hepatitis A Numerator Inclusion Conditions":
  ( [Condition: "Hepatitis A"]
    union [Condition: "Anaphylaxis caused by vaccine product containing Hepatitis A virus antigen (disorder)"] ) HepatitisADiagnosis
    where date from start of QICoreCommon."ToPrevalenceInterval" ( HepatitisADiagnosis ) during day of "First Two Years"

define "Has Appropriate Number of Rotavirus Immunizations":
  exists ( "All Rotavirus Vaccinations" RotavirusImmunization
      let HasThreeDose: Count("Rotavirus 3 Dose Immunizations or Procedures") > 0
      where ( HasThreeDose
          and Count(distinct("All Rotavirus Vaccinations" RotavirusVaccinations
                return RotavirusVaccinations
            )
          ) >= 3
      )
        or ( HasThreeDose is false
            and Count(distinct("All Rotavirus Vaccinations" RotavirusVaccinations
                  return RotavirusVaccinations
              )
            ) >= 2
        )
  )

define "All Rotavirus Vaccinations":
  "Rotavirus 2 or 3 Dose Immunizations" AllRotavirusDoses1
    without "Rotavirus 2 or 3 Dose Immunizations" AllRotavirusDoses2
      such that AllRotavirusDoses1 less than 1 day before AllRotavirusDoses2

define "Rotavirus 2 Dose Immunizations or Procedures":
  ( ( ( [Immunization: "rotavirus, live, monovalent vaccine"] ).isImmunizationAdministered() ) TwoDoseRotavirusVaccine
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( TwoDoseRotavirusVaccine.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( TwoDoseRotavirusVaccine.occurrence ) )
    )
      union ( ( ( [Procedure: "Rotavirus Vaccine (2 dose schedule) Administered"] ).isProcedurePerformed() ) TwoDoseRotavirusProcedure
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( TwoDoseRotavirusProcedure.performed ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( TwoDoseRotavirusProcedure.performed ) )
    )

define "Rotavirus 2 or 3 Dose Immunizations":
  "Rotavirus 2 Dose Immunizations or Procedures"
    union "Rotavirus 3 Dose Immunizations or Procedures"

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Rotavirus Numerator Inclusion Conditions":
  ( ( [Condition: "Anaphylaxis due to rotavirus vaccine (disorder)"] ) RotavirusConditions
      where date from start of QICoreCommon."ToPrevalenceInterval" ( RotavirusConditions ) during day of "First Two Years"
  )

define "Rotavirus 3 Dose Immunizations or Procedures":
  ( ( ( [Immunization: "Rotavirus Vaccine (3 dose schedule)"] ).isImmunizationAdministered() ) ThreeDoseRotavirusVaccine
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseRotavirusVaccine.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseRotavirusVaccine.occurrence ) )
    )
      union ( ( ( [Procedure: "Rotavirus Vaccine (3 dose schedule) Administered"] ).isProcedurePerformed() ) ThreeDoseRotavirusAdministered
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseRotavirusAdministered.performed ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( ThreeDoseRotavirusAdministered.performed ) )
    )

define "Influenza Immunizations or Procedures":
  ( ( ( [Immunization: "Child Influenza Immunization Administered"] ).isImmunizationAdministered() ) InfluenzaVaccine
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( InfluenzaVaccine.occurrence ) ) during day of "Vaccine Administration Interval - 42 Days up to 2 Years Old"
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( InfluenzaVaccine.occurrence ) )
    )
      union ( ( ( [Procedure: "Child Influenza Vaccine Administered"] ).isProcedurePerformed() ) InfluenzaAdministration
          where QICoreCommon."ToInterval" ( InfluenzaAdministration.performed ) during day of "Vaccine Administration Interval - 180 Days up to 2 Years Old"
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( InfluenzaAdministration.performed ) )
    )

define "Two Influenza Vaccinations":
  from
    "Influenza Immunizations or Procedures" FluVaccination1,
    "Influenza Immunizations or Procedures" FluVaccination2
    where FluVaccination2 1 day or more after day of FluVaccination1
    return FluVaccination1

//@MADiE export includes 'Status."Active Condition"([Condition])' but Status library currently in this repo doesn't include "Active Condition"
define "Influenza Numerator Inclusion Conditions":
  ( [Condition: "Anaphylaxis caused by vaccine product containing Influenza virus antigen (disorder)"] ) InfluenzaConditions
    where date from start of QICoreCommon."ToPrevalenceInterval" ( InfluenzaConditions ) during day of "First Two Years"

define "Two Influenza Vaccinations Including One LAIV Vaccination":
  exists "LAIV Vaccinations"
    and exists "Influenza Immunizations or Procedures"

define "LAIV Vaccinations":
  ( ( ( [Immunization: "Influenza Virus LAIV Immunization"] ).isImmunizationAdministered() ) LAIVVaccine
        where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( LAIVVaccine.occurrence ) ) during day of Interval["Date of Second Birthday", "Date of Second Birthday"]
        return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( LAIVVaccine.occurrence ) )
    )
      union ( ( ( [Procedure: "Influenza Virus LAIV Procedure"] ).isProcedurePerformed() ) InfluenzaAdministration
          where CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( InfluenzaAdministration.performed ) ) during day of Interval["Date of Second Birthday", "Date of Second Birthday"]
          return date from start of CQMCommon."ToDateInterval" ( QICoreCommon."ToInterval" ( InfluenzaAdministration.performed ) )
    )

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
  SDE."SDE Sex"