//@QICore6: Update Library and Measure resources - Condition to ConditionProblemsHealthConcerns

library Antibiotic version '1.6.000'

using QICore version '6.0.0'

include FHIRHelpers version '4.4.000' called FHIRHelpers
include QICoreCommon version '2.1.000' called QICoreCommon

parameter "Measurement Period" Interval<DateTime>

context Patient

//@QICore6: Update list of Conditions to a list of choices of ConditionProblemsHealthConcerns and ConditionEncounterDiagnosis
define function "Has Comorbid Condition History"(episodeDate List<Encounter>, comorbidConditions List<Condition>):
  episodeDate eDate
      with comorbidConditions comcondition
        such that date from start of (  comcondition.prevalenceInterval() ) during Interval[date from start of eDate.period.toInterval() - 1 year, date from start of eDate.period.toInterval()]
      return eDate

//@QICore6: Update list of Conditions to a list of choices of ConditionProblemsHealthConcerns and ConditionEncounterDiagnosis
define function "Has Competing Diagnosis History"(episodeDate List<Encounter>, competingConditions List<Condition>):
  episodeDate eDate
      with competingConditions competcondition
        such that ( competcondition.prevalenceInterval() ) starts 3 days or less on or after day of start of eDate.period
      return eDate

define function "Has Antibiotic Medication History"(episodeDate List<Encounter>, antibioticMedications List<MedicationRequest>):
   episodeDate DateOfEpisode
    with antibioticMedications ActiveMedication
      such that exists ( ActiveMedication.dosageInstruction.timing T
          where (  T.repeat.bounds.toInterval() ) overlaps day of Interval[date from start of DateOfEpisode.period.toInterval()  - 30 days, date from start of DateOfEpisode.period.toInterval() - 1 day]
      )