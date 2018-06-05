module.exports = grunt => {
  grunt.initConfig({
    uglify: {
      my_target: {
        files: {
          'public/javascripts/vendor/all.js': ['public/javascripts/vendor/all.js'],
        },
      },
    },
    bower_concat: {
      all: {
        dest: 'public/javascripts/vendor/all.js',
        dependencies: {
          underscore: 'jquery',
          backbone:   'underscore',
        },
      },
    },
  })

  ;['grunt-bower-concat', 'grunt-contrib-uglify'].forEach(grunt.loadNpmTasks, grunt)

  grunt.registerTask('default', ['bower_concat', 'uglify'])
}
