angular.module('bingo').filter('eligible', function() {
    return function(pool,selected) {
    	if(!pool) return pool;
        var trace = angular.trace;
    	var results = [];
    	
        for(var i = 0, count = pool.length; i < count; i++)
        {
            if(selected.indexOf(pool[i]) === -1) results.push(pool[i]);
        }

    	return results;
    };
});