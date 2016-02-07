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
        	$scope.countOptions.push({name:i,value:i,price:generatePrice(i)});
        }

        $scope.onEnter = function(e,index)
        {
          if(e.keyCode !== 13) return;
          e.target.blur();
        };

        function generatePrice(i)
        {
          //4   8 12  16
          //0.5 1 1.5 2
          var price = i * (1/8);
          return price.toFixed(2);

          /*
            4,0.5
            8,1
            16,2

            y = mx +b

            1-0.5/4 = .5/4 = 1/8

            y= 1/8x + b

            2 = 1/8(16) + b
            2 = 2 + b;
            b =0;



          */

        }

      }  
    };
  });