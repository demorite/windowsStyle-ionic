angular.module('starter.controllers', [])

    .controller('chatCtrl', function ($scope) {

    })

    .service('meteoDir', function () {
        return {city: "Bordeaux", data: null};
    })

    .controller('meteoCtrl', function ($scope, $http, meteoDir) {
        $scope.meteo = meteoDir;
        $scope.url = "http://api.openweathermap.org/data/2.5/weather?q=" + $scope.meteo.city + "&appid=cc5b7a00b36bc4597683407d5bcbd389";

        $scope.getMeteo = function (url) {
            $http({method: 'GET', url: url}).then(function (result) {
                console.log(result.data);
                $scope.meteo.data = result.data;
                $scope.$apply;
            });
        };

        $scope.getMeteo($scope.url);

        $scope.changeCity = function () {
            console.log($scope.meteo.city);
            $scope.url = "http://api.openweathermap.org/data/2.5/weather?q=" + $scope.meteo.city + "&appid=cc5b7a00b36bc4597683407d5bcbd389";
            $scope.getMeteo($scope.url);
        };
    })

    .controller('audioCtrl', function ($scope) {

    })

    .controller('imagesCtrl', function ($scope) {

    })

    .controller('marvelCtrl', function ($scope) {

    })

    .controller('menuCtrl', function ($scope, $interval) {
        angular.element(document).ready(function () {
            $interval(function () {

                $('.grid').masonry({itemSelector: '.grid-item'});

            }, 100)
        });

        $scope.items = [
            {id: 1, name: "Météo", url: "#/tab/menu/meteo", icon: "img/icons/meteo.png", color: "#B0A7CC"},
            {id: 2, name: "Audio", url: "#/tab/menu/audio", icon: "img/icons/headphone.png", color: "#82A08A"},
            {id: 3, name: "Marvel", url: "#/tab/menu/marvel", icon: "img/icons/marvel.png", color: "#E07560"},
            {id: 4, name: "Images", url: "#/tab/menu/images", icon: "img/icons/images.png", color: "#ffd462"},
            {id: 5, name: "Messagerie", url: "#/tab/chat", icon: "img/icons/chat.png", color: "#A8CBE2"}
        ]
    });
