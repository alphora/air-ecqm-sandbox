library Status version '1.8.000'

using QICore version '6.0.0'
using USCore version '6.1.0'

include FHIRHelpers version '4.4.000' called FHIRHelpers

codesystem "ObservationCategoryCodes": 'http://terminology.hl7.org/CodeSystem/observation-category'

code "laboratory": 'laboratory' from "ObservationCategoryCodes" display 'laboratory'
code "exam": 'exam' from "ObservationCategoryCodes" display 'exam'
code "survey": 'survey' from "ObservationCategoryCodes" display 'survey'

context Patient

<<<<<<< HEAD
//Outdated: "This library contains functions that are based on QDM 5.6 to QICore 4.1.1 March 2023 (https://github.com/cqframework/CQL-Formatting-and-Usage-Wiki/wiki/Authoring-Patterns---QICore-v4.1.1). The functions may appear similar to some QICoreCommon functions but different in that they have constraints that are relevant for measures authored by NCQA."

//Assessment, Performed
define function "Final Survey Observation"(Obs List<"ObservationScreeningAssessment">):
  isAssessmentPerformed()

define fluent function isAssessmentPerformed(Obs List<"ObservationScreeningAssessment">):
=======
//This library contains functions that are based on QDM 5.6 to QICore 4.1.1 March 2023 (https://github.com/cqframework/CQL-Formatting-and-Usage-Wiki/wiki/Authoring-Patterns---QICore-v4.1.1). The functions may appear similar to some QICoreCommon functions but different in that they have constraints that are relevant for measures authored by NCQA.

//Assessment, Performed
define fluent function isAssessmentPerformed(Obs List<Choice<"SimpleObservation", 
"LaboratoryResultObservation", 
"ObservationClinicalResult",
"ObservationScreeningAssessment",
"NonPatientObservation", 
"ObservationCancelled">>):
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
  Obs O
    where O.status in { 'final', 'amended', 'corrected' }
          and exists ( O.category ObservationCategory
          where ( ObservationCategory ) ~ "survey"
      )
<<<<<<< HEAD

//Diagnosis
define function "Active Condition"(Condition List<Choice<"ConditionProblemsHealthConcerns", "ConditionEncounterDiagnosis">>):
  Condition C
    where C.clinicalStatus ~ "active"

//Similar but different from QICoreCommon.isActive, which has recurrence and relapse as additional constraints
define fluent function isActiveOnly(Condition List<Choice<"ConditionProblemsHealthConcerns", "ConditionEncounterDiagnosis">>):
  Condition C 
  where C.clinicalStatus ~ "active"

//Device, Order - Personal Use Devices: active and completed only
define function "Completed or Ongoing Device Request"(DeviceRequest List<DeviceRequest>):
  isDeviceOrder()

=======

//Device, Order - Personal Use Devices: active and completed only
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isDeviceOrder(DeviceRequest List<DeviceRequest>):
  DeviceRequest D
    where D.status in { 'active', 'completed' }
      and D.intent = 'order'

//Diagnostic Study, Order: active and completed only
<<<<<<< HEAD
define function "Completed or Ongoing Service Request"(ServiceRequest List<ServiceRequest>):
  ServiceRequest S
    where S.status in { 'active', 'completed' }
      and S.intent = 'order'

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isDiagnosticStudyOrder(ServiceRequest List<ServiceRequest>):
  ServiceRequest S
    where S.status in { 'active', 'completed' }
      and S.intent = 'order'
      
//Intervention, Order: active and completed only    
define fluent function isInterventionOrder(ServiceRequest List<ServiceRequest>):
  ServiceRequest S
    where S.status in { 'active', 'completed' }
      and S.intent = 'order'    

//Laboratory Test, Order: active and completed only
define fluent function isLaboratoryTestOrder(ServiceRequest List<ServiceRequest>):
  ServiceRequest S
    where S.status in { 'active', 'completed' }
      and S.intent = 'order'        

//Diagnostic Study, Performed
<<<<<<< HEAD
define function "Final Observation"(Obs List<Choice<"SimpleObservation",
"NonPatientObservation",
"LaboratoryResultObservation",
"ObservationClinicalResult", 
"ObservationScreeningAssessment">>):
  isDiagnosticStudyPerformed()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isDiagnosticStudyPerformed(Obs List<Choice<"SimpleObservation", 
"LaboratoryResultObservation", 
"ObservationClinicalResult",
"ObservationScreeningAssessment",
<<<<<<< HEAD
"NonPatientObservation">>):
=======
"NonPatientObservation", 
"ObservationCancelled">>):
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
  Obs O
    where O.status in {'final', 'amended', 'corrected' }
    
//Encounter, Performed
//General usage unless required otherwise by measure intent (e.g., follow-up encounters)
<<<<<<< HEAD
define function "Finished Encounter"(Enc List<Encounter>):
  isEncounterPerformed()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isEncounterPerformed(Enc List<Encounter>):
  Enc E
    where E.status in {'finished', 'arrived', 'triaged', 'in-progress', 'onleave'}

//Immunization, Administered: completed only
<<<<<<< HEAD
define function "Completed Immunization"(Immunization List<Immunization>):
  isImmunizationAdministered()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isImmunizationAdministered(Immunization List<Immunization>):
  Immunization I
    where I.status ~ 'completed'

//Intervention, Performed
define fluent function isInterventionPerformed(Proc List<Procedure>):
  Proc P
    where P.status ~ 'completed'

//Procedure, Performed
<<<<<<< HEAD
define function "Completed Procedure"(Proc List<Procedure>):
  isProcedurePerformed()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isProcedurePerformed(Proc List<Procedure>):
  Proc P
    where P.status ~ 'completed'

//Laboratory Test, Performed
define fluent function isLaboratoryTestPerformed(Obs List<Choice<"SimpleObservation", 
"LaboratoryResultObservation", 
"ObservationClinicalResult",
"ObservationScreeningAssessment",
"NonPatientObservation", 
"ObservationCancelled">>):
  Obs O
    where O.status in { 'final', 'amended', 'corrected' }
      and exists ( O.category ObservationCategory
          where ( ObservationCategory ) ~ "laboratory"
      )

//Medication, Active
<<<<<<< HEAD
define function "Active Medication"(MedicationRequest List<MedicationRequest>):
  isMedicationActive()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isMedicationActive(MedicationRequest List<MedicationRequest>):
  MedicationRequest M
    where M.status = 'active'
      and M.intent = 'order'

//Medication, Dispensed
<<<<<<< HEAD
define function "Dispensed Medication"(Med List<MedicationDispense>):
  isMedicationDispensed()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isMedicationDispensed(Med List<MedicationDispense>):
  Med M
    where M.status in { 'completed', 'in-progress', 'on-hold' }

//Medication, Order: active and completed only
<<<<<<< HEAD
define function "Active or Completed Medication Request"(MedicationRequest List<MedicationRequest>):
  isMedicationOrder()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isMedicationOrder(MedicationRequest List<MedicationRequest>):
  MedicationRequest M
    where M.status in { 'active', 'completed' }
      and M.intent = 'order'

//Physical Exam, Performed
<<<<<<< HEAD
define fluent function isPhysicalExamPerformed(Obs List<Choice<"SimpleObservation", "ObservationClinicalResult">>):
=======
define fluent function isPhysicalExamPerformed(Obs List<Choice<"SimpleObservation", 
"LaboratoryResultObservation", 
"ObservationClinicalResult",
"ObservationScreeningAssessment",
"NonPatientObservation", 
"ObservationCancelled">>):
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
  Obs O
    where O.status in { 'final', 'amended', 'corrected' }
      and exists ( O.category ObservationCategory
          where ( ObservationCategory ) ~ "exam"
      )

//Observation Vital Signs
define fluent function isObservationBP(Obs List<"USCoreBloodPressureProfile">):
  Obs O
    where O.status in { 'final', 'amended', 'corrected' }
      
define fluent function isObservationBodyHeight(Obs List<"USCoreBodyHeightProfile">):
  Obs O
    where O.status in { 'final', 'amended', 'corrected' }
      
define fluent function isObservationBodyWeight(Obs List<"USCoreBodyWeightProfile">):
  Obs O
    where O.status in { 'final', 'amended', 'corrected' }
      
define fluent function isObservationBMI(Obs List<"USCoreBMIProfile">):
  Obs O
    where O.status in { 'final', 'amended', 'corrected' }

//Symptom
<<<<<<< HEAD
define function "Initial or Final Observation"(Obs List<Choice<"SimpleObservation", 
"LaboratoryResultObservation", 
"ObservationClinicalResult",
"ObservationScreeningAssessment">>):
  isSymptom()

=======
>>>>>>> 5611a53e3074014b54f887f824ca460ba1daa0c8
define fluent function isSymptom(Obs List<Choice<"SimpleObservation", 
"LaboratoryResultObservation", 
"ObservationClinicalResult",
"ObservationScreeningAssessment",
"NonPatientObservation", 
"ObservationCancelled">>):
  Obs O
    where O.status in { 'preliminary', 'final', 'amended', 'corrected' }