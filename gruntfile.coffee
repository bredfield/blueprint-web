module.exports = (grunt) ->
  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    concat:
      dist:
        #Libraries go Here
        src: [
          "assets/components/jquery/jquery.js",
          "assets/components/angular/angular.js",
          "assets/javascripts/<%= pkg.name %>.js"
        ]
        dest: "assets/javascripts/application.js"
    uglify:
      options:
        banner: "/*! <%= pkg.name %> <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n"
      build:
        src: "assets/javascripts/application.js"
        dest: "application.min.js"
    less:
      development:
        options:
          paths: ["assets/stylesheets"]
        files:
          "assets/stylesheets/application.css": "assets/stylesheets/<%= pkg.name %>.less"
      production:
        options:
          paths: ["assets/stylesheets"]
          yuicompress: true
        files:
          "application.min.css": "assets/stylesheets/<%= pkg.name %>.less"
    coffee:
      scripts:
        files:    
          #Extra app .coffee files go here
          "assets/javascripts/<%= pkg.name %>.js": [
            "assets/javascripts/<%= pkg.name %>.coffee"
          ]
      tests:
        files:
          "assets/javascripts/tests/unit/main.js": "assets/javascripts/tests/unit/**/*.coffee"
    karma:
      unit:
        configFile: "assets/javascripts/tests/karma.conf.js"
        singleRun: false
    watch:
      scripts:
        files: "assets/javascripts/**/*.coffee"
        tasks: ["coffee:scripts", "concat"]
      tests:
        files: ["assets/javascripts/tests/**/*.coffee"]
        tasks: ["coffee:tests"]
      styles:
        files: "assets/stylesheets/**/*.less"
        tasks: ["less:development"]
  
  # Load the plugins
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-karma"
  
  # Tasks
  grunt.registerTask "default", ["reset"]
  grunt.registerTask "reset", ["coffee", "concat", "less:development", "watch"]
  grunt.registerTask "launch", ["uglify", "less:production"]