module.exports = {
  dev: {
      files: ['src/html/**/*','src/js/**/*','src/less/**/*','src/server/**/*','assets/**/*','src/views/**/*'],
      tasks:  ['copy:dev','less:dev'],
      options: {
        spawn: false,
      }
  }
}