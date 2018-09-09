const removeWhitespace = template => template.replace(/\s\s+/mg, '')
const extractFileName  = file => file.match(/\/([^/]+)\.hbs$/)[1]

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
    handlebars: {
      all: {
        files: {
          'public/javascripts/handlebars_templates.js': ['handlebars/**/*.hbs'],
        },
        options: {
          processContent: removeWhitespace,
          processName:    extractFileName,
        },
      },
    },
  })

  // ;['grunt-bower-concat', 'grunt-contrib-uglify'].forEach(grunt.loadNpmTasks, grunt)
  ;['grunt-bower-concat', 'grunt-contrib-handlebars'].forEach(grunt.loadNpmTasks, grunt)

  // grunt.registerTask('default', ['bower_concat', 'uglify'])
  grunt.registerTask('default', ['bower_concat'])
}
