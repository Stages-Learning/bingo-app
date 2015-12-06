'use strict';

angular.module('bingo')
  .controller('BingoController', function ($scope,ImageService,$timeout) {
  	var trace = angular.trace;

  	$scope.currentPageIndex = 1;
  	$scope.Math = window.Math;
  	$scope.appStyles = {render:false};
  	$scope.currentConfiguration = {pack:null,rows:0,cols:0};
  	$scope.currentCardRows = 0;
  	$scope.currentCardCols = 0;
    $scope.selectedImages = {};
    $scope.selectedCount = 0;
    $scope.selectedMax = 16;
    $scope.numCards = {};

    ImageService.load().then(function(){
        $scope.appStyles.render = true;
        $scope.packs = ImageService.packs();
        $scope.listing = ImageService.listing();
        $scope.lookup = ImageService.lookup();
    });
    
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
    $scope.selectCard = function()
    {
      $scope.currentPageIndex = 3;
    };

    $scope.selectCardSize = function(rows,cols)
    {
    	$scope.currentConfiguration.rows = rows;
    	$scope.currentConfiguration.cols = cols;
      trace($scope.currentConfiguration);
    };

    $scope.updateImageList = function()
    {
      var count = 0;

      for(var prop in $scope.selectedImages)
      {
        var selected = $scope.selectedImages[prop];
        $scope.lookup[prop].selected = selected;
        if(selected) count++;
      }

      $scope.selectedCount = count;
    };
    $scope.updateMax = function()
    {
      var numCards = parseInt($scope.numCards);
      if(numCards === 1) $scope.selectedMax = 16;
      else if(numCards === 2) $scope.selectedMax = 24;
      else $scope.selectedMax = 32;

      deselect();
    };

    function deselect()
    {
      if($scope.selectedMax >= $scope.selectedCount) return;

      for(var i = $scope.listing.length - 1; i >= 0; i--)
      {
        var image = $scope.listing[i];
        if(image.selected)
        {
          image.selected = false;
          $scope.selectedCount --;
          $scope.selectedImages["image-"+image.id] = false;
          deselect();
          break;
        }
      }
    }



  });
