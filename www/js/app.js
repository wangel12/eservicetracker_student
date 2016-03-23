// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['starter.controllers','ngStorage','ngMessages','ionic-datepicker'])

.run(function($ionicPlatform,$sessionStorage,$http) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    //cordova.plugins.Keyboard.disableScroll(true)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
    $sessionStorage.status = false;

 });


})
.factory('authService',function($http,$sessionStorage,$state){
    var authFactory = {};
    authFactory.checkSession = function(){
        console.log($sessionStorage.status);
        if ($sessionStorage.status != true){
            //console.log("access denied");
            $state.go('login');
        }
    }
    return authFactory;
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

  .state('app', {
    url: '/app',
    abstract:true,
    templateUrl: 'templates/menu.html',
    controller:'AppCtrl'
  })
  .state('login',{
    url:'/login',
    cache:false,
    templateUrl:'templates/login.html',
    controller:'LoginCtrl'
  })
  .state('app.dashboard', {
    url: '/dashboard',
    cache:false,
    views: {
      'menuContent': {
        templateUrl: 'templates/dashboard.html',
        controller:'dashCtrl'
      }
    }
  })
  .state('register', {
    url: '/register',
    templateUrl: 'templates/register.html',
    controller:'registerCtrl'
  })
  .state('register.confirm',{
    url:'/:confirm',
    views:{
        'registerView':{
            templateUrl:'templates/registerSuccess.html'
        }
    }
  })

  .state('app.volunteerForm', {
    url: '/volunteerForm',
    views: {
      'menuContent': {
        templateUrl: 'templates/volunteerForm.html',
        controller:'volunteerFormCtrl'
      }
    }
  })
  .state('app.volunteerForm.success', {
    url: '/success',
    views: {
      'successView': {
        templateUrl: 'templates/formSuccess.html',
        controller:'volunteerFormSuccessCtrl'
      }
    }
  })
    .state('app.volunteerForm.edit', {
    url: '/edit',
    views: {
      'successView': {
        templateUrl: 'templates/editForm.html',
        controller:'volunteerFormEditCtrl'
      }
    }
  })
  .state('app.serviceHistory', {
      url: '/serviceHistory',
      views: {
        'menuContent': {
          templateUrl: 'templates/serviceHistory.html',
          controller:'serviceHistoryCtrl'
        }
      }
    })
   // .state('app.serviceHistory.singleHistory', {
   //    url: '/singleHistory',
   //    views: {
   //      'serviceView': {
   //        templateUrl: 'templates/singleHistory.html',
   //        controller:'singleHistoryCtrl'
        
   //      }
   //    }
   //  })
    .state('app.singleHistory', {
      url: '/singleHistory',
      views: {
        'menuContent': {
          templateUrl: 'templates/serviceHistoryContent.html',
          controller:'singleHistoryCtrl'
        
        }
      }
    })
    .state('app.notification', {
      url: '/notification',
      views: {
        'menuContent': {
          templateUrl: 'templates/notifications.html'
        }
      }
    })

  .state('app.messages', {
    url: '/messages',
    views: {
      'menuContent': {
        templateUrl: 'templates/messages.html'
      }
    }
  })
   .state('app.myProfile', {
    url: '/myProfile',
    views: {
      'menuContent': {
        templateUrl: 'templates/myProfile.html',
        controller:'profileCtrl'
      }
    }
  });
  // if none of the above states are matched, use this as the fallback
  //$urlRouterProvider.when("/first",{ controller: "profileCtrl",templateUrl:"tpl.html"});
  $urlRouterProvider.otherwise('/login');

});
