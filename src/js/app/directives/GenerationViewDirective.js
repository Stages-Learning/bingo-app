'use strict'; angular.module("bingo").directive('generationView', function($document,$timeout,ImageService) {
    return {
      restrict: 'A',
      templateUrl: 'views/generation-view.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;

        $scope.free = false;
        $scope.$watch("currentConfiguration.pack",onPackSelect);

        function onPackSelect(val)
        {
        	if(!val) return;
        	var pack = ImageService.packLookup[val];
        	$scope.free = pack.free;
        }
      }  
    };
  });