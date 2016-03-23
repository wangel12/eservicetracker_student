var app = angular.module('starter.controllers', []);

app.controller('AppCtrl',function($scope,$state,$sessionStorage,$ionicPopover,$ionicModal) {

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
         $scope.popover.hide();
         $scope.popover.remove();
        $state.go("login");
    }
    $scope.$on('$ionicView.beforeEnter', function(){
        // Any thing you can think of
        $scope.user_fname = $sessionStorage.user_fname;    
    });

     // .fromTemplateUrl() method
    $ionicPopover.fromTemplateUrl('my-popover.html', {
      scope: $scope
    }).then(function(popover) {
      $scope.popover = popover;
    });

    $scope.openPopover = function($event) {
      $scope.popover.show($event);
    };
    $scope.closePopover = function() {
      $scope.popover.hide();
    };

    $ionicModal.fromTemplateUrl('my-modal.html', {
      scope: $scope,
      animation: 'slide-in-up'
    }).then(function(modal) {
      $scope.modal = modal;
    });
    $scope.openModal = function() {
      $scope.modal.show();
    };
    $scope.closeModal = function() {
      $scope.modal.hide();
    };
    //Cleanup the modal when we're done with it!
    $scope.$on('$destroy', function() {
      $scope.modal.remove();
    });

    $scope.openVltrForm = function(){
        $state.go('app.volunteerForm');
        $scope.modal.hide();
    }
    $scope.openSerHtry = function(){
        $state.go('app.serviceHistory');
    }

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

.controller('singleHistoryCtrl',function($scope,$state,$localStorage,$sessionStorage,$stateParams,$ionicModal,$http,$ionicLoading){

        $scope.$on('$ionicView.beforeEnter',function(){
             //console.log($localStorage.singleHistoryData);
             $scope.messages = $localStorage.singleHistoryData;
             $scope.hideBox = false;
             $scope.successBox = true;

        })
        $ionicModal.fromTemplateUrl('templates/modal.html', {
          scope: $scope,
          animation: 'slide-in-up'
        }).then(function(modal) {
        $scope.modal = modal;
        });
        $scope.openModal = function() {
          $scope.modal.show();
        };
        $scope.closeModal = function() {
          $scope.modal.hide();
        };
        //Cleanup the modal when we're done with it!
        $scope.$on('$destroy', function() {
          $scope.modal.remove();
        });
        // Execute action on hide modal
        $scope.$on('modal.hidden', function() {
          // Execute action
        });
        // Execute action on remove modal
        $scope.$on('modal.removed', function() {
          // Execute action
        });
        $scope.deleteForm = function(){
            $scope.msgtitle = "Delete Service";
             $scope.msgbody = "Are you sure you want to delete the service for "+ $localStorage.singleHistoryData.org_name+ " ?";
            $scope.modal.show();
        }  
        $scope.deleteData = function(){
              //console.log($localStorage.singleHistoryData.ser_id);
              var link = 'http://eservicetracker.com/api/services/deleteVolunteerForm.php?ser_id='+$localStorage.singleHistoryData.ser_id+'&std_id='+$sessionStorage.user_id;
              $ionicLoading.show();
              var res = $http.post(link);
              res.success(function(data, status, headers, config) {
                  console.log(data);
                  if(data.delete == true){
                        $scope.hideBox=true;
                        $scope.successBox=false;
                        $scope.modal.hide();
                  }
                  //$scope.message = "Successfully added your work hours";
                  $ionicLoading.hide();
              });
        }
        $scope.goBack = function(){
            $state.go('app.serviceHistory');
        }

    
})

.controller('serviceHistoryCtrl',function($scope,$state,$http,$ionicLoading,authService,$localStorage,$sessionStorage){
    $scope.$on('$ionicView.beforeEnter',function(){
              //var userdata;
              //userdata.user_id = $sessionStorage.user_id;
               //var userdata;
               //userdata.user_id = $sessionStorage.user_id;
              //console.log(userdata);
              var req = $http.get('http://eservicetracker.com/api/services/getServiceList.php?id='+$sessionStorage.user_id);
              req.success(function(data,status,header,config){
                  $scope.messages = data;
                  console.log(data);
                  //$ionicLoading.hide();
              })
              req.error(function(data, status, headers, config) {
                  console.log("error in http request");
                  // handle error things
              })
    })

    $scope.getSingleHistory = function(x){
          var data = x;
          $localStorage.singleHistoryData = data;
          $state.go('app.singleHistory');
    }
})

.controller('volunteerFormCtrl',function($scope,$http,$ionicLoading,$state,$sessionStorage,$localStorage){

        $scope.$on('$ionicView.enter',function(){
              //get Advisor Names and service types
              var res = $http.post('http://eservicetracker.com/api/services/getFormData.php');
              res.success(function(data, status, headers, config) {
                  if(status == 200){
                    $scope.advData = data.advisors;
                    $scope.serviceTypeData = data.service_types;
                    //console.log(data.service_types);
                  }
              });
        })

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
                  //console.log(data);
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
    $scope.gotoDashboard = function(){
        $state.go('app.volunteerForm');
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
.controller('profileCtrl',function($scope,$state,$http,$sessionStorage,$ionicLoading,$localStorage,$ionicModal){

    // set the default value of our number
    $scope.myNumber = 0;
    $scope.disop = true;
    $scope.val = 1;
    var profileData;

     $ionicModal.fromTemplateUrl('contact-modal.html', {
        scope: $scope,
        animation: 'slide-in-down'
      }).then(function(modal) {
        $scope.modal = modal
      })  

    $scope.tabPassword = function(){
        $scope.myNumber = 1;
    }
    $scope.tabProfile = function(){
        $scope.myNumber = 0;
    }     
    // function to evaluate if a number is even
    $scope.isEven = function(value) {
      if (value % 2 == 0)
        return true;
      else 
        return false;
    };
    // function to evaluate if a number is even
    $scope.isSave = function(value) {
      if (value % 2 == 0)
        return true;
      else 
        return false;
    };

    $scope.editProfile = function(profile){
        $scope.val = 0;
        $scope.disop = false;
    }
    $scope.closeModal = function(){
        $scope.modal.hide();
    }
    $scope.saveProfile = function(profile){
        

    var profileData = profile;
    //console.log(profileData);

    var q = $http.post('http://eservicetracker.com/api/services/saveStudentInfo.php',profileData);
    q.success(function(data, status, headers, config){
           if(status == 200){
                  $scope.modal.show();
                  $scope.val = 1;
                  $scope.disop = true;
                  $scope.msgtitle="Change Profile Info";
                  $scope.msgbody="You have successfully changed your Profile Information";

          }
           else{
                //$scope.message = "username or password is invalid";
                $ionicLoading.hide();
           }         
     });

    }

    $scope.changePassword=function(data){
          var passdata = data;
          passdata.std_id = $sessionStorage.user_id;
          console.log(passdata);
          var q = $http.post('http://eservicetracker.com/api/services/savePassword.php',passdata);
          q.success(function(data, status, headers, config){
               if(status == 200){
                      console.log(data);
                      $scope.msgtitle="Password Change";
                      $scope.msgbody="You have successfully changed your password";
                      $scope.modal.show();
                      data = {};
                      //$scope.val = 1;
                      //$scope.disop = true;
              }
               else{
                    //$scope.message = "username or password is invalid";
                    $ionicLoading.hide();
               }         
         });
    }

    $scope.$on("$ionicView.beforeEnter",function(){
          $ionicLoading.show();
          $scope.profile = {};
          var std_id = $sessionStorage.user_id;
          console.log(std_id);
            var q = $http.post('http://eservicetracker.com/api/services/getStudentInfo.php',std_id);
            q.success(function(data, status, headers, config){
                   if(status == 200){
                        $localStorage.stdInfo = data;
                        $scope.profile = data;
                        console.log($scope.profile);
                        $ionicLoading.hide();
                   }
                   else{
                        //$scope.message = "username or password is invalid";
                        //$ionicLoading.hide();
                   }         
        });
    });
    $scope.$on("$ionicView.afterLeave",function(){
        $scope.modal.remove();
        console.log("modal removed");
    })
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
.controller('dashCtrl', function($scope,$http,$sessionStorage) {
    $scope.date = new Date();
    $scope.$on('$ionicView.beforeEnter',function(){
          console.log("i am in dashboard view");
          var q = $http.post('http://eservicetracker.com/api/services/getDashboardList.php?id='+$sessionStorage.user_id);
          q.success(function(data, status, headers, config){
                 if(status == 200){
                      $scope.messages = data;
                      console.log(data);
                  }
                 else{
  
                 }         
           });
    })
});
