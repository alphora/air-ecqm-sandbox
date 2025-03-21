#!/bin/bash
#DO NOT EDIT WITH WINDOWS

usage () {
    cat <<HELP_USAGE

    $0  [-d] [-s <fhir_base_url>] [-u]

   Refreshes FHIR documents in place. Optionally loads resources to a FHIR server.

   -h  Print this help
   -d  Use default Alphora FHIR sandbox.  Mutually exclusive with -s.
   -s  Use specificed fhir base url like http://localhost:8080/fhir/.  Mutually exclusive with -d.
   -u  Unattended mode.  Defaults to false.
HELP_USAGE
	exit 0
}

tooling_jar=tooling-cli-3.1.0.jar
input_cache_path=./input-cache
ig_resource_path=./input/dtr-content-r4.xml
unattended=false

while getopts hds:u flag
do
    case "${flag}" in
		d) server_url="https://cloud.alphora.com/sandbox/r4/cqm/fhir/";; 
		h) usage;;
        s) server_url=${OPTARG};;
		u) unattended=true;;
    esac
done

fsoption=""
if [ ! -z "${server_url}" ]; then
	fsoption="-fs ${server_url}"
fi

set -e

if [ -z "${server_url}" ]; then
	echo "No FHIR server specified.  Resources will not be loaded."
else
	echo "Resources will be loaded to FHIR server: ${server_url}."
fi

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	echo "running: java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=... -bid=..."
	# Individual resource bundles
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources/activitydefinition -bid=dtr-activitydefinition
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources/library -bid=dtr-library
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources/PlanDefinitions -bid=dtr-plandefinition
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources/structuredefinition -bid=dtr-structuredefinition
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/vocabulary/codesystem -bid=dtr-codesystem
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/vocabulary/valueset -bid=dtr-valueset
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources/organization -bid=dtr-organization
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources/documentresource -bid=dtr-documentresource
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources/binary -bid=dtr-binary
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/tests/library -bid=dtr-tests

	# All resource bundle
	java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/resources -bid=dtr-resources
	# All test-data bundle
	# java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/tests/library -bid=dtr-tests
	# All vocabulary bundle
    java -jar $tooling -BundleResources -v=r4 -e=json -op=bundles -ptd=input/vocabulary -bid=dtr-vocabulary
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		echo "running: java -jar $tooling -RefreshIG -ini=$PWD/ig.ini -t -d -p $fsoption -rp input/cql"
		java -jar $tooling -RefreshIG -ini="$PWD"/ig.ini -t -d -p $fsoption -rp input/cql
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi

if [ "$unattended" = false ] ; then
	read -p "Press any key to resume ..."
fi