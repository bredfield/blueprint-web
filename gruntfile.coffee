module.exports = (grunt) ->
  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    concat:
      dist:
        #Libraries go Here
        src: ["assets/javascripts/libs/jquery-2.0.3.js", "assets/javascripts/libs/angular.min.js", "assets/javascripts/app.js"]
        dest: "assets/javascripts/dist/main.js"
    uglify:
      options:
        banner: "/*! <%= pkg.name %> <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n"
      build:
        src: "assets/javascripts/dist/main.js"
        dest: "build/main.min.js"
    less:
      development:
        options:
          paths: ["assets/stylesheets"]
        files:
          "assets/stylesheets/style.css": "assets/stylesheets/style.less"
      production:
        options:
          paths: ["assets/stylesheets"]
          yuicompress: true
        files:
          "style.css": "assets/stylesheets/style.less"
    coffee:
      scripts:
        files:    
          #Extra app .coffee files go here
          "assets/javascripts/app.js": ["assets/javascripts/app.coffee"]
      tests:
        files:
          "assets/javascripts/tests/unit/main.js": "assets/javascripts/tests/unit/**/*.coffee"
    karma:
      unit:
        configFile: "assets/javascripts/tests/karma.conf.js"
        singleRun: false
    haml:
      dist:
        files:
          "index.html": "index.haml"
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
      haml:
        files: "index.haml"
        tasks: ["haml"]
  
  # Load the plugins
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-haml"
  grunt.loadNpmTasks "grunt-karma"
  
  # Tasks
  grunt.registerTask "default", ["reset"]
  grunt.registerTask "reset", ["haml", "coffee", "concat", "less:development", "watch"]
  grunt.registerTask "launch", ["uglify", "less:production"]