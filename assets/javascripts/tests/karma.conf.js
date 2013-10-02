module.exports = function (config) {
  config.set({
    basePath: '../',

    files: [
      'libs/angular.min.js',
      // 'libs/angular-*.js',
      'tests/libs/angular-mocks.js',
      'dist/main.js',
      'tests/unit/**/*.js'
    ],

    frameworks: ['jasmine'],

    autoWatch: true,

    browsers: ['Chrome'],

    junitReporter: {
      outputFile: 'test_out/unit.xml',
      suite: 'unit'
    }
  });
};
