CC=xcodebuild
PROJECT=../tmdb.xcodeproj
SCHEME=tmdbTests
DESTINATION='platform=iOS Simulator,name=iPhone 6,OS=10.2'
FLAGS=-project $(PROJECT) -sdk iphonesimulator -scheme $(SCHEME) -configuration Debug -enableCodeCoverage YES -destination $(DESTINATION)
TEST_OUTPUT=reports
REPORT_NAME=$(shell date "+%Y%m%d_%H%M%S")
REPORT_FILENAME=$(TEST_OUTPUT)/$(REPORT_NAME)

all: test

test:
	@echo "====================================================="
	@echo "=   Initializing Tests... It can take a long time.  ="
	@echo "====================================================="
	$(CC) test $(FLAGS) | tee $(REPORT_FILENAME).report
	@echo "-----------------------------------------------------"
	@echo "File output: $(REPORT_FILENAME).report"

pretty-test:
	@echo "============================================================"
	@echo "=   Initializing PRETTY Tests... It can take a long time.  ="
	@echo "==========================================================="
	$(CC) test $(FLAGS) | xcpretty | tee $(REPORT_FILENAME).preport
	@echo "-----------------------------------------------------"
	@echo "File output: $(REPORT_FILENAME).preport"

install-dependencies:

	@echo "============================================================"
	@echo "=                Installing dependencies...                ="
	@echo "============================================================"
	@echo "= I WILL NEED SUPERUSER PERMISSIONS TO INSTALL DEPENDENCIES="
	@echo "============================================================"
	sudo gem install xcpretty
