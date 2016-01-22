'use strict'; angular.module("bingo").directive('imageSelection', function($document,$timeout) {
    return {
      restrict: 'A',
      templateUrl: 'views/image-selection.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;
        $scope.countOptions = [];
        for(var i = 4; i <= 36; i+=4)
        {
        	$scope.countOptions.push({name:i,value:i});
        }

        $scope.onEnter = function(e,index)
        {
          if(e.keyCode !== 13) return;
          e.target.blur();
        };
      }  
    };
  });