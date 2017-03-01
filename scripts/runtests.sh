#!/bin/bash
#xcodebuild test -project ../tmdb.xcodeproj -scheme tmdb -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' -derivedDataPath "$(pwd)" 2>&1 | tee out.txt

echo "Running Tests... Wait"
xcodebuild test -project ../tmdb.xcodeproj -scheme tmdbTests -sdk iphonesimulator -configuration Debug -enableCodeCoverage YES  -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' > tmp.txt 

echo "---> Results"
echo "-> Success"
cat tmp.txt | grep -E 'tmp.txt' 
