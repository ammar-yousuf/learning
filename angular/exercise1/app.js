(function(){
	var app = angular.module('gemStore', [ ]);

	app.controller('StoreController', function(){
		// Set a property of this controller to the gem we have defined below
		// Once we have this defined we can access the data in the HTML
		this.products = gems;
	});

	var gems = [
		{
			name: 'Dodecahedron',
			price: 2.95,
			description: '....',
			canPurchase: true,
			soldOut: true
		},
		{
			name: 'Pentagonal Gem',
			price: 5.95,
			description: 'This is a gem in the shape of a pentagon',
			canPurchase: true,
			soldOut: false
		}
	];

})();