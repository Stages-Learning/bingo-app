module.exports = function(grunt) {
    grunt.registerTask('deploy', ['uglify:deploy','copy:deploy','less:deploy','replace:deploy']);
};