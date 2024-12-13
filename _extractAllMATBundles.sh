#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-cli-2.4.0.jar
input_cache_path=./input-cache
mat_bundle_dir=./bundles/mat

set -e

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	echo Extracting bundle $mat_bundle
	java -jar $tooling -ExtractMatBundle $mat_bundle_dir -dir

else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling -ExtractMatBundle $mat_bundle_dir -dir
	else
		echo cqf Tooling jar NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi