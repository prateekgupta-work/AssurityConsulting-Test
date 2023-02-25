set -e

echo $'\e[1;31m'"******************************************************************************************************************"$'\e[0m'
echo $'\e[1;31m'"-----------------------------------Provide JMeter directory location details--------------------------------------"$'\e[0m'
echo $'\e[1;31m'"******************************************************************************************************************"$'\e[0m'

read -p $'\e[1;31m'"Enter the location for JMeter bin directory [jmeter/bin/jmeter.sh]:"$'\e[0m' jmeter_bin
read -p $'\e[1;31m'"Enter the location for JMeter script/testplan directory to run including script/testplan name [jmeter/test.jmx]:"$'\e[0m' jmeter_script
read -p $'\e[1;31m'"Enter the location to save jtl files for JMeter execution [jmeter/results/jtl_files/]:"$'\e[0m' jmeter_result
read -p $'\e[1;31m'"Enter the location to save html reports for JMeter execution [jmeter/results/html_reports/]:"$'\e[0m' jmeter_htmlReport

echo $'\e[1;33m'"******************************************************************************************************************"$'\e[0m'
echo $'\e[1;33m'"-----------------------------------Provide JMeter test parameter details------------------------------------------"$'\e[0m'
echo $'\e[1;33m'"******************************************************************************************************************"$'\e[0m'

read -p $'\e[1;33m'"Enter the number of threads to run [5]:"$'\e[0m' jmeter_threads
read -p $'\e[1;33m'"Enter the ramp up time in seconds [5]:"$'\e[0m' jmeter_rampUp
read -p $'\e[1;33m'"Enter the duration of test in seconds [60]:"$'\e[0m' jmeter_duration
read -p $'\e[1;33m'"Enter the target throughput to achieve per minute [10]:"$'\e[0m' jmeter_throughput
read -p $'\e[1;33m'"Enter the location to save the extracted output to csv[/results/output/]:"$'\e[0m' jmeter_extractedOutput

jmeter_bin=${jmeter_bin:-'/Users/pratgupt/Documents/JMeter/apache-jmeter-5.4.3/bin/jmeter.sh'}
jmeter_script=${jmeter_script:-'/Users/pratgupt/Documents/AssurityConsulting/AssurityConsultingTest.jmx'}
jmeter_result=${jmeter_result:-'/Users/pratgupt/Documents/AssurityConsulting/results/jtl/'}
jmeter_htmlReport=${jmeter_htmlReport:-'/Users/pratgupt/Documents/AssurityConsulting/results/html_reports/'}
jmeter_threads=${jmeter_threads:-5}
jmeter_rampUp=${jmeter_rampUp:-5}
jmeter_duration=${jmeter_duration:-60}
jmeter_throughput=${jmeter_throughput:-10}
jmeter_extractedOutput=${jmeter_extractedOutput:-'/Users/pratgupt/Documents/AssurityConsulting/'}
jmeter_resultsDate=$(date "+%Y.%m.%d-%H.%M.%S")

${jmeter_bin} -n -t ${jmeter_script} -Jjmeter.reportgenerator.overall_granularity=1000 -JThreadsNum=${jmeter_threads} -JRampUpTime=${jmeter_rampUp} -JTestDuration=${jmeter_duration} -JTargetThroughput=${jmeter_throughput} -JOutputLocation=${jmeter_extractedOutput} -l ${jmeter_result}result.${jmeter_resultsDate}.jtl -e -o ${jmeter_htmlReport}html_report.${jmeter_resultsDate}

pid=$!
wait=$pid

echo $'\e[1;32m'"View test result jtl file from here: "$'\e[0m'${jmeter_result}result.${jmeter_resultsDate}.jtl
echo $'\e[1;32m'"View html report from here: "$'\e[0m'${jmeter_htmlReport}html_report.${jmeter_resultsDate}
echo $'\e[1;32m'"View extracted data in CategoriesOutput.csv from here: "$'\e[0m'${jmeter_extractedOutput}CategoriesOutput.csv
echo $'\e[1;31m'"View request error data in errors_only.xml from here: "$'\e[0m'${jmeter_extractedOutput}errors_only.xml