angular.module('bingo').service('DBService', function($http)
{
	var trace = angular.trace;
	var tech = {};

	function load()
	{

	}

	function saveGame(category,rows,cols,cards)
	{
		return $http.post('php/scripts/DBService.php', {request:"save",hash:generateHash(),category:category.toLowerCase(),rows:rows,cols:cols,cards:cards}).success(onSaveComplete);
	}

	function onSaveComplete(data)
	{
		link = data.url;
	}

	function generateHash()
	{
		return randomString(32,'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
	}

	function downloadLink()
	{
		return link;
	}
	return {
		saveGame:saveGame,
		downloadLink: downloadLink
	}

	
	function randomString(length, chars) 
	{
   		var result = '';
    	for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)];
    	return result;
	}
});