(function(){
	angular.module('hub', []).controller('articlesController',['$scope', 'Article'], function(){
		alert("Hello")
		$scope.categories = Category.all
		alert($scope.categories)
	});

})();	