// Generated by CoffeeScript 1.12.3
var meteoDir, settings;

meteoDir = function() {
  return {
    city: 'Bordeaux',
    data: null
  };
};

settings = function() {
  return {
    user: window.localStorage.getItem('user') || "Dylan"
  };
};

angular.module('starter.services', []).service('meteoDir', meteoDir);

angular.module('starter.services', []).service('settings', settings);

//# sourceMappingURL=services.js.map
