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

    it( 'is rejected if id is $variable', function() {
            var test = submission.isNew( $variable, instanceId );
            return expect( test ).to.eventually.be.rejected.and.have.property( 'status' ).that.equals( 400 );
        } );
  } );
} );
EOF
}
