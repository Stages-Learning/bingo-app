
module.exports = {
  dev:{
    files:[
      {expand: true, cwd:'src/html', src: ["**/*"], dest: "<%= local.staging %>"},
      {expand: true, cwd:'src/views', src: ["**/*"], dest: "<%= local.staging %>/views"},
      {expand: true, cwd:'src/server', src: ["**/*","!config/*.php"], dest: "<%= local.staging %>/php"},
      {expand: true, cwd:'assets/images', src: ["**/*"], dest: "<%= local.staging %>/images"},
      {expand: true, cwd:'src/js', src: ["**/*"], dest: "<%= local.staging %>/js"}
    ]
  },
  deploy:{
    files:[
      {expand: true, cwd:'src/html', src: ["**/*","!index.php","!lti_include.*"], dest: "<%= local.deploy %>"},
      {expand: true, cwd:'src/remote', src: ["**/*"], dest: "<%= local.deploy %>"},
      {expand: true, cwd:'src/server', src: ["**/*","!config/*.php"], dest: "<%= local.deploy %>/php"},
      {expand: true, cwd:'src/images', src: ["**/*"], dest: "<%= local.deploy %>/images"},
      {expand: true, cwd:'src/js', src: ["**/*","!app/"], dest: "<%= local.deploy %>/js"}
    ]
  }
}