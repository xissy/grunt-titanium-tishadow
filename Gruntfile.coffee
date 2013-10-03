
module.exports = (grunt) ->
  for key of grunt.file.readJSON('package.json').devDependencies
    if key isnt 'grunt' and key.indexOf('grunt') is 0
      grunt.loadNpmTasks key
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      options:
        bare: true
        sourceMap: true
      alloy:
        files: [
          expand: true
          cwd: 'ti/src/'
          src: [ '**/*.coffee' ]
          dest: 'ti/app/'
          ext: '.js'
        ]
      test:
        files: [
          expand: true
          cwd: 'ti/tests/'
          src: [ '**/*.coffee' ]
          dest: 'ti/spec/'
          ext: '.js'
        ]

    jade:
      alloy:
        files: [
          expand: true
          cwd: 'ti/src/'
          src: [ '**/*.jade' ]
          dest: 'ti/app/'
          ext: '.xml'
        ]

    ltss:
      alloy:
        files: [
          expand: true
          cwd: 'ti/src/'
          src: [ '**/*.ltss' ]
          dest: 'ti/app/'
          ext: '.tss'
        ]

    copy:
      alloy:
        files: [
          expand: true
          dot: true
          cwd: 'ti/src/'
          dest: 'ti/app/'
          src: [
            '**'
            '!**/*.coffee'
            '!**/*.jade'
            '!**/*.ltss'
          ]
        ]

    tishadow:
      options:
        projectDir: 'ti/'
        update: true
        withAlloy: true
      run:
        command: 'run'
        options:
          alloy:
            platform: [ 'ios' ]
      test:
        command: 'spec'
        options:
          alloy:
            platform: [ 'ios' ]
      clear:
        command: 'clear'
        options:
          alloy:
            platform: [ 'ios' ]

    watch:
      alloy:
        files: [ 'ti/src/**/*' ]
        tasks: [
          'build:ti'
          'tishadow:run'
        ]
        options:
          spawn: false

    clean: 
      ti: [
        'ti/Resources/'
        'ti/app/'
        'ti/build/'
        'ti/spec/'
      ]


  grunt.registerTask 'default', [
    'build'
  ]

  grunt.registerTask 'build', [
    'build:ti'
  ]

  grunt.registerTask 'build:ti', [
    'coffee:alloy'
    'jade:alloy'
    'ltss:alloy'
    'copy:alloy'
  ]

  grunt.registerTask 'dev', [
    'build:ti'
    'tishadow:run'
    'watch:alloy'
  ]

  grunt.registerTask 'test', [
    'tishadow:clear'
    'clean'
    'build:ti'
    'coffee:test'
    'tishadow:test'
  ]
