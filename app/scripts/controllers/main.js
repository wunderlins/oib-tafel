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
	.factory("oibTafelAppFactoryZimmer", ['$http', function($http) {
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
                                            oibTafelAppFactoryZimmer,
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
		$scope.data = {};
		
		// keep track of asynchronous calls
		$scope.loaded = {
			patienten: false,
			zimmer: false			
		};
		
		// async data
		$scope.zimmer = [];
		$scope.patienten = [];
		
		// fetch data
		oibTafelAppFactoryZimmer.list(function(oibTafelAppFactoryZimmer) {
			$scope.zimmer = oibTafelAppFactoryZimmer.zimmer;
			$scope.loaded.zimmer = true;
			
			var last_zimmer_nr = null;
			for (var z in $scope.zimmer) {
				var zimmer = $scope.zimmer[z];
				
				if (zimmer.nr !== last_zimmer_nr) {
					last_zimmer_nr = zimmer.nr;
					var new_zimmmer = new Zimmer(zimmer.nr);
					$scope.data[zimmer.nr] = new_zimmmer;
				}
				
				for (var b in zimmer.betten) {
					var bett = new Bett(zimmer.nr, zimmer.betten[b]);
					//zimmer.betten[b];
					$scope.data[zimmer.nr].betten[zimmer.betten[b]] = bett;
					//console.log(bett);
				}
				
			}
			//console.log($scope.data);
			
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
				
				/*
				for (var e in $scope.patienten) {
					var bett = $scope.patienten[e].PD_Bett;
					var ix = $scope.betten_data.indexOf(bett, 0);
					if (ix !== -1) {
						//console.log(ix);
						$scope.betten_data[ix].patient = $scope.patienten[e]; 
					}
				}
				//console.log($scope.data);
				*/
				
				for (var e in $scope.patienten) {
					if (!$scope.patienten[e]) {
						continue;
					}
					var zimmerbett = $scope.patienten[e].PD_Bett;
					if (!zimmerbett) {
						continue;
					}
					var zb_arr = zimmerbett.split("B");
					//console.log(zb_arr);
					//console.log(zb_arr.length);
					if (zb_arr.length !== 2) {
						continue;
					}
					try {
						$scope.data[zb_arr[0]].betten[zb_arr[1]].patient = $scope.patienten[e];
					} catch (e) {
						//console.log(zb_arr);
						;
					}
					//console.log(zb_arr);
					
				}				
				
				$scope.loaded.all = 1;
				console.log($scope.data);
				return true;
			}
		}, 100, this); 

  });
