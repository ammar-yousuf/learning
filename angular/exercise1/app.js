(function(){
	var app = angular.module('gemStore', [ ]);

	app.controller('StoreController', function(){
		// Set a property of this controller to the gem we have defined below
		// Once we have this defined we can access the data in the HTML
		this.product = gem;
	});

	var gem = {
		name: 'Dodecahedron',
		price: 2.95,
		description: '....',
	}

})();