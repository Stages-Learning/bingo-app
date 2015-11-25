module.exports = {
  deploy:{
    options: {
      sourceMap : true,
      sourceMapIncludeSources : true,
      mangle: false
    },
    files:{
      "<%= local.deploy %>/js/app/bingo.min.js": ["src/js/app/app.js"],    }
  }
}