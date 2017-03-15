
meteodir = ->
	return {
		city: 'Bordeaux'
		data: null
	}

settings = ->
	return {
		user : window.localStorage.getItem('user') || "Dylan"
	}

angular.module('starter.services', [])
	.factory '$meteodir', meteodir
	.factory 'settings', settings
