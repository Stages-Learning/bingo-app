'use strict'; angular.module("bingo").directive('boardSelection', function($document,$timeout,$filter,ImageService) {
    return {
      restrict: 'A',
      templateUrl: 'views/board-selection.html',

      link:function($scope,element,attr)
      {
        var trace = angular.trace;
        var buttons;
        var timeout;
        $scope.grid = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
        $scope.sampleGrid = [];
        $scope.randomImages = [];
        $scope.scatterCSS = "";
        

        $timeout(initialize,0);

        $scope.setSampleGrid = function(row,col)
        {
          var total = row * col;
          $scope.sampleGrid = [];
          for(var i = 1; i <= total; i++)
          {
            $scope.sampleGrid.push(i);
          }
          $scope.randomImages = randomizeImages();
        };

       	function initialize()
       	{
       		buttons =  element.find("button");
       		buttons.on("mouseover",onMouseOver);
       		buttons.eq(0).parent().on("mouseout",onMouseOut);
       		buttons.on("click",onSelect);
       	}

       	function onSelect(event)
       	{
       		var button = angular.element(event.currentTarget);
        	var row = parseInt(button.attr("data-row"));
        	var column = parseInt(button.attr("data-column"));
        	clearSelectedState();
        	angular.forEach(buttons,applyState,{row:row,column:column,state:"selected"});
       	}

       	function onMouseOut(event)
       	{
       		$timeout.cancel(timeout);
       		timeout = $timeout(clearHoverState,200);
       	}
       	function clearHoverState()
       	{
       		$timeout.cancel(timeout);
       		buttons.removeClass("hovered");
       	}
       	function clearSelectedState()
       	{
       		buttons.removeClass("selected");
       	}

        function onMouseOver(event)
        {
        	var button = angular.element(event.currentTarget);
        	var row = parseInt(button.attr("data-row"));
        	var column = parseInt(button.attr("data-column"));
        	clearHoverState();
        	angular.forEach(buttons,applyState,{row:row,column:column,state:"hovered"});
        }

        function randomizeImages()
        {
          var listing = $filter('pack')(ImageService.listing(),$scope.currentConfiguration.pack);
          $scope.scatterCSS = "";
          for(var i = 0, count = listing.length; i < count; i++)
          {
            var rotation = Math.floor(Math.random() * 24 - 12);
            $scope.scatterCSS += "img.card-"+i + " {-webkit-transform: rotate("+rotation+"deg) translateY(-50%); transform: rotate("+rotation+"deg) translateY(-50%);} ";
          }
          return listing;
        }

        function applyState(button,index)
        {
        	button = angular.element(button);
        	var column = parseInt(button.attr("data-column"));
        	var row = parseInt(button.attr("data-row"));
        	if(row <= this.row && column <= this.column) button.addClass(this.state);
        }

      }  
    };
  });