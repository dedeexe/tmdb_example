#!/bin/bash

OUTPUT="$(pwd)/logs/coverage.log"
TEMP_FILE="$(pwd)/settings.tmp"
PROJECT_ROOT_TEMP=""

xcodebuild test \
	-project ../tmdb.xcodeproj \
	-scheme tmdbTests \
	-sdk iphonesimulator \
	-configuration Debug \
	-enableCodeCoverage YES  \
	-destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' \
	2>/dev/null

xcodebuild test \
	-project ../tmdb.xcodeproj \
	-scheme tmdbTests \
	-sdk iphonesimulator \
	-configuration Debug \
	-showBuildSettings > $TEMP_FILE


PROJECT_ROOT_TEMP="$(grep -m1 PROJECT_TEMP_ROOT $TEMP_FILE | cut -d= -f2 | xargs)"


	

