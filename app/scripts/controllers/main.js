'use strict';

angular.module('oibTafelApp')
	.factory("oibTafelAppFactory", ['$http', function($http) {
	return {
		list: function(callback){
			$http.get('data/patienten.json').success(callback);
		}
	};
}]);

angular.module('oibTafelApp')
	.factory("oibTafelAppFactoryBetten", ['$http', function($http) {
	return {
		list: function(callback){
			$http.get('data/betten.json').success(callback);
		}
	};
}]);


/**
 * @ngdoc function
 * @name oibTafelApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the oibTafelApp
 */
angular.module('oibTafelApp')
  .controller('MainCtrl', function ($scope, oibTafelAppFactory, oibTafelAppFactoryBetten) {
    this.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
    
    
    // pull data from:
    // - PEP
    // - mdsi
    // - tafelDB (a table currently stored in mdsi)
    //$scope.patienten = oibTafelAppFactory.getPatienten();
    //console.log($scope.patienten);

		oibTafelAppFactory.list(function(oibTafelAppFactory) {
			$scope.patienten = oibTafelAppFactory;
		});
		
		
		oibTafelAppFactoryBetten.list(function(oibTafelAppFactoryBetten) {
			$scope.zimmer = oibTafelAppFactoryBetten.zimmer;
		});
		 
		
  });
