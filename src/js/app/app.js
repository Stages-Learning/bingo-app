var bingo = (function(self){

	angular.module('bingo', []).config(function($sceProvider){
		$sceProvider.enabled(false);
		//setTimeout(function(){window.parent.postMessage({quantity:5},"http://bingo-development.myshopify.com"); angular.trace("posted")},5000);
	});

	angular.trace = function (){
		for(var i = 0, count = arguments.length; i < count; i++)
		{
		  try {console.log(arguments[i]);}
		  catch (error){}
		}
	};
	return self;
}(bingo = bingo || {}));