var bingo = (function(self){

	angular.module('bingo', []);

	  angular.trace = function (){
	    for(var i = 0, count = arguments.length; i < count; i++)
	    {
	      try {console.log(arguments[i]);}
	      catch (error){}
	    }
	  };


	return self;
}(bingo = bingo || {}));