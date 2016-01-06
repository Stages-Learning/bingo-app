'use strict'; angular.module("bingo").directive('generationView', function($document,$timeout) {
    return {
      restrict: 'A',
      templateUrl: 'views/generation-view.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;
      }  
    };
  });