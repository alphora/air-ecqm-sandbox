library FootAssessmentAndFollowUp version '0.0.000'

using QICore version '6.0.0'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include SupplementalDataElements version '5.0.000' called SDE
include QICoreCommonSTU6Prototype version '0.1.000' called QICoreCommon
include HospiceSTU6Prototype version '0.1.000' called Hospice
include StatusSTU6Prototype version '0.5.000' called Status

codesystem "SNOMEDCT": 'http://snomed.info/sct'

valueset "Diabetes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001'
valueset "Annual Wellness Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1240'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Office Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1001'
valueset "Preventive Services Established": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1025'
valueset "Preventive Services Initial": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1023'
valueset "Telemedicine Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.276'
valueset "Telephone Visits": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1080'
valueset "Virtual Encounter": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.101.12.1089'
valueset "Acquired Absence Bilateral Feet": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.278'
valueset "Acquired Absence of Left Foot": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.281'
valueset "Acquired Absence of Right Foot": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.284'
valueset "Amputation of Bilateral Feet": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.287'
valueset "Amputation of Left Foot": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.291'
valueset "Amputation of Right Foot": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.294'
valueset "Amputation of Unspecified Foot": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.295'
valueset "10-g Monofilament Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.296'
valueset "Pinprick Sensation Test and Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.347'
valueset "Vibration Test - 128-Hz tuning fork": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.297'
valueset "Ipswich Touch Test and Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.348'
valueset "Temperature Discrimination Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.300'
valueset "Pedal Pulse Palpation Test": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.304'
valueset "Lower Extremity Visual Exam": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.305'
valueset "Foot Care Education": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.327'
valueset "Monofilament Test Abnormal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.328'
valueset "Pinprick Test Abnormal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.329'
valueset "Vibration Test Abnormal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.330'
valueset "Ipswich Test Abnormal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.333'
valueset "Temperature Test Abnormal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.334'
valueset "Pedal Pulse Abnormal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.337'
valueset "Foot Callus": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.306'
valueset "Foot Deformity": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.309'
valueset "Foot Ulcer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.317'
valueset "Monofilament Test Normal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.338'
valueset "Pinprick Test Normal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.339'
valueset "Vibration Test Normal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.340'
valueset "Ipswich Test Normal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.341'
valueset "Temperature Test Normal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.342'
valueset "Pedal Pulse Normal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.345'
valueset "Visual Exam Normal Finding": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.346'
valueset "Referral for Foot Care": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.313'
valueset "Offloading Interventions": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.321'
valueset "Offloading Devices": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.322'
valueset "Therapeutic Footwear Interventions": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.323'
valueset "Therapeutic Footwear": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.324'
valueset "Order for Follow Up Visit (within 12 months)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1248.326'

code "Right (qualifier value)": '24028007' from "SNOMEDCT" display 'Right (qualifier value)'
code "Left (qualifier value)": '7771000' from "SNOMEDCT" display 'Left (qualifier value)'
code "Right and left (qualifier value)": '51440002' from "SNOMEDCT" display 'Right and left (qualifier value)'

parameter "Measurement Period" default Interval[@2025-01-01T00:00:00.000, @2026-01-01T00:00:00.000)

context Patient

define "Initial Population":
    AgeInYearsAt(date from start of "Measurement Period") >= 18
        and exists ([ConditionProblemsHealthConcerns: "Diabetes"] DiabetesDiagnosis
            where QICoreCommon.ToPrevalenceInterval(DiabetesDiagnosis) overlaps "Measurement Period")
        and exists "Qualifying Encounters"

define "Denominator":
    "Initial Population"

define "Qualifying Encounters":
  ([Encounter: "Annual Wellness Visit"]
    union [Encounter: "Encounter Inpatient"]
    union [Encounter: "Office Visit"]
    union [Encounter: "Preventive Services Established"]
    union [Encounter: "Preventive Services Initial"]
    union [Encounter: "Telemedicine Services"]
    union [Encounter: "Telephone Visits"]
    union [Encounter: "Virtual Encounter"]) QualifyingEncounter
        where QualifyingEncounter.status in {'finished', 'arrived', 'triaged', 'in-progress', 'onleave'}
            and QualifyingEncounter.period during day of "Measurement Period"

define "Denominator Exclusions":
    "Has Bilateral Lower Extremity Amputation at the Foot or Above"
    or Hospice."Has Hospice Services"

define "Has Bilateral Lower Extremity Amputation at the Foot or Above":
    exists ([ConditionProblemsHealthConcerns] C
        where (
            C.code in "Acquired Absence Bilateral Feet"
            or (C.code in "Acquired Absence of Left Foot" and C.code in "Acquired Absence of Right Foot")
        )
            and QICoreCommon.ToPrevalenceInterval(C) before "Measurement Period"
    )
    or exists ([Procedure] P
        where (
            P.code in "Amputation of Bilateral Feet"
            or (P.code in "Amputation of Left Foot" 
                and exists ([Procedure] Procedure2
                    where Procedure2.code in "Amputation of Right Foot")
            )
            or (P.code in "Amputation of Unspecified Foot"
                and exists (P.bodySite B
                    where B.display = 'Right and left (qualifier value)'
                        or (B.display = 'Right (qualifier value)'
                            and B.display = 'Left (qualifier value)')
                )
            )
        )
            and P.status ~ 'completed'
            and end of P.performed.toInterval() before start of "Measurement Period"
    )
                
define "Numerator":
    ("Has At Least Two Normal Neurological Exam Findings of Lower Extremity"
        and "Has a Normal Vascular Exam Finding of Lower Extremity"
        and "Has a Normal Visual Inspection of Lower Extremity"
        and "Received Foot Care Education"
    ) 
    or 
    ("Has Abnormal Exam Finding of Lower Extremity"
        and "Has Follow-Up Plan of Care Within One Week of Eligible Encounter"
    )

define "Qualifying Normal Neurological Exam Findings":
    ([ObservationClinicalResult: "Monofilament Test Normal Finding"]
        union [ObservationClinicalResult: "Pinprick Test Normal Finding"]
        union [ObservationClinicalResult: "Vibration Test Normal Finding"]
        union [ObservationClinicalResult: "Ipswich Test Normal Finding"]
        union [ObservationClinicalResult: "Temperature Test Normal Finding"]
    ) NormalNeurologicalExam
        where NormalNeurologicalExam.status in { 'final', 'amended', 'corrected' }
            and NormalNeurologicalExam.effective.toInterval() overlaps "Measurement Period"

define "Has At Least Two Normal Neurological Exam Findings of Lower Extremity":
    Count("Qualifying Normal Neurological Exam Findings") >= 2
        and exists ("Qualifying Normal Neurological Exam Findings" NeurologicalExamType1
            where exists ("Qualifying Normal Neurological Exam Findings" NeurologicalExamType2
                where NeurologicalExamType1.code != NeurologicalExamType2.code)
        )

define "Has a Normal Vascular Exam Finding of Lower Extremity":
    exists ([ObservationClinicalResult: "Pedal Pulse Normal Finding"]) NormalVascularExam
        where NormalVascularExam.status in { 'final', 'amended', 'corrected' }
            and NormalVascularExam.effective.toInterval() overlaps "Measurement Period"

define "Has a Normal Visual Inspection of Lower Extremity":
    exists ([ObservationClinicalResult: "Visual Exam Normal Finding"]) NormalVisualExam
        where NormalVisualExam.status in { 'final', 'amended', 'corrected' }
            and NormalVisualExam.effective.toInterval() overlaps "Measurement Period"
    
define "Received Foot Care Education":
    exists ([Procedure: "Foot Care Education"]) FootCareEducation
        where FootCareEducation.status ~ 'completed'
            and FootCareEducation.performed.toInterval() overlaps "Measurement Period"

define "Has Abnormal Exam Finding of Lower Extremity":
    exists (([ObservationClinicalResult: "Monofilament Test Abnormal Finding"]
        union [ObservationClinicalResult: "Pinprick Test Abnormal Finding"]
        union [ObservationClinicalResult: "Vibration Test Abnormal Finding"]
        union [ObservationClinicalResult: "Ipswich Test Abnormal Finding"]
        union [ObservationClinicalResult: "Temperature Test Abnormal Finding"]
        union [ObservationClinicalResult: "Pedal Pulse Abnormal Finding"]) AbnormalObservation
        where AbnormalObservation.status in { 'final', 'amended', 'corrected' }
            and AbnormalObservation.effective.toInterval() overlaps "Measurement Period"
    )
    or exists (([ConditionEncounterDiagnosis: "Foot Callus"]
        union [ConditionEncounterDiagnosis: "Foot Deformity"]
        union [ConditionEncounterDiagnosis: "Foot Ulcer"]) AbnormalCondition
        where AbnormalCondition.isActive()
        and AbnormalCondition.onset.toInterval() overlaps "Measurement Period"   
    )

define "Has Follow-Up Plan of Care Within One Week of Eligible Encounter":
    exists ( 
        (([Procedure: "Offloading Interventions"] 
            union [Procedure: "Therapeutic Footwear Interventions"]) FollowUpProcedure
                where FollowUpProcedure.status ~ 'completed'
                    and FollowUpProcedure.performed.toInterval() during "Seven-Day Period Following Qualifying Encounter"
        )
        union (([ServiceRequest: "Referral for Foot Care"]
            union [ServiceRequest: "Order for Follow Up Visit (within 12 months)"]) FollowUpServiceRequest
                where FollowUpServiceRequest.status in { 'active', 'completed' }
                    and FollowUpServiceRequest.intent = 'order'
                    and FollowUpServiceRequest.authoredOn.toInterval() during "Seven-Day Period Following Qualifying Encounter"
        )
        union (([DeviceRequest: "Offloading Devices"]
            union [DeviceRequest: "Therapeutic Footwear"]) FollowUpDeviceRequest
                where FollowUpDeviceRequest.status in { 'active', 'completed' }
                    and FollowUpDeviceRequest.intent = 'order'
                    and FollowUpDeviceRequest.authoredOn.toInterval() during "Seven-Day Period Following Qualifying Encounter"
        )
    )

define "Seven-Day Period Following Qualifying Encounter":
    "Qualifying Encounters" E 
    return Interval[start of E.period, end of E.period + 7 days]

define "SDE Ethnicity":
  SDE."SDE Ethnicity"

define "SDE Payer":
  SDE."SDE Payer"

define "SDE Race":
  SDE."SDE Race"

define "SDE Sex":
  SDE."SDE Sex"