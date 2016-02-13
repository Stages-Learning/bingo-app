angular.module('bingo').filter('free', function(ImageService) {
    return function(packs,free) {
    	if(!packs) return packs;
        var trace = angular.trace;
    	var results = [];

    	for(var i = 0, count = packs.length; i < count; i++)
    	{
    		var pack = packs[i];
    		if(pack.free === free) results.push(pack);
    	}

    	return results;
    };
});