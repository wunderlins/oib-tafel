'use strict';

/*
angular.module('oibTafelApp')
	.factory("oibTafelAppFactory", ['$http', function($http) {
	return {
		list: function(callback){
			$http.get('data/patienten.json').success(callback);
		}
	};
}]);
*/

angular.module('oibTafelApp')
	.factory("oibTafelAppFactoryBetten", ['$http', function($http) {
	return {
		list: function(callback){
			$http.get('data/betten.json').success(callback);
		}
	};
}]);

angular.module('oibTafelApp')
	.factory("oibTafelAppFactoryPatienten", ['$http', function($http) {
	return {
		list: function(callback){
			$http.get('data/patienten.json').success(callback);
		}
	};
}]);

/**
 * OIB Bett object
 *
 * contains room nuber, patient and nurse data
 */
function Bett(zimmer, bett) {
	this.id      = zimmer + "B" + bett;
	this.zimmer  = zimmer;
	this.bett    = bett;
	this.patient = null;
	this.nurse   = null;
	return this;
}

function Zimmer(nr) {
	this.nr = nr;
	this.betten = [];
}


/**
 * @ngdoc function
 * @name oibTafelApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the oibTafelApp
 */
angular.module('oibTafelApp')
  .controller('MainCtrl', function ($scope, $timeout,
                                            oibTafelAppFactoryBetten,
                                            oibTafelAppFactoryPatienten) {
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
		
		// hold all rooms with all patients
		$scope.data = [];
		
		// holds final data structure for the template
		$scope.betten_data = [];
		
		// a list of beds in the form of <room#>B<bed#>
		$scope.betten = [];
		$scope.zimmer = [];
		
		// keep track of asynchronous calls
		$scope.loaded = {
			patienten: false,
			zimmer: false			
		};
		
		// fetch data
		oibTafelAppFactoryBetten.list(function(oibTafelAppFactoryBetten) {
			$scope.zimmerData = oibTafelAppFactoryBetten.zimmer;
			$scope.loaded.zimmer = true;
			
			for (var z in $scope.zimmerData) {
				for (var b in $scope.zimmerData[z].betten) {
					if ($scope.zimmer.indexOf($scope.data[$scope.zimmerData[z].nr]) !== -1) {
						$scope.zimmer.push($scope.data[$scope.zimmerData[z].nr]);
					}
					$scope.betten.push($scope.zimmerData[z].nr+"B"+$scope.zimmerData[z].betten[b]);
					var bett = new Bett($scope.zimmerData[z].nr, $scope.zimmerData[z].betten[b]);
					//$scope.zimmer.betten[b] = bett;
					//$scope.data.push(bett);
				}
			}
			console.log($scope.zimmer);
		});
		 
		oibTafelAppFactoryPatienten.list(function(oibTafelAppFactoryPatienten) {
			$scope.patienten = oibTafelAppFactoryPatienten.patienten;
			//console.log(oibTafelAppFactoryPatienten.patienten)
			$scope.loaded.patienten = true;
		});
		
		// glue beds and patients together, the key is patienten[n].PD_Bett
		$timeout(function () {
			if ($scope.loaded.patienten && $scope.loaded.zimmer) {
				//console.log($scope.loaded.patienten);
				
				for (var e in $scope.patienten) {
					var bett = $scope.patienten[e].PD_Bett;
					var ix = $scope.betten_data.indexOf(bett, 0);
					if (ix !== -1) {
						//console.log(ix);
						$scope.betten_data[ix].patient = $scope.patienten[e]; 
					}
				}
				//console.log($scope.data);
				$scope.loaded.all = 1;
				return true;
			}
		}, 100, this); 

  });
