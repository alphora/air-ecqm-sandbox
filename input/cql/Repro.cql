library Repro

using FHIR version '4.0.1'

include FHIRHelpers version '4.4.000' called FHIRHelpers

context Patient

define "Aliased":
  [MedicationRequest] AdolescentMed union [Procedure] AdolescentFollowUp

/*  Error: incorectly returns empty set */
define "Error Not-Aliased":
  ([MedicationRequest]) union ([Procedure])

/* Error: Ambiguous call to operator 'ToDateTime(null)' in library 'FHIRHelpers'. */
define "Error":
  "Aliased" MedicationRequestOrProcedure
    return Coalesce(
        start of ToInterval(MedicationRequestOrProcedure.performed), // .performed is only in Procedure
        MedicationRequestOrProcedure.authoredOn // .authoredOn is only in MedicationRequest
    )

define function ToInterval(choice Choice<DateTime, Quantity, Interval<DateTime>, Interval<Quantity>, Timing>):
  case
	  when choice is DateTime then
    	  Interval[choice as DateTime, choice as DateTime]
		when choice is Interval<DateTime> then
  		   choice as Interval<DateTime>
		when choice is Quantity then
		  Interval[Patient.birthDate + (choice as Quantity),
			  Patient.birthDate + (choice as Quantity) + 1 year)
		when choice is Interval<Quantity> then
		  Interval[Patient.birthDate + (choice.low as Quantity),
			  Patient.birthDate + (choice.high as Quantity) + 1 year)
		when choice is Timing then
          Message(null, true, 'NOT_IMPLEMENTED', 'Error', 'Calculation of an interval from a Timing value is not supported') as Interval<DateTime>
		else
		  null as Interval<DateTime>
	end