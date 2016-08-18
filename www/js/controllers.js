var app = angular.module('starter.controllers', []);

app.controller('AppCtrl',function($scope,$state,$sessionStorage,$ionicPopover,$ionicModal,$rootScope) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

    // $rootScope.logout = function(){
    //     alert("hello");
    // }
    $rootScope.logout = function(){
        //$sessionStorage.$reset();
        //$sessionStorage.logout = true;
         //$scope.popover.hide();
         //alert("hello");
         //$scope.popover.remove();
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
      //$scope.modal.remove();
    });

    $scope.openVltrForm = function(){
        $state.go('app.volunteerForm');
        $scope.modal.hide();
    }
    $scope.openSerHtry = function(){
        $state.go('app.serviceHistory');
    }

    $scope.openNotifications = function(){
        $state.go('app.notification');
    }

})

.controller('notificationCtrl', function($scope,$http,$state,$stateParams,$ionicLoading,$sessionStorage,$localStorage) {
    $scope.$on('$ionicView.enter',function(){
            $ionicLoading.show();
            var res = $http.post('http://eservicetracker.com/api/services/getNotificationMessages.php');
                res.success(function(data, status, headers, config) {
                    if(status == 200){
                        if(data.noti){
                            $scope.dataIsBlank = false;
                            $scope.messages = data;
                            $ionicLoading.hide(); 
                        }else{
                          $scope.dataIsBlank = true;
                            $ionicLoading.hide();
                        }
                    }else{
                      //error notification to the UI.
                    }
            }); 
    })
    $scope.goToSingleNotifiction = function(x){
        $localStorage.notificationData = x;
        $state.go("app.singleNotification");
    }
})

.controller('singleNotificationCtrl', function($scope,$http,$state,$stateParams,$ionicLoading,$sessionStorage,$localStorage) {
   $scope.messages = $localStorage.notificationData;
})

//Register Controller
.controller('registerCtrl',function($scope,$http,$ionicLoading,$state,md5){

    $scope.$on('$ionicView.enter',function(){
          var req = $http.get('http://eservicetracker.com/api/services/getPatternSettings.php');
          req.success(function(data,status,header,config){
              console.log(data);
              $scope.pattern='[A-Za-z0-9\_\.]+\@+prep-villa+\.+com';
              //$scope.pattern='[A-Za-z0-9\_\.]+\@+'+data.email+'+\.+com';
              //$activityIndicator.stopAnimating();
          })
    })
    var push = new Ionic.Push({
      "debug": true
    });
    var mytoken;
    push.register(function(token) {

      mytoken = token.token
      console.log("Device token----:",mytoken);
      // var res = $http.post('http://eservicetracker.com/api/services/saveToken.php',token.token);
      //   res.success(function(data, status, headers, config) {
      //       //console.log(data);
      //       if(status == 200){
      //             console.log(data);t
      //       }
      // });
      push.saveToken(token);  // persist the token in the Ionic Platform
    });

    //REGISTRATION
    $scope.submit = function(register){
            $ionicLoading.show();
            var email = register.email;
            var password = md5.createHash(register.password);
            register.enEmail = email;
            register.enPass = password;
            register.token = mytoken;
            var res = $http.post('http://eservicetracker.com/api/services/insertRegistrationForm.php',register);
            res.success(function(data, status, headers, config) {
                console.log(data);
                if(status == 200){
                      $ionicLoading.hide();
                       if(data.status == "taken"){
                          alert("The email has already been registered.");
                        }
                        else{
                            alert("Registration Successful. Please login with your email and password.");
                            $state.go('login');
                        } 
                }
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
          //$scope.modal.remove();
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
              $ionicLoading.show();
              var link = 'http://eservicetracker.com/api/services/deleteVolunteerForm.php?ser_id='+$localStorage.singleHistoryData.ser_id+'&std_id='+$sessionStorage.user_id;
              var res = $http.post(link);
              res.success(function(data, status, headers, config) {
                  //console.log(data);
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
        $scope.editHistory = function(msg){
            //s$localStorage.messages = msg;
            $state.go("app.editHistory");
        }
    
})

.controller('serviceHistoryCtrl',function($scope,$state,$http,$ionicLoading,authService,$localStorage,$sessionStorage){
    $scope.$on('$ionicView.beforeEnter',function(){
              //var userdata;
              //userdata.user_id = $sessionStorage.user_id;
               //var userdata;
               //userdata.user_id = $sessionStorage.user_id;
              //console.log(userdata);
              $ionicLoading.show();
              var req = $http.get('http://eservicetracker.com/api/services/getServiceList.php?id='+$sessionStorage.user_id);
              req.success(function(data,status,header,config){
                  $scope.messages = data;
                  console.log(data);
                  $ionicLoading.hide();
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

.controller('volunteerFormCtrl',function($scope,$http,$ionicLoading,$state,$sessionStorage,$localStorage, $ionicModal){

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
              $ionicModal.fromTemplateUrl('contact-modal.html', {
                scope: $scope,
                animation: 'slide-in-down'
              }).then(function(modal) {
                $scope.modal = modal
              })  
        })

        $scope.submit = function(service){
            var tempService=service;
            var date = $scope.date;
            tempService.std_id=$sessionStorage.user_id;
            //tempService.date = date;
            console.log(tempService);
            $localStorage.vltrData = tempService;
            $ionicLoading.show(); 
            var res = $http.post('http://eservicetracker.com/api/services/insertVolunteerForm.php',tempService);
            res.success(function(data, status, headers, config) {
                if(status == 200){
                  //console.log(data);
                  $scope.modal.show();
                  $scope.msgtitle="Submit Volunteer Service";
                  $scope.msgbody="You have successfully submitted your volunter service form.";
                  //$state.go('app.serviceHistory');
                }
            });
            $ionicLoading.hide();
        };
        $scope.goBack = function(){
            $scope.modal.hide();
            $state.go('app.serviceHistory');
        }

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
.controller('volunteerFormEditCtrl',function($scope,$localStorage,$sessionStorage,$ionicLoading,$http,$state,$ionicModal){
      $scope.service = {};

      $ionicModal.fromTemplateUrl('contact-modal.html', {
          scope: $scope,
          animation: 'slide-in-down'
      }).then(function(modal) {
          $scope.modal = modal;
      })  

      $scope.$on('$ionicView.enter',function(){
              $ionicLoading.show();
              var data = $localStorage.singleHistoryData;
              var res = $http.post('http://eservicetracker.com/api/services/getSingleServiceList.php',data.ser_id);
                  res.success(function(data, status, headers, config) {
                      if(status == 200){
                          //$scope.service_info = data.service_info.services;
                          //console.log(data.st_info.st);
                          //make changes in the view
                          $scope.service.orgname = data.service_info.services[0].org_name;
                          $scope.service.orgdesc = data.service_info.services[0].org_desc;
                          $scope.service.hours = parseInt(data.service_info.services[0].ser_hr);
                          $scope.service.date = data.service_info.services[0].ser_date;
                          //console.log(data.service_info.services[0].ser_date);
                          $scope.service.location = data.service_info.services[0].org_address;
                          $scope.advList = data.advisor_info.advisor;
                          $scope.stList= data.st_info.st;
                          $scope.service.supervisor = data.supervisor_info.supervisor[0].sup_fname;
                          $scope.service.telephone = data.supervisor_info.supervisor[0].sup_phone;
                          $scope.service.sEmail = data.supervisor_info.supervisor[0].sup_email;

                          //select advisor from dropdown list
                          for(var i=0;i<data.advisor_info.advisor.length;i++){
                              if(data.service_info.services[0].adv_id == data.advisor_info.advisor[i].adv_id){
                                  $scope.service.advisor = data.advisor_info.advisor[i];
                              }
                          }
                          for(var i=0;i<data.st_info.st.length;i++){
                              if(data.service_info.services[0].serty_id == data.st_info.st[i].serty_id){
                                  //console.log($localStorage.data.advisors[i]["adv_fname"]);
                                  $scope.service.serviceType = data.st_info.st[i];
                              }
                          }
                          $ionicLoading.hide();
                  }
            });
      })

      $scope.submit = function(service){
          $scope.modal.show();
          var data = $localStorage.singleHistoryData;
          var tempService=service;
          //console.log(tempService);
          tempService.advisor=service.advisor.adv_id;
          tempService.serviceType=service.serviceType.serty_id;
          tempService.ser_id = data.ser_id;
          //console.log(tempService.date);
          //console.log(service.date);
          //tempService.date = $scope.date;
          console.log(tempService.date);

          tempService.std_id=$sessionStorage.user_id;
          console.log(tempService);
          var res = $http.post('http://eservicetracker.com/api/services/editVolunteerForm.php?edit=new',tempService);
          res.success(function(data, status, headers, config) {
              if(status == 200){
                //alert("success".data);
                $scope.msgtitle = "Update Successful!";
                $scope.msgbody = "You have successfully update service for "+service.orgname;
                $scope.modalShown = true;
                //console.log(data);
                //$state.go('est.serviceHistory');
              }
          });
      };

      $scope.gotoServiceHistory = function(){
          $state.go("app.serviceHistory");
      }

      $scope.goBack = function(){
          $state.go("app.serviceHistory");
          $scope.modal.hide();
      }
      
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
.controller('profileCtrl',function($scope,$state,$http,$sessionStorage,$ionicLoading,$localStorage,$ionicModal,md5){

    // set the default value of our number
    $scope.myNumber = 0;
    $scope.disop = true;
    $scope.val = 1;

    $scope.pactive="white";
    $scope.cactive="black";
    var profileData;

     $ionicModal.fromTemplateUrl('contact-modal.html', {
        scope: $scope,
        animation: 'slide-in-down'
      }).then(function(modal) {
        $scope.modal = modal
      })  

    $scope.tabPassword = function(){
        $scope.myNumber = 1;
        $scope.pactive = "black";
        $scope.cactive = "white";
    }
    $scope.tabProfile = function(){
        $scope.myNumber = 0;
        $scope.cactive = "black";
        $scope.pactive = "white";
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
      //console.log(value);
      if (value % 2 == 0)
        return true;
      else 
        return false;
    };

    $scope.editProfile = function(profile){
        $scope.val = 0;
        $scope.disop = false;
    }

    $scope.cancelProfile = function(){
        $scope.val = 1;
        $scope.disop = true;
    }
    $scope.goBack = function(){
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


    //**------------------------
    //ON CHANGE PASSWORD CLICKED
    //**------------------------
    $scope.changePassword=function(data){
          //save everything in passdata.
          var passdata = data;
          passdata.std_id = $sessionStorage.user_id;
          passdata.new = md5.createHash(passdata.new);
          //REST Call
          var promise = $http.post('http://eservicetracker.com/api/services/savePassword.php',passdata);
          promise.success(function(data, status, headers, config){
              if(status == 200){
                      $scope.msgtitle="Password Change";
                      $scope.msgbody="You have successfully changed your password";
                      $scope.modal.show();
                      passdata.new = null;
                      passdata.renew = null;
              }
              else{
                  $ionicLoading.hide();
              }         
         });
    }

    $scope.$on("$ionicView.beforeEnter",function(){
          $ionicLoading.show();
          $scope.profile = {};
          var std_id = $sessionStorage.user_id;
          //console.log(std_id);
            var q = $http.post('http://eservicetracker.com/api/services/getStudentInfo.php',std_id);
            q.success(function(data, status, headers, config){
                   if(status == 200){
                        $localStorage.stdInfo = data;
                        $scope.profile = data;
                        $ionicLoading.hide();
                   }
                   else{
                        //$scope.message = "username or password is invalid";
                        //$ionicLoading.hide();
                   }         
        });
    });
    $scope.$on("$ionicView.afterLeave",function(){
        //$scope.modal.remove();
        console.log("modal removed");
    })
})



//**------------------------
//LOGIN CONTROLLER----------
//**------------------------
.controller('LoginCtrl', function($scope,$http,$state,$stateParams,$ionicLoading,$sessionStorage,md5,$localStorage) {
    
    $scope.login = function(login){
            var loginInfo = [];
            var email = login.user;
            var pass = md5.createHash(login.pass);
            loginInfo["email"] = email;
            loginInfo["pass"] = pass;

            var q = $http.post('http://eservicetracker.com/api/services/auth.php',{email:email, pass:pass});          
            q.success(function(data, status, headers, config){
                   if(data.status == 1){
                        $scope.status = status;
                        console.log('status:'+status);
                        $sessionStorage.user_id = data.std_id;
                        $sessionStorage.user_fname = data.std_fname;
                        $sessionStorage.status = true;
                        $state.go('app.dashboard');
                        $ionicLoding.hide();
                   }
                   else{
                    //console.log(data);
                    if(data.status==402){
                      $ionicLoading.hide();
                      $scope.message = "username or password is invalid";
                    }else if(data.status==403){
                      $ionicLoading.hide();
                      $scope.message="Account Inactive"
                      alert("Your account is currently Inactive. Please contact your advisor for further information");
                    }
                    
                }         
             });

    }

 
})
//**------------------------**//
//DASHBOARD CONTROLLER--------//
//**------------------------**//
.controller('dashCtrl', function($scope,$http,$sessionStorage,$localStorage) {
    $scope.date = new Date();
    $scope.$on('$ionicView.beforeEnter',function(){
            // var promise = $http({
            //     method: 'GET',
            //     url: 'http://eservicetracker.com/api/services/test.php',
            //     headers: {
            //         //'Content-Type':'Application/JSON'
            //         'Authorization': 'Bearer ' + $localStorage.JWT
            //         //or
            //         //'Authorization': 'Basic ' + 'token'
            //     }
            // }).then(function successCallback(response) {
            //     console.log(response.data);
            //     //$localStorage.JWT = response.data.jwt;
            //     //$state.go('app.dashboard');
            // }, function errorCallback(response) {
            //     if(response.status = 401){ // If you have set 401
            //         console.log("ohohoh")
            //     }
            // });
          var q = $http.post('http://eservicetracker.com/api/services/getDashboardList.php?id='+$sessionStorage.user_id);
          q.success(function(data, status, headers, config){
                  if(status == 200){
                      if(!data.data){
                          $scope.dataIsBlank = true;
                      }else{
                        $scope.dataIsBlank = false;
                        $scope.messages = data;
                      }
                      $scope.total_hr = data.Hours.total_hours_done;
                      $scope.min_hr = data.Hours.est_hour;
                      //console.log(data);
                  }
                 else{
              
                 }         
           });
    })
});
