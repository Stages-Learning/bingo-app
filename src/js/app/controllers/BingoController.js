'use strict';

angular.module('bingo')
  .controller('BingoController', function ($scope,$filter,ImageService,DBService,$timeout,$window,$document) {
  	var trace = angular.trace;

  	$scope.currentPageIndex = 0;
  	$scope.Math = window.Math;
  	$scope.appStyles = {render:false};
  	$scope.currentConfiguration = {pack:null,rows:0,cols:0};
  	$scope.currentCardRows = 0;
  	$scope.currentCardCols = 0;
    $scope.selectedImages = {};
    $scope.selectedCount = 0;
    $scope.selectedMax = 25;
    $scope.numCards = 4;
    $scope.labelManagement = "auto";
    $scope.mode = typeof __HASH__ !== "undefined" ? "download" : "creation";

    ImageService.load().then(function(){
        $timeout(function(){
            $scope.appStyles.render= true;
        },500);
        $scope.packs = ImageService.packs();
        $scope.sourceListing = $scope.listing = ImageService.listing();
        $scope.lookup = ImageService.lookup();
    });

    $scope.getPagePosition = function(index){
    	if(index === $scope.currentPageIndex) return "center";
    	if(index < $scope.currentPageIndex) return "left";
    	return "right";
    };
    $scope.setCurrentPage = function(index)
    {
      $window.parent.postMessage({scrollTo:0},"*");
      $window.scrollTo(0, 0);
    	$scope.currentPageIndex = index;
    };

    $scope.selectCategory = function()
    {
      $scope.listing = $filter('card')($scope.sourceListing,$scope.currentConfiguration.pack);
      $scope.setCurrentPage(2);
    };
    $scope.selectCard = function()
    {
      $scope.setCurrentPage(3);
    };

    $scope.selectCardSize = function(rows,cols)
    {
      var numCards = parseInt($scope.numCards);
    	$scope.currentConfiguration.rows = rows;
    	$scope.currentConfiguration.cols = cols;
      $scope.updateMax();
    };

    $scope.resetCount  = function()
    {
      for(var i = $scope.listing.length - 1; i >= 0; i--)
      {
        var image = $scope.listing[i];
        image.label = image.originalLabel;
        if(image.selected)
        {
          image.selected = false;
        }
      }

      $scope.selectedImages = {};
      $scope.selectedCount = 0;
      trace("reset");
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
     // if(numCards === 1) $scope.selectedMax = ($scope.currentConfiguration.rows * $scope.currentConfiguration.cols);
      //else if(numCards === 2) $scope.selectedMax = Math.ceil($scope.currentConfiguration.rows * $scope.currentConfiguration.cols*1.5);
      //else $scope.selectedMax = ($scope.currentConfiguration.rows * $scope.currentConfiguration.cols*2);

      $scope.selectedMax = Math.min($scope.listing.length,$scope.currentConfiguration.rows * $scope.currentConfiguration.cols*2)
      deselect();
    };

    $scope.selectRandomImages = function()
    {
      deselect(true);

      var images = $scope.listing.concat();
      images.sort(shuffle);
      images = images.slice(0,$scope.selectedMax);

      for(var i = 0, count = images.length; i < count; i++)
      {
        var image = images[i];
        image.selected = true;
        $scope.selectedImages["image-"+image.id] = true;
      }

      $scope.selectedCount = $scope.selectedMax;
    };

    $scope.clearSelections = function()
    {
      deselect(true);
    };

    $scope.generatePDF = function(){
      var cards = [];
      generateMasterPool();
      for(var i = 0; i < $scope.numCards; i++)
      {
        cards.push(generateCard());
      }
      $scope.saving = true;
      DBService.saveGame($scope.currentConfiguration.pack,$scope.currentConfiguration.rows,$scope.currentConfiguration.cols,$scope.labelManagement !== "none" ? "true":"false",cards,$scope.masterPool).then(renderDownloadButton);
    };

    $scope.generateDownload = function()
    {
      $scope.saving = true;
      DBService.generateDownload(__HASH__).then(renderFinalDownloadButton);
    };

    function renderDownloadButton(data)
    {
      //$scope.saving = false;
    }
    function renderFinalDownloadButton(data)
    {
      $scope.saving = false;
      $scope.downloadLink = DBService.downloadLink();
    }

    function generateMasterPool()
    {
      $scope.masterPool = [];
      for(var id in $scope.selectedImages)
      {
        var image = $scope.lookup[id];
        $scope.masterPool.push({label:image.label,src:image.path});
      }
    }

    function generateCard()
    {
      return addImageToCard([]);
    }

    function addImageToCard(card)
    {
       var pool = refillCardPool(card);
       var numImages = $scope.currentConfiguration.rows * $scope.currentConfiguration.cols;
       var image = pool[Math.floor(Math.random()*pool.length)];
       card.push(image);
       if(card.length < numImages) addImageToCard(card);
       return card;
    }

    function refillCardPool(card)
    {
      return $filter('eligible')($scope.masterPool,card);
    }


    function shuffle(a,b)
    {
      return Math.random() > 0.5 ? 1 : -1;
    }

    function deselect(all)
    {

      if($scope.selectedMax >= $scope.selectedCount && !all) return;

      for(var i = $scope.listing.length - 1; i >= 0; i--)
      {
        var image = $scope.listing[i];
        image.label = image.originalLabel;
        if(image.selected)
        {
          image.selected = false;
          $scope.selectedCount --;
          $scope.selectedImages["image-"+image.id] = false;
          deselect(all);
          break;
        }
      }
    }



  });
