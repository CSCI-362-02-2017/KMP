#!/bin/sh

set -x

test_driver_filename='generate_tests.sh'

# ------------------------- [START] get project path ------------------------- #
# get full path to this dir and others
scripts_dir="$(cd -P -- "$(dirname -- "$0")" 2>&1 > /dev/null && pwd -P)"
test_cases_dir="$scripts_dir/../testCases"
project_dir="$scripts_dir/../project"
reports_dir="$scripts_dir/../reports"
# -------------------------- [END] get project path -------------------------- #

# ---------------- [START] ensure dependencies are installed ----------------- #
exit_if_not_installed () {
  if [ -z "$(which $1)" ]
  then
    echo "You need '$1' installed to run this script!"
    exit 1
  fi
}

exit_if_not_installed 'bash'
exit_if_not_installed 'docker'
exit_if_not_installed 'docker-compose'
# ----------------- [END] ensure dependencies are installed ------------------ #

# --------------- [START] export variables for generate script --------------- #
export TEST_CASES_DIR="$test_cases_dir"
export PROJECT_DIR="$project_dir"
export REPORTS_DIR="$reports_dir"
# ---------------- [END] export variables for generate script ---------------- #

# -------------------------- [START] run all tests --------------------------- #
test_driver="$test_cases_dir/$test_driver_filename"

chmod +x "$test_driver"

"$test_driver"
# --------------------------- [END] run all tests ---------------------------- #

# no errors, exit happily
exit 0
