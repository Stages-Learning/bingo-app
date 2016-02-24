<!DOCTYPE html>
<html>
	<title>Stages Bingo Creator</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="css/bingo.min.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript">
		var __HASH__ = "<?php print $_GET['hash'];?>";
	</script>
	<div id="app-container" ng-app="bingo" ng-controller="BingoController" ng-class="appStyles">
		<section id="generation" class="page" aria-hidden="{{currentPageIndex == 0 ? 'false':'true'}}" generation-view></section>
	</div>
	
	<script type="text/javascript" src="js/vendor/angular.min.js"></script>
	<script type="text/javascript" src="js/vendor/angular-route.min.js"></script>
	<script type="text/javascript" src="js/vendor/jquery.min.js"></script>

	<script type="text/javascript" src="js/app/app.js"></script>
	<script type="text/javascript" src="js/app/controllers/BingoController.js"></script>
	<script type="text/javascript" src="js/app/directives/LandingViewDirective.js"></script>
	<script type="text/javascript" src="js/app/directives/CategorySelectionDirective.js"></script>
	<script type="text/javascript" src="js/app/directives/BoardSelectionDirective.js"></script>
	<script type="text/javascript" src="js/app/directives/ImageSelectionDirective.js"></script>
	<script type="text/javascript" src="js/app/directives/GenerationViewDirective.js"></script>
	<script type="text/javascript" src="js/app/filters/TechLanguageFilter.js"></script>
	<script type="text/javascript" src="js/app/filters/PackFilter.js"></script>
	<script type="text/javascript" src="js/app/filters/LabelFilter.js"></script>
	<script type="text/javascript" src="js/app/filters/EligibleFilter.js"></script>
	<script type="text/javascript" src="js/app/services/DBService.js"></script>
	<script type="text/javascript" src="js/app/services/ImageService.js"></script>
</html>