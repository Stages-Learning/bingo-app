angular.module('bingo').service('DBService', function($http)
{
	var trace = angular.trace;
	var tech = {};

	function load()
	{

	}

	return {
		loadContent: load,
		techLanguage: tech
	}
});