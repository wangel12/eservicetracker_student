var app = angular.module('starter.controllers', []);

app.controller('AppCtrl',function($scope,$state,$sessionStorage) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

    // $rootScope.logout = function(){
    //     alert("hello");
    // }
    $scope.logout = function(){
        //$sessionStorage.$reset();
        //$sessionStorage.logout = true;
        $state.go("login");
    }
    $scope.$on('$ionicView.beforeEnter', function(){
        // Any thing you can think of
        $scope.user_fname = $sessionStorage.user_fname;    
    });

})

// .controller('sideMenuCtrl',function($scope,$sessionStorage,$state,userinfoService){

// })

.controller('registerCtrl',function($scope,$http,$ionicLoading,$state){
    $scope.submit = function(register){
        var res = $http.post('http://eservicetracker.com/api/services/insertRegistrationForm.php',register);
        res.success(function(data, status, headers, config) {
            console.log(data);
            if(status == 200){
                    $state.go('register.confirm');
            }
            //$scope.message = "Successfully added your work hours";
            $ionicLoading.hide();
        });
    }
})

.controller('singleHistoryCtrl',function($scope,$state,$localStorage,$stateParams){

        $scope.$on('$ionicView.beforeEnter',function(){
             //console.log($localStorage.singleHistoryData);
             $scope.messages = $localStorage.singleHistoryData;
        })
        $scope.goBack = function(){
        $state.go('app.serviceHistory');
    }
})

.controller('serviceHistoryCtrl',function($scope,$state,$http,$ionicLoading,authService,$localStorage){
    $scope.$on('$ionicView.beforeEnter',function(){
              //$ionicLoading.show({duration:1000});
              //authService.checkSession();
              //do http request
              var req = $http.get('http://eservicetracker.com/api/services/getServiceList.php');
              req.success(function(data,status,header,config){
                  $scope.messages = data;
                  //$ionicLoading.hide();
              }); 
    })

    $scope.getSingleHistory = function(x){
          var data = x;
          $localStorage.singleHistoryData = data;
          $state.go('app.singleHistory');
    }

})

.controller('volunteerFormCtrl',function($scope,$http,$ionicLoading,$state,$sessionStorage,$localStorage){

        $scope.submit = function(service){

            var tempService=service;
            var date = $scope.date;

            tempService.std_id=$sessionStorage.user_id;
            tempService.date = date;
            console.log(tempService);
            $localStorage.vltrData = tempService;
            $ionicLoading.show(); 
            var res = $http.post('http://eservicetracker.com/api/services/insertVolunteerForm.php',tempService);
            res.success(function(data, status, headers, config) {
                if(status == 200){
                  $state.go('app.volunteerForm.success');
                }
            });
            $ionicLoading.hide();
        };


        $scope.datepickerObject = {
              titleLabel: 'Title',  //Optional
              todayLabel: 'Today',  //Optional
              closeLabel: 'Close',  //Optional
              setLabel: 'Set',  //Optional
              setButtonType : 'button-assertive',  //Optional
              todayButtonType : 'button-assertive',  //Optional
              closeButtonType : 'button-assertive',  //Optional
              inputDate: new Date(),  //Optional
              mondayFirst: true,  //Optional
              disabledDates: disabledDates, //Optional
              weekDaysList: weekDaysList, //Optional
              monthList: monthList, //Optional
              templateType: 'popup', //Optional
              showTodayButton: 'true', //Optional
              modalHeaderColor: 'bar-positive', //Optional
              modalFooterColor: 'bar-positive', //Optional
              from: new Date(2012, 8, 2), //Optional
              to: new Date(2018, 8, 25),  //Optional
              callback: function (val) {  //Mandatory
                datePickerCallback(val);
              },
              dateFormat: 'dd-MM-yyyy', //Optional
              closeOnSelect: false, //Optional
        };

        var datePickerCallback = function (val) {
          if (typeof(val) === 'undefined') {
            console.log('No date selected');
          } else {
            $scope.date = val;
            console.log('Selected date is : ', val)
          }
        };
        var disabledDates = [];
        var weekDaysList = ["Sun", "Mon", "Tue", "Wed", "thu", "Fri", "Sat"];
        var monthList =  ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

})

.controller('volunteerFormSuccessCtrl',function($scope,$state){
    $scope.gotoNewForm = function(){
        $state.go('app.volunteerForm');
    }
    $scope.editForm = function(){
        $state.go('app.volunteerForm.edit');
    }
})

.controller('volunteerFormEditCtrl',function($scope,$localStorage,$sessionStorage,$ionicLoading,$http,$state){
      //var service = {};

      $scope.submit = function(service){
        
          var tempService=service;
          var date = $scope.date;

          tempService.std_id=$sessionStorage.user_id;
          tempService.date = date;
          console.log(tempService);
          $localStorage.vltrData = tempService;
          $ionicLoading.show(); 
          var res = $http.post('http://eservicetracker.com/api/services/editVolunteerForm.php?edit=new',tempService);
          res.success(function(data, status, headers, config) {
              if(status == 200){
                console.log(data);
                $state.go('app.volunteerForm.success');
              }
          });
          $ionicLoading.hide();
      };


              console.log($localStorage.vltrData);
              $scope.service = {};
              var data = $localStorage.vltrData;
              console.log(data.orgname+"--->");
              $scope.service.orgname = data.orgname;
              $scope.service.orgdesc = data.orgdesc;
              $scope.service.location = data.location;
              $scope.service.hours = data.hours;
              $scope.date = data.date;
              $scope.service.advisor = data.advisor;
              $scope.service.serviceType = data.serviceType;
              $scope.service.supervisor = data.supervisor;
              $scope.service.telephone = data.telephone;
              $scope.service.sEmail = data.sEmail;

      
      $scope.datepickerObject = {
            titleLabel: 'Title',  //Optional
            todayLabel: 'Today',  //Optional
            closeLabel: 'Close',  //Optional
            setLabel: 'Set',  //Optional
            setButtonType : 'button-assertive',  //Optional
            todayButtonType : 'button-assertive',  //Optional
            closeButtonType : 'button-assertive',  //Optional
            inputDate: new Date(),  //Optional
            mondayFirst: true,  //Optional
            disabledDates: disabledDates, //Optional
            weekDaysList: weekDaysList, //Optional
            monthList: monthList, //Optional
            templateType: 'popup', //Optional
            showTodayButton: 'true', //Optional
            modalHeaderColor: 'bar-positive', //Optional
            modalFooterColor: 'bar-positive', //Optional
            from: new Date(2012, 8, 2), //Optional
            to: new Date(2018, 8, 25),  //Optional
            callback: function (val) {  //Mandatory
              datePickerCallback(val);
            },
            dateFormat: 'dd-MM-yyyy', //Optional
            closeOnSelect: false, //Optional
      };

      var datePickerCallback = function (val) {
        if (typeof(val) === 'undefined') {
          console.log('No date selected');
        } else {
          $scope.date = val;
          console.log('Selected date is : ', val)
        }
      };
      var disabledDates = [];
      var weekDaysList = ["Sun", "Mon", "Tue", "Wed", "thu", "Fri", "Sat"];
      var monthList =  ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
})

.controller('LoginCtrl', function($scope,$http,$state,$stateParams,$ionicLoading,$sessionStorage) {
    
    $scope.login = function(loginData){
            //alert(data.username + data.password);
            //console.log($stateParams);
            $ionicLoading.show();
            var q = $http.post('http://eservicetracker.com/api/services/auth.php',loginData);
            q.success(function(data, status, headers, config){
                   if(data.status == 1){
                        $sessionStorage.user_id = data.std_id;
                        $sessionStorage.user_fname = data.std_fname;
                        $sessionStorage.status = true;
                        $state.go('app.dashboard');
                        $ionicLoading.hide();
                   }
                   else{
                        $scope.message = "username or password is invalid";
                        $ionicLoading.hide();
                   }         
             });

    }
})
.controller('dashCtrl', function($scope) {
    //$scope.username="blabla";
    //console.log(userinfoService);
});
