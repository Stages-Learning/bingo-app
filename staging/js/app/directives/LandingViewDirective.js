'use strict'; angular.module("bingo").directive('landingView', function($document,$timeout) {
    return {
      restrict: 'A',
      templateUrl: 'views/landing.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;
      }  
    };
  });