'use strict'; angular.module("bingo").directive('screen', function($document,$window,$timeout) {
    return {
      restrict: 'A',
      link:function($scope,element,attr)
      {
        var trace = angular.trace;
        var index = element.index();
        var promise;

        $scope.$watch("currentPageIndex",onPageIndexChange);

        if(index > 0) element.addClass("right");

        function onPageIndexChange(current,old)
        {
          if(promise) $timeout.cancel(promise)

          if(old === index && current !== old)
          {
            element.attr("class","page visible " + getPagePosition(current));
            promise = $timeout(function(){
              element.removeClass("visible");
            },500);
          }
          else if(index === current) 
          {
            element.addClass("visible");
            promise = $timeout(function(){
              element.removeClass("left center right").addClass(getPagePosition(current));
              $window.parent.postMessage({scrollTo:0,height:element.height()},"*");
            },10);
          }

        }

        function getPagePosition(val)
        {
          if(index === val) return "center";
          if(index < val) return "left";
          return "right";
        }


        $timeout(function(){
          //trace($scope.currentPageIndex,element,element.attr("id"));
        },1000);
        
       
      }  
    };
  });