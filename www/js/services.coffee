
meteoDir = ->
	{
		city: 'Bordeaux'
		data: null
	}

settings = ->
	{
		user : window.localStorage.getItem('user') || "Dylan"
	}

angular.module('starter.services', []).service 'meteoDir', meteoDir
angular.module('starter.services', []).service 'settings', settings
