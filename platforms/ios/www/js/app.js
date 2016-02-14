// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

    .state('app', {
    url: '/app',
    templateUrl: 'templates/menu.html',

  })
  .state('app.dashboard', {
    url: '/dashboard',
    views: {
      'menuContent': {
        templateUrl: 'templates/dashboard.html'
      }
    }
  })
  .state('app.volunteerForm', {
    url: '/volunteerForm',
    views: {
      'menuContent': {
        templateUrl: 'templates/volunteerForm.html'
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
        templateUrl: 'templates/myProfile.html'
      }
    }
  });
  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app');
});
