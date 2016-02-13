'use strict'; angular.module("bingo").directive('imageSelection', function($document,$timeout,ImageService) {
    return {
      restrict: 'A',
      templateUrl: 'views/image-selection.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;

        $scope.$watch("currentConfiguration.pack",setPrice);
        

        $scope.onEnter = function(e,index)
        {
          if(e.keyCode !== 13) return;
          e.target.blur();
        };

        function setPrice(val)
        {
          if(!val) return;

          var pack = ImageService.packLookup[val];
          $scope.countOptions = [];
          for(var i = 4; i <= 36; i+=4)
          {
            $scope.countOptions.push({name:i,value:i,price:generatePrice(i,pack)});
          }
        }

        function generatePrice(i,pack)
        {
          if(pack.free) return "0.00";
          var price = i * (1/8);
          return price.toFixed(2);
        }

      }  
    };
  });