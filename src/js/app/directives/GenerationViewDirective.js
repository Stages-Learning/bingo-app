'use strict'; angular.module("bingo").directive('generationView', function($document,$timeout,ImageService) {
    return {
      restrict: 'A',
      templateUrl: 'views/generation-view.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;

        $scope.free = false;
        $scope.$watch("currentConfiguration.pack",onPackSelect);
        $scope.emailRegExp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

        function onPackSelect(val)
        {
        	if(!val) return;
        	var pack = ImageService.packLookup[val];
        	$scope.free = pack.free;
        }
      }  
    };
  });