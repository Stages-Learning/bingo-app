angular.module('bingo').filter('label', function(ImageService) {
    return function(string) {
    	if(!string) return string;
        var trace = angular.trace;

        string = (string.substr(0,1).toUpperCase() + string.substr(1)).replace(/\d{1,2}$/gim,"");
        return string;
    };
});