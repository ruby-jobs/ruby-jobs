app.controller('JobsCtrl', ['Job','$scope', function (Job, $scope){

  var page = 1;
  var loadingMore = true;
  var hasMorePage = true;

  $scope.jobs = [];

  ($scope.load = function () {
    $scope.loading = true;
    
    loadingMore = true;

    var params = { page: page, modality: $scope.modality };
    var jobs = Job.query(params, function () {
      angular.forEach(jobs, function (job) { $scope.jobs.push(job); });

      hasMorePage = jobs.length > 0;
      loadingMore = false;
      $scope.loading = false;
    });
    
  })();

  $scope.loadMore = function() {
    if (loadingMore || !hasMorePage) return;

    page += 1;
    $scope.load();
  };

  $scope.filter = function() {
    $scope.jobs = [];
    page = 1;
    $scope.load();
  };
}]);
