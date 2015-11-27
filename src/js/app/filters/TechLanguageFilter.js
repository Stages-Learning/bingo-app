angular.module('bingo').filter('tech', function(DBService) {
    return function(val) {
    	if(val) val = val.replace(/&quot;/gim,'"').replace(/&apos;/gim,"'");
    	return val;
    };
});