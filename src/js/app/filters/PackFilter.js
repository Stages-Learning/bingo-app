angular.module('bingo').filter('pack', function(ImageService) {
    return function(listing,target) {
    	if(!listing) return listing;
        var trace = angular.trace;
    	var results = [];
    	var packs = [];

    	for(var i = 0, count = listing.length; i < count; i++)
    	{
    		var card = listing[i];

            if(target)
            {
                if(card.pack === target) results.push(card);
                continue;
            }

    		if(packs.indexOf(card.pack) === -1)
    		{
    			packs.push(card.pack);
    			results.push(card);
    		}
    	}

    	return results;
    };
});