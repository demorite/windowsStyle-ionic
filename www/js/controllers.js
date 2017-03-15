// Generated by CoffeeScript 1.12.3
var chatCtrl, imagesCtrl, menuCtrl, meteoCtrl, settingsCtrl;

menuCtrl = function($scope, $interval) {
  angular.element(document).ready(function() {
    $interval((function() {
      $('.grid').masonry({
        itemSelector: '.grid-item'
      });
    }), 100);
  });
  $scope.items = [
    {
      id: 1,
      name: 'Météo',
      url: '#/tab/menu/meteo',
      icon: 'img/icons/meteo.png',
      color: '#B0A7CC'
    }, {
      id: 2,
      name: 'Audio',
      url: '#/tab/menu/audio',
      icon: 'img/icons/headphone.png',
      color: '#82A08A'
    }, {
      id: 3,
      name: 'Marvel',
      url: '#/tab/menu/marvel',
      icon: 'img/icons/marvel.png',
      color: '#E07560'
    }, {
      id: 4,
      name: 'Images',
      url: '#/tab/menu/images',
      icon: 'img/icons/images.png',
      color: '#ffd462'
    }, {
      id: 5,
      name: 'Messagerie',
      url: '#/tab/chat',
      icon: 'img/icons/chat.png',
      color: '#A8CBE2'
    }
  ];
};

meteoCtrl = function($scope, $http, $meteodir) {
  $scope.meteo = $meteodir;
  $scope.url = 'http://api.openweathermap.org/data/2.5/weather?q=' + $scope.meteo.city + '&appid=cc5b7a00b36bc4597683407d5bcbd389';
  $scope.mainStates = {
    'Cloud': "img/mainStates/Cloud.png",
    'Sun': "img/mainStates/Sun.png",
    'Rain': "img/mainStates/Rain.png",
    'Snow': "img/mainStates/Snow.png"
  };
  $scope.getMeteo = function(url) {
    $http({
      method: 'GET',
      url: url
    }).then(function(result) {
      $scope.meteo.data = result.data;
      $scope.$apply;
    });
  };
  $scope.getMeteo($scope.url);
  $scope.changeCity = function() {
    $scope.url = 'http://api.openweathermap.org/data/2.5/weather?q=' + $scope.meteo.city + '&appid=cc5b7a00b36bc4597683407d5bcbd389';
    $scope.getMeteo($scope.url);
  };
};

imagesCtrl = function($scope, $http) {
  $scope.imagesGalery = ['img/gallery/1.jpg', 'img/gallery/2.png', 'img/gallery/3.jpg', 'img/gallery/4.jpg', 'img/gallery/5.jpg', 'img/gallery/6.jpg'];
  $scope.showImage = function(url) {
    var elem, full;
    full = $('.fullscreenImage');
    elem = $('.otherImages');
    full.css({
      'background-image': 'url(' + url + ')'
    });
    elem.fadeOut();
    return full.fadeIn();
  };
  $scope.hideImage = function() {
    var elem, full;
    full = $('.fullscreenImage');
    elem = $('.otherImages');
    elem.fadeIn();
    return full.fadeOut();
  };
};

chatCtrl = function($scope, $http, settings) {
  var allmessages, container;
  container = $('.chat-thread');
  $scope.message = '';
  $scope.user = settings.user;
  $scope.messages = [];
  allmessages = function() {
    $http.get("http://localhost/www/windowsStyleApi/public/messages/").then(function(result) {
      var data, i, len, ref, ref1, results;
      if (result.data[result.data.length - 1].date !== ((ref = $scope.messages[9]) != null ? ref.date : void 0)) {
        $scope.messages = [];
        ref1 = result.data;
        results = [];
        for (i = 0, len = ref1.length; i < len; i++) {
          data = ref1[i];
          results.push($scope.messages.push({
            message: data.message,
            user: data.user,
            date: data.date
          }));
        }
        return results;
      }
    });
  };
  setInterval(allmessages, 500);
  return $scope.addMessage = function(message) {
    var data;
    if ((message != null) && message !== '') {
      data = {
        user: $scope.user,
        message: message
      };
      $http.post("http://localhost/www/windowsStyleApi/public/messages/", data, {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
        }
      }).then(function(result) {
        $scope.messages.push({
          message: message,
          user: $scope.user,
          date: new Date()
        });
        $scope.message = "";
        $('.chat-window-message').val('');
        $('.chat-window-message').text('');
        $('.chat-window-message').html('');
      });
    }
  };
};

settingsCtrl = function($scope, $window, settings) {
  $scope.user = settings.user;
  $scope.changeUser = function(user) {
    settings.user = user;
    $window.localStorage.setItem('user', settings.user);
  };
};

angular.module('starter.controllers', []).controller('menuCtrl', menuCtrl).controller('meteoCtrl', meteoCtrl).controller('chatCtrl', chatCtrl).controller('audioCtrl', function($scope) {}).controller('imagesCtrl', imagesCtrl).controller('settingsCtrl', settingsCtrl).controller('marvelCtrl', function($scope) {});

//# sourceMappingURL=controllers.js.map
