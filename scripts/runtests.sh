#!/bin/bash
#xcodebuild test -project ../tmdb.xcodeproj -scheme tmdb -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' -derivedDataPath "$(pwd)" 2>&1 | tee out.txt
xcodebuild test -project ../tmdb.xcodeproj -scheme tmdbTests -sdk iphonesimulator -configuration Debug -enableCodeCoverage YES  -destination 'platform=iOS Simulator,name=iPhone 6,OS=10.2' | grep -E '^(Test Case)'
