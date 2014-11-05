app.factory('Job', ['$resource', function ($resource){
  return $resource('/jobs.json');
}]);
