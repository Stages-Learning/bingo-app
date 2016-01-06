angular.module('bingo').service('ImageService', function($http,$filter)
{
	var trace = angular.trace;
	var lookup = {};
	var listing = [];
	var packs = [];

	function load()
	{
		return $http.post('php/scripts/ImageService.php', {request:"listing"}).success(onImagesLoaded);
	}

	function onImagesLoaded(data)
	{
		lookup = {};
		listing = data.cards;
		packs = $filter('pack')(data.cards).sort(sortPacks);

		for(var i = 0, count = listing.length; i < count; i++)
		{
			var card = listing[i];
			lookup['image-'+card.id] = card;
			card.label = card.originalLabel = $filter('label')(card.label);
		}
	}

	function getListing()
	{
		return listing;
	}
	function getPacks()
	{
		return packs;
	}
	function getLookup()
	{
		return lookup;
	}
	function sortPacks(a,b)
	{
		if(a.label > b.label) return 1;
		if(a.label < b.label) return -1;
		return 0;
	}

	return {
		load: load,
		lookup: getLookup,
		listing: getListing,
		packs: getPacks
	}
});