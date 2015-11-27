'use strict';

angular.module('bingo')
  .controller('BingoController', function ($scope,ImageService,$timeout) {
  	var trace = angular.trace;

  	$scope.currentPageIndex = 0;
  	$scope.Math = window.Math;
  	$scope.appStyles = {render:false};
  	$scope.currentCategory = null;
  	$scope.currentCardRows = 0;
  	$scope.currentCardCols = 0;
  	$timeout(function(){
  		$scope.appStyles.render = true;
  	},600);
    
    $scope.getPagePosition = function(index){
    	if(index === $scope.currentPageIndex) return "center";
    	if(index < $scope.currentPageIndex) return "left";
    	return "right";
    };
    $scope.setCurrentPage = function(index)
    {
    	$scope.currentPageIndex = index;
    };

    $scope.selectCategory = function()
    {
    	$scope.currentPageIndex = 2;
    };

    $scope.selectCardSize = function(rows,cols)
    {
    	$scope.currentCardRows = rows;
    	$scope.currentCardCols = cols;
    };

  });
