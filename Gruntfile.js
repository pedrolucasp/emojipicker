module.exports = function(grunt) {

  grunt.initConfig({
    jshint: {
      files: ['Gruntfile.js', 'src/**/*.js'],
      options: {
        globals: {
          jQuery: true
        }
      }
    },
    watch: {
      files: ['<%= jshint.files %>'],
      tasks: ['jshint']
    },
    'electron-debian-installer': {
      app: {
        options: {
          arch: 'amd64'
        },
        src: 'dist/emojipicker-linux-x64/',
        dest: 'dist/pkgs/'
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-electron-debian-installer');

  grunt.registerTask('default', ['jshint', 'electron-debian-installer']);

};