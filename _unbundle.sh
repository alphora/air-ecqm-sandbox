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
measures_dir=./input/tests/measure
output_base_dir=./input/tests/measure

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
# if test -f "$tooling"; then
# 	echo "running: java -jar $tooling -BundleToResources"
# 	java -jar $tooling -BundleToResources -p=/Users/sarapark/Documents/GitHub/air-ecqm-sandbox/input/tests/measure -e=json -op=/Users/sarapark/Documents/GitHub/air-ecqm-sandbox/input/tests/measure
# else
# 	tooling=../$tooling_jar
# 	echo $tooling
# 	if test -f "$tooling"; then
# 		echo "running: java -jar $tooling -BundleToResources"
# 		java -jar $tooling -BundleToResources -p=/Users/sarapark/Documents/GitHub/air-ecqm-sandbox/input/tests/measure -e=json -op=/Users/sarapark/Documents/GitHub/air-ecqm-sandbox/input/tests/measure
# 		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
# 	fi
# fi

for measure in "$measures_dir"/*; do
  if [ -d "$measure" ]; then
    echo "Processing measure: $measure"
    measure_name=$(basename "$measure")

	for test_case in "$measure"/*; do
      if [ -d "$test_case" ]; then
        test_case_name=$(basename "$test_case")
        echo "Processing test case: $test_case_name"

		output_dir="$output_base_dir/$measure_name/$test_case_name"
        mkdir -p "$output_dir"

		for json_file in "$test_case"/*.json; do
          if [ -f "$json_file" ]; then
            echo "Processing JSON file: $json_file"

			java -jar "$tooling" -BundleToResources \
              -p="$json_file" -e=json -op="$output_dir"

		  fi
     	done
	  fi
    done
  fi
done


if [ "$unattended" = false ] ; then
	read -p "Press any key to resume ..."
fi