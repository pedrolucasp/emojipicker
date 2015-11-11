// Oh Yeah Bitches!
var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('styles', function(){
  gulp.src('src/browser/sass/*.scss')
    .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
    .pipe(gulp.dest('./src/browser/css/'));
});
// Watch Task
gulp.task('default', function(){
  gulp.watch('src/browser/sass/*.scss', ['styles']);
});
