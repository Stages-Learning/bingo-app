angular.module('bingo').filter('card', function(ImageService) {
    return function(listing,pack) {
    	if(!listing) return listing;
        var trace = angular.trace;
    	var results = [];

    	for(var i = 0, count = listing.length; i < count; i++)
    	{
    		var card = listing[i];
    		if(card.pack === pack) results.push(card);
    	}

    	return results;
    };
});