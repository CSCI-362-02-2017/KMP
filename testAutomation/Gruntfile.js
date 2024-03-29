'use strict';



module.exports = function( grunt ) {

    var JS_INCLUDE = [ '**/*.js', '!node_modules/**', '!test/**/*.spec.js', '!public/js/*-bundle.js', '!public/js/*-bundle.min.js' ];

    var pkg = grunt.file.readJSON( 'package.json' );

    var path = require( 'path' );



    require( 'time-grunt' )( grunt );

    require( 'load-grunt-tasks' )( grunt );



    const d = new Date()

    const uniqueId = (d.getTime()-d.getMilliseconds())/1000



    grunt.config.init( {

        concurrent: {

            develop: {

                tasks: [ 'nodemon', 'watch' ],

                options: {

                    logConcurrentOutput: true

                }

            }

        },

        nodemon: {

            dev: {

                script: 'app.js',

                options: {

                    watch: [ 'app', 'config' ],

                    //nodeArgs: [ '--debug' ],

                    env: {

                        NODE_ENV: 'development',

                        DEBUG: '*, -express:*, -send, -compression, -body-parser:*'

                    }

                }

            }

        },

        sass: {

            compile: {

                cwd: 'app/views/styles',

                dest: 'public/css',

                expand: true,

                outputStyle: 'compressed',

                src: '**/*.scss',

                ext: '.css',

                flatten: true,

                extDot: 'last'

            }

        },

        watch: {

            config: {

                files: [ 'config/*.json' ],

                tasks: [ 'client-config-file:create' ]

            },

            sass: {

                files: [ 'app/views/styles/**/*.scss', 'public/widget/**/*.scss' ],

                tasks: [ 'sass' ],

                options: {

                    spawn: false,

                    livereload: true

                }

            },

            jade: {

                files: [ 'app/views/**/*.pug' ],

                options: {

                    spawn: false,

                    livereload: true

                }

            },

            language: {

                files: [ 'app/views/**/*.pug', 'app/controllers/**/*.js', 'app/models/**/*.js', 'public/js/src/**/*.js' ],

                tasks: [ 'shell:translation', 'i18next' ]

            },

            js: {

                files: [ 'public/js/src/**/*.js', 'public/widget/**/*.js' ],

                tasks: [ 'js-dev' ],

                options: {

                    spawn: false,

                    livereload: true

                }

            }

        },

        shell: {

            translation: {

                command: [

                    'cd locales',

                    'gulp',

                    'cd ..'

                ].join( '&&' )

            }

        },

        jsbeautifier: {

            test: {

                src: JS_INCLUDE,

                options: {

                    config: './.jsbeautifyrc',

                    mode: 'VERIFY_ONLY'

                }

            },

            fix: {

                src: JS_INCLUDE,

                options: {

                    config: './.jsbeautifyrc'

                }

            }

        },

        jshint: {

            options: {

                jshintrc: '.jshintrc'

            },

            all: JS_INCLUDE,

        },

        // test server JS

        mochaTest: {

            all: {

                options: {

                    reporter: 'dots'

                },

                src: [ 'test/server/**/*.spec.js' ]

            },

            account: {

                src: [ 'test/server/account-*.spec.js' ]

            },

            kmp:  {

               options: {

                  reporter: 'mochawesome',

                  reporterOptions: {

                    reportFilename: `output-${uniqueId}`

                  }

              },

                src: [ 'test/server/kmp_id.spec.js' ]

            },



            kmp_id:  {

              options: {

                 reporter: 'mochawesome',

                 reporterOptions: {

                   reportFilename: `output-id`

                 }

             },

                src: [ 'test/server/id-*.spec.js' ]

            },

            kmp_instanceId:  {

              options: {

                 reporter: 'mochawesome',

                 reporterOptions: {

                   reportFilename: `output-instanceId`

                 }

             },

                src: [ 'test/server/instanceId-*.spec.js' ]

            },

            kmp_get_request: {

              options: {

                 reporter: 'mochawesome',

                 reporterOptions: {

                   reportFilename: `output-get_request`

                 }

             },

                src: ['test/server/get_request-*.spec.js' ]

            },

            kmp_set_survey: {

              options: {

                 reporter: 'mochawesome',

                 reporterOptions: {

                   reportFilename: `output-set_survey`

                 }

             },

                src: ['test/server/set_survey-*.spec.js']

            },

            kmp_cache_instance: {

              options: {

                 reporter: 'mochawesome',

                 reporterOptions: {

                   reportFilename: `output-cache_instance`

                 }

             },

                src: ['test/server/cache_instance-*.spec.js']

            },

            kmp_obtain_cached_instance: {

              options: {

                 reporter: 'mochawesome',

                 reporterOptions: {

                   reportFilename: `output-obtain_cached_instance`

                 }

             },

                src: ['test/server/obtain_cached_instance-*.spec.js']

            }

        },

        // test client JS

        karma: {

            options: {

                singleRun: true,

                reporters: [ 'dots' ],

                configFile: 'test/client/config/karma.conf.js'

            },

            headless: {

                browsers: [ 'ChromeHeadless' ]

            },

            browsers: {

                browsers: [ 'Chrome', 'ChromeCanary', 'Firefox', 'Opera' /*,'Safari'*/ ],

            }

        },

        browserify: {

            development: {

                files: {

                    'public/js/enketo-webform-dev-bundle.js': [ 'public/js/src/main-webform.js' ],

                    'public/js/enketo-webform-edit-dev-bundle.js': [ 'public/js/src/main-webform-edit.js' ],

                    'public/js/enketo-webform-view-dev-bundle.js': [ 'public/js/src/main-webform-view.js' ],

                    'public/js/enketo-offline-fallback-dev-bundle.js': [ 'public/js/src/main-offline-fallback.js' ]

                },

                options: {

                    browserifyOptions: {

                        debug: true

                    }

                },

            },

            production: {

                files: {

                    'public/js/enketo-webform-bundle.js': [ 'public/js/src/main-webform.js' ],

                    'public/js/enketo-webform-edit-bundle.js': [ 'public/js/src/main-webform-edit.js' ],

                    'public/js/enketo-webform-view-bundle.js': [ 'public/js/src/main-webform-view.js' ],

                    'public/js/enketo-offline-fallback-bundle.js': [ 'public/js/src/main-offline-fallback.js' ]

                },

            },

            options: {

                // ensure that enketo-config and widgets are overridden in **enketo-core**

                transform: [

                    [ 'aliasify', {

                        aliases: pkg.aliasify.aliases,

                        global: true

                    } ]

                ]

            },

        },

        uglify: {

            all: {

                files: {

                    'public/js/enketo-webform-bundle.min.js': [ 'public/js/enketo-webform-bundle.js' ],

                    'public/js/enketo-webform-edit-bundle.min.js': [ 'public/js/enketo-webform-edit-bundle.js' ],

                    'public/js/enketo-webform-view-bundle.min.js': [ 'public/js/enketo-webform-view-bundle.js' ],

                    'public/js/enketo-offline-fallback-bundle.min.js': [ 'public/js/enketo-offline-fallback-bundle.js' ],

                },

            },

        },

        env: {

            develop: {

                NODE_ENV: 'develop'

            },

            test: {

                NODE_ENV: 'test'

            },

            production: {

                NODE_ENV: 'production'

            }

        },

        i18next: {

            locales: {

                cwd: 'locales/',

                expand: true,

                src: [ '*/' ],

                include: [ '**/translation.json', '**/translation-additions.json' ],

                rename: function( dest, src ) {

                    return dest + src + 'translation-combined.json';

                },

                dest: 'locales/'

            }

        }

    } );



    grunt.registerTask( 'client-config-file', 'Temporary client-config file', function( task ) {

        var CLIENT_CONFIG_PATH = 'public/temp-client-config.json';

        if ( task === 'create' ) {

            var config = require( './app/models/config-model' );

            grunt.file.write( CLIENT_CONFIG_PATH, JSON.stringify( config.client ) );

            grunt.log.writeln( 'File ' + CLIENT_CONFIG_PATH + ' created' );

        } else if ( task === 'remove' ) {

            grunt.file.delete( CLIENT_CONFIG_PATH );

            grunt.log.writeln( 'File ' + CLIENT_CONFIG_PATH + ' removed' );

        }

    } );



    grunt.registerTask( 'system-sass-variables', 'Creating _system_variables.scss', function() {

        var SYSTEM_SASS_VARIABLES_PATH = 'app/views/styles/component/_system_variables.scss';

        var config = require( './app/models/config-model' );

        grunt.file.write( SYSTEM_SASS_VARIABLES_PATH, '$base-path: "' + config.server[ 'base path' ] + '";' );

        grunt.log.writeln( 'File ' + SYSTEM_SASS_VARIABLES_PATH + ' created' );

    } );



    grunt.registerTask( 'widgets', 'generate widget reference files', function() {

        var content;

        var WIDGETS_JS_LOC = 'public/js/';

        var WIDGETS_JS = WIDGETS_JS_LOC + 'widgets.js';

        var WIDGETS_SASS_LOC = 'app/views/styles/component/';

        var WIDGETS_SASS = WIDGETS_SASS_LOC + '_widgets.scss';

        var PRE = '// This file is automatically generated with `grunt widgets`\n';

        var widgets = require( './app/models/config-model' ).server.widgets;

        var coreWidgets = require( './public/js/src/module/core-widgets' );

        var paths = Object.keys( widgets ).map( function( key ) {

            return coreWidgets[ widgets[ key ] ] || widgets[ key ];

        } );

        content = PRE + '\'use strict\';\n\nmodule.exports = [\n    ' +

            paths.map( function( p ) {

                return grunt.file.exists( WIDGETS_JS_LOC, p + '.js' ) ? 'require( \'' + p + '\' )' : '//' + p + ' not found';

            } ).join( ',\n    ' ) + '\n];\n';

        grunt.file.write( WIDGETS_JS, content );

        grunt.log.writeln( 'File ' + WIDGETS_JS + ' created' );

        content = PRE +

            paths.map( function( p ) {

                p = path.join( '../../', p );

                return grunt.file.exists( WIDGETS_SASS_LOC, p + '.scss' ) ? '@import "' + p + '"' : '//' + p + ' not found';

            } ).join( ';\n' ) + ';';

        grunt.file.write( WIDGETS_SASS, content );

        grunt.log.writeln( 'File ' + WIDGETS_SASS + ' created' );

    } );



    grunt.registerTask( 'default', [ 'i18next', 'widgets', 'css', 'js', 'uglify' ] );

    grunt.registerTask( 'js', [ 'client-config-file:create', 'widgets', 'browserify:production' ] );

    grunt.registerTask( 'js-dev', [ 'client-config-file:create', 'widgets', 'browserify:development' ] );

    grunt.registerTask( 'css', [ 'system-sass-variables:create', 'sass' ] );

    grunt.registerTask( 'test', [ 'env:test', 'js', 'css', 'mochaTest:all', 'karma:headless', 'jsbeautifier:test', 'jshint' ] );

    grunt.registerTask( 'test-browser', [ 'env:test', 'css', 'client-config-file:create', 'karma:browsers' ] );

    grunt.registerTask( 'develop', [ 'env:develop', 'i18next', 'js-dev', 'css', 'concurrent:develop' ] );

    grunt.registerTask( 'test-and-build', [ 'env:test', 'mochaTest:all', 'karma:headless', 'env:production', 'default' ] );

    grunt.registerTask( 'test-and-build-kmp', [ 'env:test', 'mochaTest:kmp', 'karma:headless', 'env:production', 'default' ] );

    grunt.registerTask( 'test-and-build-kmp_id', [ 'env:test', 'mochaTest:kmp_id', 'karma:headless', 'env:production', 'default' ] );

    grunt.registerTask( 'test-and-build-kmp_instanceId', [ 'env:test', 'mochaTest:kmp_instanceId', 'karma:headless', 'env:production', 'default' ] );

    grunt.registerTask( 'test-and-build-kmp_get_request', [ 'env:test', 'mochaTest:kmp_get_request', 'karma:headless', 'env:production', 'default' ] );

    grunt.registerTask( 'test-and-build-kmp_set_survey', [ 'env:test', 'mochaTest:kmp_set_survey', 'karma:headless', 'env:production', 'default' ] );

    grunt.registerTask( 'test-and-build-kmp_cache_instance', [ 'env:test', 'mochaTest:kmp_cache_instance', 'karma:headless', 'env:production', 'default' ] );

    grunt.registerTask( 'test-and-build-kmp_obtain_cached_instance', [ 'env:test', 'mochaTest:kmp_obtain_cached_instance', 'karma:headless', 'env:production', 'default' ] );

};

