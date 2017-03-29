db = null

angular.module('starter', [
	'ionic'
	'starter.controllers'
	'starter.services'
	'starter.filters'
	'starter.directives'
]).run(($ionicPlatform) ->

	$ionicPlatform.ready ->
		if window.cordova and window.cordova.plugins and window.cordova.plugins.Keyboard
			cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
			cordova.plugins.Keyboard.disableScroll true
		if window.StatusBar
			StatusBar.styleDefault()

		return
	return


).config ($stateProvider, $urlRouterProvider, $ionicConfigProvider) ->
	$ionicConfigProvider.tabs.position 'bottom'
	$stateProvider
		.state('tab',
			url: '/tab'
			abstract: true
			templateUrl: 'templates/tabs.html')
		.state('tab.chat',
			url: '/chat'
			views:
				'tab-chat':
					templateUrl: 'templates/tab-chat.html'
					controller: 'chatCtrl')
		.state('tab.menu',
			url: '/menu'
			views:
				'tab-menu':
					templateUrl: 'templates/tab-menu.html'
					controller: 'menuCtrl')
		.state('tab.meteo',
			url: '/menu/meteo'
			views:
				'tab-menu':
					templateUrl: 'templates/tab-menu-meteo.html'
					controller: 'meteoCtrl')
		.state('tab.movie',
			url: '/menu/movie'
			views:
				'tab-menu':
					templateUrl: 'templates/tab-menu-movie.html'
					controller: 'movieCtrl')
		.state('tab.images',
			url: '/menu/images'
			views:
				'tab-menu':
					templateUrl: 'templates/tab-menu-images.html'
					controller: 'imagesCtrl')
		.state('tab.audio',
			url: '/menu/audio'
			views:
				'tab-menu':
					templateUrl: 'templates/tab-menu-audio.html'
					controller: 'audioCtrl')
		.state('tab.settings',
			url: '/settings'
			views:
				'tab-settings':
					templateUrl: 'templates/tab-settings.html'
					controller: 'settingsCtrl')
	$urlRouterProvider.otherwise '/tab/menu'

	return