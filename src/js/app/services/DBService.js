angular.module('bingo').service('DBService', function($http,$window)
{
	var trace = angular.trace;
	var tech = {};
	var cardNumber;
	var pack;
	var hash;
	var link = "";

	function load()
	{

	}

	function saveGame(category,rows,cols,labels,cards,pool)
	{
		hash = generateHash();
		cardNumber = cards.length;
		pack = category.toUpperCase();
		return $http.post('php/scripts/DBService.php', {request:"save",hash:hash,category:category.toLowerCase(),rows:rows,cols:cols,labels:labels,cards:cards,pool:pool}).success(onSaveComplete);
	}
	function generateDownload(hash)
	{
		return $http.post('php/scripts/DBService.php', {request:"generateFile",hash:hash}).success(onDownloadComplete);
	}

	function onSaveComplete(data)
	{
		//link = data.url;
		$window.parent.postMessage({quantity:cardNumber,pack:pack,hash:hash},"http://bingo-development.myshopify.com");
	}
	function onDownloadComplete(data)
	{
		trace("generated");
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
		generateDownload: generateDownload,
		downloadLink: downloadLink
	}

	
	function randomString(length, chars) 
	{
   		var result = '';
    	for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)];
    	return result;
	}
});