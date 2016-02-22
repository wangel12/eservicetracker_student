angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  // Create the login modal that we will use later
  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope
  }).then(function(modal) {
    $scope.modal = modal;
  });

  // Triggered in the login modal to close it
  $scope.closeLogin = function() {
    $scope.modal.hide();
  };

  // Open the login modal
  $scope.login = function() {
    $scope.modal.show();
  };

  // Perform the login action when the user submits the login form
  $scope.doLogin = function() {
    console.log('Doing login', $scope.loginData);

    // Simulate a login delay. Remove this and replace with your login
    // code if using a login system
    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})

.controller('registerCtrl',function($scope,$http,$ionicLoading,$state){
    $scope.submit = function(register){
        var res = $http.post('http://eservicetracker.com/api/services/insertRegistrationForm.php',registera);
        res.success(function(data, status, headers, config) {
            console.log(data);
            console.log(status);
            //$scope.message = "Successfully added your work hours";
            $ionicLoading.hide();
        });
    }
})

.controller('serviceHistoryCtrl',function($scope,$ionicActionSheet,$http){
    $scope.onHold = function(){
           // Show the action sheet
           var hideSheet = $ionicActionSheet.show({
             buttons: [
               { text: 'View More' },
               { text: 'Message Advisor'},
               { text: 'Edit Hours'}
             ],
             destructiveText: 'Delete',
             titleText: 'Select Action',
             cancelText: 'Cancel',
             cancel: function() {
                  // add cancel code..
                },
             buttonClicked: function(index) {
               return true;
             }
           });
    }

    //do http request
    var req = $http.get('http://eservicetracker.com/api/services/getServiceList.php');
    req.success(function(data,status,header,config){
        console.log(data);
    });

})
.controller('volunteerFormCtrl',function($scope,$http,$ionicLoading,$state){

         $scope.datepickerObject = {
              titleLabel: 'Service Date',  //Optional
              todayLabel: 'Today',  //Optional
              closeLabel: 'Close',  //Optional
              setLabel: 'Set',  //Optional
              setButtonType : 'button-assertive',  //Optional
              todayButtonType : 'button-assertive',  //Optional
              closeButtonType : 'button-assertive',  //Optional
              inputDate: new Date(),  //Optional
              mondayFirst: true,  //Optional
              //disabledDates: disabledDates, //Optional
              //weekDaysList: weekDaysList, //Optional
              //monthList: monthList, //Optional
              templateType: 'popup', //Optional
              showTodayButton: 'false', //Optional
              modalHeaderColor: 'bar-positive', //Optional
              modalFooterColor: 'bar-positive', //Optional
              from: new Date(2012, 8, 2), //Optional
              to: new Date(2016, 8, 25),  //Optional

              callback: function (val) {  //Mandatory
                datePickerCallback(val);
              },

              dateFormat: 'dd-MM-yyyy', //Optional
              closeOnSelect: true, //Optional
        };

        var datePickerCallback = function (val) {
          if (typeof(val) === 'undefined') {
            console.log('No date selected');
          } else {
            console.log('Selected date is : ', val);
            $scope.service = {date:val};          
          }
        };
        var dateformat = 'MM';

        $scope.submit = function(service){
            $scope.service={};
            $ionicLoading.show();
            //$state.go('^.volunteerForm.success');

            console.log(this.service);

            //HTTP SERVICE - REST API
            var res = $http.post('http://eservicetracker.com/api/services/insertVolunteerForm.php',this.service);
            res.success(function(data, status, headers, config) {
              console.log(data);
            });
            $ionicLoading.hide();
        };
        //
        // 
        // var data = {email:sn};
        // //console.log($scope.organizaton);
        // var res = $http.post('http://eservicetracker.com/api/services/volunteerPost.php',data);
        // res.success(function(data, status, headers, config) {
        //     console.log(sn);
        //     console.log(data);
        //     //$scope.message = "Successfully added your work hours";
        //     $ionicLoading.hide();
        // });
});
