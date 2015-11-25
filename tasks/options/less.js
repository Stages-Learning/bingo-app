module.exports = {
  dev: {
    options: {compress: true, yuicompress: true, optimization: 2},
    files:
    {
      "<%= local.staging %>/css/bingo.min.css" : "src/less/bingo.less"
    }
  },
  deploy: {
    options: {compress: true, yuicompress: true, optimization: 2},
    files:
    {
      "<%= local.deploy %>/css/bingo.min.css" : "src/less/bingo.less"
    }
  },
}