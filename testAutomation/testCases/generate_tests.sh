#!/bin/bash

# set -ex

. something.sh

GRUNT_COMMAND='test-and-build-kmp_id'

TIME_EXECUTED="$(date +%s)"

PATH_TO_ENKETO="/home/patrick/KMP/testAutomation/project/enketo/enketo-express-2"

PATH_TO_TESTER_FILE_DIR="/home/patrick/KMP/testAutomation/project/enketo/enketo-express-2/test/server"

PATH_TO_ENKETO_DOCKER_COMPOSE="$PATH_TO_ENKETO/docker-compose.yml"

PATH_TO_KMP_ID_TEST_RESULTS="/home/patrick/KMP/testAutomation/reports/id_test_results"

run_id_tests () {
  mkdir -p "$PATH_TO_KMP_ID_TEST_RESULTS"
  #docker-compose -f "$PATH_TO_ENKETO_DOCKER_COMPOSE" exec enketo sh -c "grunt test-and-build-kmp_id"
  docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_id'
}

export path_to_test_file="/home/patrick/KMP/testAutomation/project/enketo/enketo-express-2/test/server/testCases/testCase001.spec.js"
export path_to_test_dir="/home/patrick/KMP/testAutomation/project/enketo/enketo-express-2/test/server"


# path_to_kmp="$(/home/patrick/KMP/testAutomation)"
# counter=0
# for testCase_file in $path_to_kmp/testCases/*
# do
# input_line=$(cat $testCase_file | grep "Inputs : ")

# test_input=${input_line##*:}

 

# echo "1 $testCase_file" # "$path_to_kmp/testCasesinput_line_*"
#done


input_line_1=$(cat testCase001.txt | grep "Inputs : ")
test001_input=${input_line_1##*:}

input_line_2=$(cat testCase002.txt | grep "Inputs : ")
test002_input=${input_line_2##*:}

input_line_3=$(cat testCase003.txt | grep "Inputs : ")
test003_input=${input_line_3##*:}

input_line_4=$(cat testCase004.txt | grep "Inputs : ")
test004_input=${input_line_4##*:}

input_line_5=$(cat testCase005.txt | grep "Inputs : ")
test005_input=${input_line_5##*:}

input_line_6=$(cat testCase006.txt | grep "Inputs : ")
test006_input=${input_line_6##*:}

input_line_7=$(cat testCase007.txt | grep "Inputs : ")
test007_input=${input_line_7##*:}

input_line_8=$(cat testCase008.txt | grep "Inputs : ")
test008_input=${input_line_8##*:}

input_line_9=$(cat testCase009.txt | grep "Inputs : ")
test009_input=${input_line_9##*:}

input_line_10=$(cat testCase010.txt | grep "Inputs : ")
test010_input=${input_line_10##*:}

input_line_11=$(cat testCase011.txt | grep "Inputs : ")
input_line_12=$(cat testCase012.txt | grep "Inputs : ")
input_line_13=$(cat testCase013.txt | grep "Inputs : ")
input_line_14=$(cat testCase014.txt | grep "Inputs : ")
input_line_15=$(cat testCase015.txt | grep "Inputs : ")
input_line_16=$(cat testCase016.txt | grep "Inputs : ")
input_line_17=$(cat testCase017.txt | grep "Inputs : ")
input_line_18=$(cat testCase018.txt | grep "Inputs : ")
input_line_19=$(cat testCase019.txt | grep "Inputs : ")
input_line_20=$(cat testCase020.txt | grep "Inputs : ")
input_line_21=$(cat testCase021.txt | grep "Inputs : ")
input_line_22=$(cat testCase022.txt | grep "Inputs : ")
input_line_23=$(cat testCase023.txt | grep "Inputs : ")
input_line_24=$(cat testCase024.txt | grep "Inputs : ")
input_line_25=$(cat testCase025.txt | grep "Inputs : ")


id_test_inputs=("$test001_input" "$test002_input" "$test003_input")

instanceId_test_inputs=("$test006_input" "$test007_input" "$test008_input" "$test009_input" "$test010_input")


get_new_id_path() {
  path_to_test_file="$path_to_test_dir/id-$1.spec.js"
}

get_new_instanceId_path() {
  path_to_test_file="$path_to_dir/instanceId_tests/id_$1.spec.js"
}
for i in ${id_test_inputs[@]}
do
 get_new_id_path "$i"
 echo "$i"
 echo "$path_to_test_file"
 generate_id_test "$i"
done
TEST_RESULTS="$(run_id_tests)"
echo "$TEST_RESULTS" > "$PATH_TO_KMP_ID_TEST_RESULTS/test-and-build-kmp_id-$TIME_EXECUTED.html"
# echo "3 $test001_input"
# echo "4 $id_test_input"
