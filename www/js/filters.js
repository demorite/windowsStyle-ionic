angular.module('starter.filters', [])
    .filter('tohour', function () {
        return function (input) {
            return  new Date(input).toTimeString().split(' ')[0];
        }
    })

    .filter('todeg', function () {
        return function (input) {
            return input - 273.15;
        }
    });
