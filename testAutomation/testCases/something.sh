#!/bin/bash

export path_to_test_file="/home/patrick/KMP/testAutomation/project/enketo/enketo-express-2/test/server/testCases/testCase001.spec.js"
export path_to_test_dir="/home/patrick/KMP/testAutomation/project/enketo/enketo-express-2/test/server/testCases/"
generate_id_test() {
  variable="$1"
  cat > $path_to_test_file <<EOF
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
      });
    });
  });

  describe( 'isNew() check', function() {
    var id = 'AAAA';
    var instanceId = 'uuid:BBBB';

<<<<<<< HEAD
    $1
  })
})
EOF
}
generate_instanceId_test() {
  variable="$1"
  cat > $path_to_test_file <<EOF
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
      });
    });
  });

  describe( 'isNew() check', function() {
    var id = 'AAAA';
    var instanceId = 'uuid:BBBB';

    $1
  })
})
EOF
}
generate_get_request_test() {
  variable="$1"
  cat > $path_to_test_file <<EOF
  /* global describe, require, it, beforeEach, afterEach */
  'use strict';

  /*
   * These tests use the special test Api Token and Server URLs defined in the API spec
   * at http://apidocs.enketo.org.
   */

  // safer to ensure this here (in addition to grunt:env:test)
  process.env.NODE_ENV = 'test';

  var request = require( 'supertest' );
  var app = require( '../../config/express' );
  var surveyModel = require( '../../app/models/survey-model' );
  var instanceModel = require( '../../app/models/instance-model' );
  var redis = require( 'redis' );
  var config = require( '../../app/models/config-model' ).server;
  var client = redis.createClient( config.redis.main.port, config.redis.main.host, {
      auth_pass: config.redis.main.password
  } );

  describe( 'Submissions', function() {
      var enketoId;
      var nonExistingEnketoId = 'nope';
      var validServer = 'https://testserver.com/bob';
      var validFormId = 'something';

      beforeEach( function( done ) {
          // add survey if it doesn't exist in the db
          surveyModel.set( {
              openRosaServer: validServer,
              openRosaId: validFormId,
          } ).then( function( id ) {
              enketoId = id;
              done();
          } );
      } );

      describe( 'using GET (existing submissions) for an existing/active Enketo IDs', function() {

          $1

          describe( 'for a valid and existing instanceID that does not belong to the current form', function() {

              beforeEach( function( done ) {
                  // add survey if it doesn't exist in the db
                  instanceModel.set( {
                      openRosaServer: validServer,
                      openRosaId: 'differentId',
                      instanceId: 'b',
                      returnUrl: 'example.com',
                      instance: '<data></data>',
                      instanceAttachments: {
                          'test.jpg': 'https://example.com'
                      }
                  } ).then( function() {
                      done();
                  } );
              } );

              it( 'responds with 400', function( done ) {
                  request( app ).get( '/submission/::' + enketoId + '?instanceId=b' )
                      .expect( 400, done );
              } );

          } );

          describe( 'for a valid and existing instanceID that belongs to the current form', function() {

              beforeEach( function( done ) {
                  // add survey if it doesn't exist in the db
                  instanceModel.set( {
                      openRosaServer: validServer,
                      openRosaId: validFormId,
                      instanceId: 'c',
                      returnUrl: 'example.com',
                      instance: '<data></data>'
                  } ).then( function() {
                      done();
                  } );
              } );

              it( 'responds with 200', function( done ) {
                  request( app ).get( '/submission/::' + enketoId + '?instanceId=c' )
                      .expect( 200, done );
              } );

          } );

      } );

  } );
EOF
}
generate_set_survey_test() {
  variable="$1"
  #echo "var : $variable"
  cat > $path_to_test_file <<EOF
  /* global describe, require, it, beforeEach, afterEach */
  'use strict';

  // safer to ensure this here (in addition to grunt:env:test)
  process.env.NODE_ENV = 'test';

  var _wait1ms;
  var Promise = require( 'lie' );
  var chai = require( 'chai' );
  var expect = chai.expect;
  var chaiAsPromised = require( 'chai-as-promised' );
  var redis = require( 'redis' );
  var config = require( '../../app/models/config-model' ).server;
  var model = require( '../../app/models/survey-model' );
  var client = redis.createClient( config.redis.main.port, config.redis.main.host, {
      auth_pass: config.redis.main.password
  } );

  chai.use( chaiAsPromised );

  // help function to ensure subsequent database entries don't have the exact same timestamp
  // redis is fast...
  _wait1ms = function() {
      return new Promise( function( resolve ) {
          setTimeout( function() {
              resolve();
          }, 1 );
      } );
  };

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

      describe( 'set: when attempting to store new surveys', function() {
          var survey;

          beforeEach( function() {
              survey = {
                  openRosaId: 'widgets',
                  openRosaServer: 'https://ona.io/enketo'
              };
          } );

          $1
=======
    it( 'is rejected if id is $variable', function() {
            var test = submission.isNew( $variable, instanceId );
            return expect( test ).to.eventually.be.rejected.and.have.property( 'status' ).that.equals( 400 );
        } );
>>>>>>> 630cca0d35b457b0f0901f3ae09256dba096031e
  } );
} );
EOF
}
generate_cache_instance_test() {
  variable="$1"
  #echo "var : $variable"
  cat > $path_to_test_file <<EOF
  /* global describe, require, it, beforeEach, afterEach */
  'use strict';

  var Promise = require( 'lie' );
  var chai = require( 'chai' );
  var expect = chai.expect;
  var chaiAsPromised = require( 'chai-as-promised' );
  var model = require( '../../app/models/instance-model' );

  chai.use( chaiAsPromised );

  describe( 'Instance Model', function() {

      afterEach( function( done ) {
          model.remove( {
                  instanceId: 'someid'
              } )
              .then( function() {
                  done();
              } )
              .catch( function() {
                  done();
              } );
      } );

      describe( 'set: when attempting to cache an instance', function() {
          var survey;

          beforeEach( function() {
              survey = {
                  openRosaId: 'widgets',
                  openRosaServer: 'http://example.com',
                  instanceId: 'someid',
                  returnUrl: 'http://example.com',
                  instance: '<data></data>',
                  instanceAttachments: {
                      'test.jpg': 'https://example.com/test.jpg'
                  }
              };
          } );

          $1
          } );


  } );
EOF
}
generate_obtain_cached_instance_test() {
  variable="$1"
  cat > $path_to_test_file <<EOF
  /* global describe, require, it, beforeEach, afterEach */
  'use strict';

  var Promise = require( 'lie' );
  var chai = require( 'chai' );
  var expect = chai.expect;
  var chaiAsPromised = require( 'chai-as-promised' );
  var model = require( '../../app/models/instance-model' );

  chai.use( chaiAsPromised );

  describe( 'Instance Model', function() {

      afterEach( function( done ) {
          model.remove( {
                  instanceId: 'someid'
              } )
              .then( function() {
                  done();
              } )
              .catch( function() {
                  done();
              } );
      } );
      describe( 'get: when attempting to obtain a cached instance', function() {
          var survey;
          var promise;

          beforeEach( function() {
              survey = {
                  openRosaId: 'widgets',
                  openRosaServer: 'http://example.com',
                  instanceId: 'someid',
                  returnUrl: 'http://example.com',
                  instance: '<data></data>',
                  instanceAttachments: {
                      'test.jpg': 'https://example.com/test.jpg'
                  }
              };
          } );

          $1

          } );
    } );
EOF
}
