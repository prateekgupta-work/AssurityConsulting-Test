# AssurityConsulting-Test

* AssurityConsultingTest.jmx is the JMeter script/test plan to execute the API load test
* AssurityConsulting.sh is shell script to execute the JMeter load test in non-GUI mode
* JMeter test execution is configured to prepare a .jtl file, html-reports & errors_only.xml files which will help in results analysis


**Below are the Steps to execute the JMeter load test**
* Run the shell script from terminal by ./AssurityConsulting.sh
* Shell script will request the user to provide the following inputs
	- JMeter bin directory: Absolute path of JMeter installation
	- JMeter script/testplan directory: Absolute path for the JMeter script/test plan required to be run
	- JTL result file directory: Absolute path to save the jtl file
	- Html Report diretory: Absolute path to save the html report
	- Number of Threads/Vusers
	- RampUp Time in seconds
	- Test Duration in seconds
	- Target Throughput
	- Absolute path to save extracted output in csv, in this case categories Id, promotions and price

*In case no input is provided shell script will take the default value


**Details on Extracted Output to CSV file**
Data like categories Id, promotions and price are being extracted & save to CategoriesOutput.csv for all the pass transaction
* Column 1: Thread Id/Number
* Column 2: Categories Id
* Column 3: Promotions Id
* Column 4: Prices

**Results & Other files details**
* /Output/CategoriesOutput.csv - contains extracted data like categoriesId, promotions etc.
* /Output/error_only.xml - Errors logs for failed request
* /Output/jmeter.log - JMeter log from the execution
* /results/jtl/result.2023.02.25-23.43.05.jtl - JTL result file for the test execution
* /results/html_reports/html_report.2023.02.25-23.43.05/ - html report for the test execution

**Performance Test Summary Report**: Please find the attached PerformanceTestSummaryReport-AssurityConsulting.pdf in the git
