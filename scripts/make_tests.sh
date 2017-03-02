#!/bin/bash
#xcodebuild test -project ../tmdb.xcodeproj -scheme tmdb -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' -derivedDataPath "$(pwd)" 2>&1 | tee out.txt

OUTPUT="$(pwd)/logs/tests.log"

echo "Running Tests... Take a coffe and Relax"
echo "Maybe I have to build the project... then... Really relax a little"

xcodebuild test \
	-project ../tmdb.xcodeproj \
	-scheme tmdbTests \
	-sdk iphonesimulator \
	-configuration Debug \
	-enableCodeCoverage YES \
	-destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' \
	2>/dev/null | tee tmp.txt 


echo "\n\n\n"
echo "======= Results =======" 			> $OUTPUT
echo "---> Success" 				>> $OUTPUT
cat tmp.txt | grep -E '^(Test Case).*(passed)' 	>> $OUTPUT
echo "-----------------------" 			>> $OUTPUT
echo "---> Fail" 				>> $OUTPUT
cat tmp.txt | grep -E '^(Test Case).*(failed)'	>> $OUTPUT
echo "-----------------------" 			>> $OUTPUT

rm tmp.txt

cat $OUTPUT
echo "\n\n A file with above result was created at $OUTPUT"
