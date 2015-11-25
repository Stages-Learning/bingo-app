angular.module('bingo').service('ImageService', function($http)
{
	var trace = angular.trace;
	var lookup = {};
	var listing = [];

	function load()
	{

	}

	return {
		load: load,
		lookup: lookup,
		listing: listing
	}
});