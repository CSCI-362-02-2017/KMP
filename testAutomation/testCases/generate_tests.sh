#!/bin/bash

# set -x

. "$TEST_CASES_DIR/something.sh"

GRUNT_COMMAND='test-and-build-kmp_id'

TIME_EXECUTED="$(date +%s)"

PATH_TO_ENKETO="$PROJECT_DIR/enketo/enketo-express-2"
PATH_TO_TESTER_FILE_DIR="$PROJECT_DIR/enketo/enketo-express-2/test/server"
PATH_TO_ENKETO_DOCKER_COMPOSE="$PATH_TO_ENKETO/docker-compose.yml"
PATH_TO_KMP_ID_TEST_RESULTS="$REPORTS_DIR/id_test_results"
PATH_TO_KMP_INSTANCEID_TEST_RESULTS="$REPORTS_DIR/instanceId_test_results"
PATH_TO_KMP_GET_REQUEST_TEST_RESULTS="$REPORTS_DIR/get_request_test_results"
PATH_TO_KMP_SET_SURVEY_TEST_RESULTS="$REPORTS_DIR/set_survey_test_results"
PATH_TO_KMP_CACHE_INSTANCE_TEST_RESULTS="$REPORTS_DIR/cache_instance_test_results"
PATH_TO_KMP_OBTAIN_CACHED_INSTANCE_TEST_RESULTS="$REPORTS_DIR/obtain_cached_instance_test_results"
PATH_TO_TEST_RESULTS="$PROJECT_DIR/enketo/enketo-express-2/mochawesome-report"


run_id_tests () {
  mkdir -p "$PATH_TO_KMP_ID_TEST_RESULTS"
  docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_id'
}
run_instanceId_tests () {
 mkdir -p "$PATH_TO_KMP_INSTANCEID_TEST_RESULTS"
 docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_instanceId'
}
run_get_request_tests () {
 mkdir -p "$PATH_TO_KMP_GET_REQUEST_TEST_RESULTS"
 docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_get_request'
}
run_set_survey_tests () {
 mkdir -p "$PATH_TO_KMP_SET_SURVEY_TEST_RESULTS"
 docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_set_survey'
}
run_cache_instance_tests () {
 mkdir -p "$PATH_TO_KMP_CACHE_INSTANCE_TEST_RESULTS"
 docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_cache_instance'
}
run_obtain_cached_instance_tests () {
 mkdir -p "$PATH_TO_KMP_OBTAIN_CACHED_INSTANCE_TEST_RESULTS"
 docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_obtain_cached_instance'
}


export path_to_test_file="$PROJECT_DIR/enketo/enketo-express-2/test/server/testCases/testCase001.spec.js"
export path_to_test_dir="$PROJECT_DIR/enketo/enketo-express-2/test/server"


# path_to_kmp="$(/home/patrick/KMP/testAutomation)"
# counter=0
# for testCase_file in $path_to_kmp/testCases/*
# do
# input_line=$(cat $testCase_file | grep "Inputs : ")

# test_input=${input_line##*:}



# echo "1 $testCase_file" # "$path_to_kmp/testCasesinput_line_*"
#done


input_line_1=$(cat $TEST_CASES_DIR/testCase001.txt | grep -A 10 "it(")

input_line_2=$(cat $TEST_CASES_DIR/testCase002.txt | grep -A 10 "it(")

input_line_3=$(cat $TEST_CASES_DIR/testCase003.txt | grep -A 10 "it(")

input_line_4=$(cat $TEST_CASES_DIR/testCase004.txt | grep -A 10 "it(")

input_line_5=$(cat $TEST_CASES_DIR/testCase005.txt | grep -A 10 "it(")

input_line_6=$(cat $TEST_CASES_DIR/testCase006.txt | grep -A 10 "it(")

input_line_7=$(cat $TEST_CASES_DIR/testCase007.txt | grep -A 10 "it(")

input_line_8=$(cat $TEST_CASES_DIR/testCase008.txt | grep -A 10 "it(")

input_line_9=$(cat $TEST_CASES_DIR/testCase009.txt | grep -A 10 "it(")
test009_input=${input_line_9##*:}

input_line_11=$(cat $TEST_CASES_DIR/testCase011.txt | grep -A 10 "it(")
test011_input=${input_line_11##*:}

input_line_12=$(cat $TEST_CASES_DIR/testCase012.txt | grep -A 10 "it(")
test012_input=${input_line_12##*:}

input_line_13=$(cat $TEST_CASES_DIR/testCase013.txt | grep -A 10 "it(")
test013_input=${input_line_13##*:}

input_line_14=$(cat $TEST_CASES_DIR/testCase014.txt | grep -A 10 "it(")
test014_input=${input_line_14##*:}

input_line_15=$(cat $TEST_CASES_DIR/testCase015.txt | grep -A 10 "it(")
test015_input=${input_line_15##*:}

input_line_16=$(cat $TEST_CASES_DIR/testCase016.txt | grep -A 10 "it(")
test016_input=${input_line_16##*:}

input_line_17=$(cat $TEST_CASES_DIR/testCase017.txt | grep -A 10 "it(")
test017_input=${input_line_17##*:}

input_line_18=$(cat $TEST_CASES_DIR/testCase018.txt | grep -A 10 "it(")
test018_input=${input_line_18##*:}

input_line_19=$(cat $TEST_CASES_DIR/testCase019.txt | grep -A 10 "it(")
test019_input=${input_line_19##*:}

input_line_20=$(cat $TEST_CASES_DIR/testCase020.txt | grep -A 10 "it(")
test011_input=${input_line_11##*:}

input_line_21=$(cat $TEST_CASES_DIR/testCase021.txt | grep -A 10 "it(")
test021_input=${input_line_21##*:}

input_line_22=$(cat $TEST_CASES_DIR/testCase022.txt | grep -A 10 "it(")
test022_input=${input_line_22##*:}

input_line_23=$(cat $TEST_CASES_DIR/testCase023.txt | grep -A 10 "it(")
test023_input=${input_line_23##*:}

input_line_24=$(cat $TEST_CASES_DIR/testCase024.txt | grep -A 10 "it(")
test024_input=${input_line_24##*:}

input_line_25=$(cat $TEST_CASES_DIR/testCase025.txt | grep -A 10 "it(")

input_line_26=$(cat $TEST_CASES_DIR/testCase026.txt | grep -A 10 "it(")

input_line_27=$(cat $TEST_CASES_DIR/testCase027.txt | grep -A 10 "it(")



id_test_inputs=("$input_line_1" "$input_line_2" "$input_line_3" "$input_line_4" "$input_line_5")

instanceId_test_inputs=("$input_line_6" "$input_line_7" "$input_line_8" "$input_line_9")

get_request_test_inputs=("$input_line_11" "$input_line_12" "$input_line_13")

set_survey_test_inputs=("$input_line_14" "$input_line_15" "$input_line_16" "$input_line_17" "$input_line_18")

cache_instance_test_inputs=("$input_line_19" "$input_line_20" "$input_line_21" "$input_line_22" "$input_line_23" "$input_line_24")

obtain_cached_instance_test_inputs=("$input_line_25" "$input_line_26" "$input_line_27")


get_new_id_path() {
  path_to_test_file="$path_to_test_dir/id-$COUNTER.spec.js"
}
get_new_instanceId_path() {
  path_to_test_file="$path_to_test_dir/instanceId-$COUNTER.spec.js"
}

get_new_get_request_path() {
  path_to_test_file="$path_to_test_dir/get_request-$COUNTER.spec.js"
}

get_new_survey_test_path() {
  path_to_test_file="$path_to_test_dir/set_survey-$COUNTER.spec.js"
}

get_new_cache_instance_path() {
  path_to_test_file="$path_to_test_dir/cache_instance-$COUNTER.spec.js"
}

get_new_obtain_cached_instance_path() {
  path_to_test_file="$path_to_test_dir/obtain_cached_instance-$COUNTER.spec.js"
}


COUNTER=0

for i in "${id_test_inputs[@]}"
do
 get_new_id_path "$i"
 echo "$path_to_test_file"
 generate_id_test "$i"
 COUNTER=$((COUNTER+1))
done
ID_TEST_RESULTS="$(run_id_tests)"
echo "$ID_TEST_RESULTS" > "$PATH_TO_KMP_ID_TEST_RESULTS/test-and-build-kmp_id-$TIME_EXECUTED.html"
echo "$ID_TEST_RESULTS" >> "$TIME_EXECUTED.total.html"
for row in $(echo "${ID_TEST_RESULTS}" | jq -r '.passes[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
   echo ${row} | base64 --decode >> /home/patrick/KMP/testCases/newJSfile.js
   echo  $(_jq '.') >> /home/patrick/KMP/testCases/newJSfile.js
done

for i in "${instanceId_test_inputs[@]}"
do
 get_new_instanceId_path "$i"
 echo "$path_to_test_file"
 generate_instanceId_test "$i"
 COUNTER=$((COUNTER+1))
done
INSTANCEID_TEST_RESULTS="$(run_instanceId_tests)"
echo "$INSTANCEID_TEST_RESULTS" > "$PATH_TO_KMP_INSTANCEID_TEST_RESULTS/test-and-build-kmp_instanceId-$TIME_EXECUTED.html"

#for i in ${set_survey_test_inputs[@]}
for i in "${set_survey_test_inputs[@]}"
do
 get_new_survey_test_path "$i"
 echo "$path_to_test_file"
 generate_set_survey_test "$i"
 COUNTER=$((COUNTER+1))
done
SET_SURVEY_TEST_RESULTS="$(run_set_survey_tests)"
echo "$SET_SURVEY_TEST_RESULTS" > "$PATH_TO_KMP_SET_SURVEY_TEST_RESULTS/test-and-build-kmp_set_survey-$TIME_EXECUTED.html"

for i in "${cache_instance_test_inputs[@]}"
do
 get_new_cache_instance_path "$i"
 echo "$path_to_test_file"
 generate_cache_instance_test "$i"
 COUNTER=$((COUNTER+1))
done
CACHE_INSTANCE_TEST_RESULTS="$(run_cache_instance_tests)"
echo "$CACHE_INSTANCE_TEST_RESULTS" > "$PATH_TO_KMP_CACHE_INSTANCE_TEST_RESULTS/test-and-build-kmp_cache_instance-$TIME_EXECUTED.html"

for i in "${obtain_cached_instance_test_inputs[@]}"
do
 get_new_obtain_cached_instance_path "$i"
 echo "$path_to_test_file"
 generate_obtain_cached_instance_test "$i"
 COUNTER=$((COUNTER+1))
done
OBTAIN_CACHED_INSTANCE_TEST_RESULTS="$(run_obtain_cached_instance_tests)"
echo "$OBTAIN_CACHED_INSTANCE_TEST_RESULTS" > "$PATH_TO_KMP_OBTAIN_CACHED_INSTANCE_TEST_RESULTS/test-and-build-kmp_obtain_cached_instance-$TIME_EXECUTED.html"

open_results() {
cd '../project/enketo/enketo-express-2/mochawesome-report'
xdg-open output-obtain_cached_instance.html &
xdg-open output-set_survey.html &
xdg-open output-cache_instance.html &
xdg-open output-id.html &
xdg-open output-instanceId.html &

}


open_results

#for i in ${get_request_test_inputs[@]}
#do
# counter=7
# get_new_get_request_path "$i"
# echo "test number : "$counter" "$i""
# echo "$path_to_test_file"
# generate_get_request_test "$i"
# counter=$((counter+1))
#done
#GET_REQUEST_TEST_RESULTS="$(run_get_request_tests)"
#echo "$GET_REQUEST_TEST_RESULTS" > "$PATH_TO_KMP_GET_REQUEST_TEST_RESULTS/test-and-build-kmp_get_request-$TIME_EXECUTED.html"
# echo "3 $test001_input"
# echo "4 $id_test_input"
