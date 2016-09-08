(function(){
	angular.module('hub', [])
	.factory('Category', ['$resource', function($resource){
		var defaultHeaders = {'Accept': 'application/json'};

			return $resource('/categories/:id', {id: '@id'},{
				'all': { method: 'GET', headers: defaultHeaders }
			});

	}]);
})();	