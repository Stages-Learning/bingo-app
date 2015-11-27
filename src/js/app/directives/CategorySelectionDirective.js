'use strict'; angular.module("bingo").directive('categorySelection', function($document,$timeout) {
    return {
      restrict: 'A',
      templateUrl: 'views/category-selection.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;
      }  
    };
  });