app.controller('JobsCtrl', ['Job','$scope', function (Job, $scope){

  var page = 1;
  var loadingMore = true;
  var hasMorePage = true;

  $scope.jobs = [];

  ($scope.load = function () {
    $scope.loading = true;
    
    loadingMore = true;

    Job.query({ page: page, filter: $scope.filter }, function (jobs) {
      
      angular.forEach(jobs, function (job) {
        $scope.jobs.push(job);
      });

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

  $scope.filterJob = function() {
    page = 1;
    $scope.loading = true;

    Job.query({ page: page, filter: $scope.filter }, function (data) {
      $scope.jobs = data;

      hasMorePage = $scope.jobs.length > 0;
      loadingMore = false;
      
      $scope.loading = false;
    });
  };
  
}]);
