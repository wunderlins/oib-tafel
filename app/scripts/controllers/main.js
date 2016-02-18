'use strict';

angular.module('oibTafelApp')
	.factory("oibTafelAppFactory", function() {
	var factory = {};
	var patienten = [
		{name: "Simone", location: "Basel"},
		{name: "Andreas", location: "Lupsingen"},
		{name: "Sämi", location: "Basel"}
	];
	
	factory.getPatienten = function() {
		return patienten;
	};
	
	return factory;
});


/**
 * @ngdoc function
 * @name oibTafelApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the oibTafelApp
 */
angular.module('oibTafelApp')
  .controller('MainCtrl', function ($scope, oibTafelAppFactory) {
    this.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
    
    
    // pull data from:
    // - PEP
    // - mdsi
    // - tafelDB (a table currently stored in mdsi)
    $scope.patienten = oibTafelAppFactory.getPatienten();
    console.log($scope.patienten);
    
  });
