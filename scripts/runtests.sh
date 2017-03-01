#!/bin/bash
#xcodebuild test -project ../tmdb.xcodeproj -scheme tmdb -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' -derivedDataPath "$(pwd)" 2>&1 | tee out.txt

echo "Running Tests... Wait"

xcodebuild test -project ../tmdb.xcodeproj -scheme tmdb -sdk iphonesimulator -configuration Debug -enableCodeCoverage YES  -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' 1>/dev/null | tee tmp.txt 

echo "======= Results ======="
echo "---> Success"
cat tmp.txt | grep -E '^(Test Case).*(passed)' 
echo "-----------------------"
echo "---> Fails"
cat tmp.txt | grep -E '^(Test Case).*(failed)' 
echo "-----------------------"

#rm tmp.txt
