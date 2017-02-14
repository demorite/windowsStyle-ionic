// Generated by CoffeeScript 1.12.2
var chatCtrl, imagesCtrl, menuCtrl, meteoCtrl;

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

meteoCtrl = function($scope, $http, meteoDir) {
  $scope.meteo = meteoDir;
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
};

chatCtrl = function($scope, $http) {
  var container, messages;
  container = $('.chat-thread');
  $scope.message = "";
  $scope.messages = [];
  messages = function() {
    return $http.get("php/_db.class.php?function=getMessages").then(function(result) {
      var data, i, len, ref, results;
      ref = result.data;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        data = ref[i];
        results.push($scope.messages.push(data.message));
      }
      return results;
    });
  };
  messages();
  return $scope.addMessage = function(message) {
    return $http.get("php/_db.class.php?function=addMessage&message=" + message).then(function() {
      return $scope.messages.push(message);
    });
  };
};

angular.module('starter.controllers', []).controller('menuCtrl', menuCtrl).controller('meteoCtrl', meteoCtrl).controller('chatCtrl', chatCtrl).controller('audioCtrl', function($scope) {}).controller('imagesCtrl', imagesCtrl).controller('marvelCtrl', function($scope) {});

//# sourceMappingURL=controllers.js.map
