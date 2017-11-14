#!/bin/sh
#set -x

GRUNT_COMMAND='test-and-build-kmp_id'

TIME_EXECUTED="$(date +%s)"

PATH_TO_ENKETO="${BASHSOURCE%/*}/KMP/testAutomation/project/enketo/enketo-express-2"

PATH_TO_TESTER_FILE_DIR="${BASHSOURCE%/*}/KMP/testAutomation/project/enketo/enketo-express-2/test/server/testCases"

PATH_TO_TESTER_FILE="$PATH_TO_TESTER_FILE_DIR/kmp_test_1.js"

PATH_TO_ENKETO_DOCKER_COMPOSE="$PATH_TO_ENKETO/docker-compose.yml"

PATH_TO_KMP_ID_TEST_RESULTS="${BASHSOURCE%/*}/KMP/testAutomation/reports/id_test_results"

move_to_test_file_dir() {
  if [ ! -d "$PATH_TO_TESTER_FILE_DIR" ]
  then
    mkdir -p "$PATH_TO_TESTER_FILE_DIR"
  fi

  cd "$PATH_TO_TESTER_FILE_DIR"
}

edit_test_file() {
  vim "$PATH_TO_TESTER_FILE_DIR/kmp_test_1.js"
}

copy_results () {
  cp -f "$PATH_TO_ENKETO/test_results.html" "$PATH_TO_KMP_ID_TEST_RESULTS/"
}

generate_js_test_file  () {
first_variable=${1:-"undefined"}
second_variable=${2:-"null"}
third_variable=${3:-"false"}
fourth_variable=${4:-"undefined"}
fifth_variable=${5:-"undefined"}

  cat > $PATH_TO_TESTER_FILE <<EOF
  /* global describe, require, it, afterEach */
  'use strict';

  // safer to ensure this here (in addition to grunt:env:test)
  process.env.NODE_ENV = 'test';

  var chai = require( 'chai' );
  var expect = chai.expect;
  var chaiAsPromised = require( 'chai-as-promised' );
  var redis = require( 'redis' );
  var config = require( '../../app/models/config-model' ).server;
  config[ 'base path' ] = '';
  var submission = require( '../../app/models/submission-model' );
  var client = redis.createClient( config.redis.main.port, config.redis.main.host, {
      auth_pass: config.redis.main.password
  } );

  chai.use( chaiAsPromised );

  describe( 'Survey Model', function() {

      afterEach( function( done ) {
          // select test database and flush it
          client.select( 15, function( err ) {
              if ( err ) {
                  return done( err );
              }
              client.flushdb( function( err ) {
                  if ( err ) {
                      return done( err );
                  }
                  done();
              } );
          } );
      } );

      describe( 'isNew() check', function() {
          var id = 'AAAA';
          var instanceId = 'uuid:BBBB';

          it( 'Test: 001 is rejected if id is undefined', function() {
              var test = submission.isNew( $first_variable, instanceId );
              return expect( test ).to.eventually.be.rejected.and.have.property( 'status' ).that.equals( 400 );
          } );

          it( 'Test: 002 is rejected if id is null', function() {
              var test = submission.isNew( $second_variable, instanceId );
              return expect( test ).to.eventually.be.rejected.and.have.property( 'status' ).that.equals( 400 );
          } );

          it( 'Test: 003 is rejected if id is false', function() {
              var test = submission.isNew( $third_variable, instanceId );
              return expect( test ).to.eventually.be.rejected.and.have.property( 'status' ).that.equals( 400 );
          } );

          it( 'Test: 004 is rejected if id is negative', function() {
              var test = submission.isNew( $fourth_variable, instanceId );
              return expect( test ).to.eventually.be.rejected.and.have.property( 'status' ).that.equals( 400 );
          } );

          it( 'Test: 005 is rejected if id is 0', function() {
              var test = submission.isNew( $fifth_variable, instanceId );
              return expect( test ).to.eventually.be.rejected.and.have.property( 'status' ).that.equals( 400 );
          } );

      } );

  } );
EOF

  cat $PATH_TO_TESTER_FILE
  echo ''
  echo ''
  echo ''
  echo '====================================================================================================='
  echo "File is located at : $PATH_TO_TESTER_FILE"
  echo "Get there by running : 'move_to_test_file_dir'"
  echo "Edit the file by running : 'edit_test_file'"
  echo "Run test file by running : 'run_kmp_id_tests'"
  echo "Results available after running test file at $PATH_TO_KMP_ID_TEST_RESULTS"

#  echo "Get there by running : '$(move_to_test_file_dir)'"
  echo '====================================================================================================='


}

run_kmp_id_tests () {
  mkdir -p "$PATH_TO_KMP_ID_TEST_RESULTS"
  #docker-compose -f "$PATH_TO_ENKETO_DOCKER_COMPOSE" exec enketo sh -c "grunt $GRUNT_COMMAND"
  TEST_RESULTS="$(sudo docker exec -it enketo sh -c 'cd /app && /app/node_modules/.bin/grunt test-and-build-kmp_id > /app/test_results.html' 2>&1)"

  echo $TEST_RESULTS

  copy_results
}
# TEST_RESULTS="$(run_kmp_id_tests)"

# cp -f "$PATH_TO_ENKETO/test_results.html" "$PATH_TO_KMP_ID_TEST_RESULTS/"


# generate_js_test_file  $1 $2 $3 $4 $5

# run_kmp_id_tests

if [ ! -z "$1" ]
then
  $1 $@
else

  echo 'These functions are now available to you'

  echo "run_kmp_id_tests"

  echo 'Usage : run_kmp_id_tests'

  echo "generate_js_test_file "

  echo "Usage : generate_js_test_file  null undefined false ... ..."

  echo "copy_results"

  echo "Results can be found in: $PATH_TO_KMP_ID_TEST_RESULTS"
fi




# echo "$TEST_RESULTS" > "$PATH_TO_KMP_TEST_RESULTS/$GRUNT_COMMAND-$TIME_EXECUTED.html"

#set +x
