module.exports = function(grunt) {
  var config = {
      pkg: grunt.file.readJSON('package.json'),
      local: grunt.file.readJSON('my.config.json'),
      env: process.env
    };

  require('load-grunt-tasks')(grunt);
  grunt.util._.extend(config, loadConfig('./tasks/options/'));
  grunt.loadTasks('tasks');
  grunt.initConfig(config);


  function loadConfig(path) {
    var glob = require('glob');
    var object = {};
    var key;
   
    glob.sync('*', {cwd: path}).forEach(function(option) {
      key = option.replace(/\.js$/,'');
      object[key] = require(path + option);
    });
   
    return object;
  }

};