CC=xcodebuild
PROJECT=../tmdb.xcodeproj
SCHEME=tmdbTests
DESTINATION='platform=iOS Simulator,name=iPhone 6,OS=10.2'
FLAGS=-project $(PROJECT) -sdk iphonesimulator -scheme $(SCHEME) -configuration Debug -enableCodeCoverage YES -destination $(DESTINATION)
TEST_OUTPUT=reports
REPORT_NAME=$(shell date "+%Y%m%d_%H%M%S")

all: test

test:
	@echo "====================================================="
	@echo "=   Initializing Tests... It can take a long time.  ="
	@echo "====================================================="
	$(CC) test $(FLAGS) | tee $(TEST_OUTPUT)/$(REPORT_NAME).report

pretty_test:
	@echo "============================================================"
	@echo "=   Initializing PRETTY Tests... It can take a long time.  ="
	@echo "==========================================================="
	$(CC) test $(FLAGS) | xcpretty | tee $(TEST_OUTPUT)/$(REPORT_NAME).preport
