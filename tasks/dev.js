module.exports = function(grunt) {
    grunt.registerTask('dev', ['copy:dev','less:dev','replace:dev','watch:dev']);
};