menuCtrl = ($scope, $interval) ->

# Activation de JQuery Masonry
	angular.element(document).ready ->
		$interval (->
			$('.grid').masonry itemSelector: '.grid-item'
			return
		), 100
		return

	# Tuiles de la page menu
	$scope.items = [
		{
			id   : 1
			name : 'Météo'
			url  : '#/tab/menu/meteo'
			icon : 'img/icons/meteo.png'
			color: '#B0A7CC'
		}
		{
			id   : 2
			name : 'Audio'
			url  : '#/tab/menu/audio'
			icon : 'img/icons/headphone.png'
			color: '#82A08A'
		}
		{
			id   : 3
			name : 'Marvel'
			url  : '#/tab/menu/marvel'
			icon : 'img/icons/marvel.png'
			color: '#E07560'
		}
		{
			id   : 4
			name : 'Images'
			url  : '#/tab/menu/images'
			icon : 'img/icons/images.png'
			color: '#ffd462'
		}
		{
			id   : 5
			name : 'Messagerie'
			url  : '#/tab/chat'
			icon : 'img/icons/chat.png'
			color: '#A8CBE2'
		}
	]
	return

meteoCtrl = ($scope, $http, meteoDir) ->
	$scope.meteo = meteoDir
	$scope.url = 'http://api.openweathermap.org/data/2.5/weather?q=' + $scope.meteo.city + '&appid=cc5b7a00b36bc4597683407d5bcbd389'

	$scope.mainStates =
		'Cloud': "img/mainStates/Cloud.png"
		'Sun'  : "img/mainStates/Sun.png"
		'Rain' : "img/mainStates/Rain.png"
		'Snow' : "img/mainStates/Snow.png"

	# Récupérer la météo
	$scope.getMeteo = (url) ->
		$http(
			method: 'GET'
			url   : url
		).then (result) ->
			$scope.meteo.data = result.data
			$scope.$apply
			return
		return

	$scope.getMeteo $scope.url

	# Modifier la ville
	$scope.changeCity = ->
		$scope.url = 'http://api.openweathermap.org/data/2.5/weather?q=' + $scope.meteo.city + '&appid=cc5b7a00b36bc4597683407d5bcbd389'
		$scope.getMeteo $scope.url
		return

	return

imagesCtrl = ($scope, $http) ->
	$scope.imagesGalery = [
		'img/gallery/1.jpg'
		'img/gallery/2.png'
		'img/gallery/3.jpg'
		'img/gallery/4.jpg'
		'img/gallery/5.jpg'
		'img/gallery/6.jpg'
	]
	return

chatCtrl = ($scope, $http, settings)->
	container = $('.chat-thread')
	$scope.message = ''
	$scope.user = settings.user
	$scope.messages = []
	allmessages = ->
		$http.get("http://localhost:8600/messages/").then((result)->
			if result.data[result.data.length - 1].date != $scope.messages[9]?.date
				$scope.messages = []
				for data in result.data
					$scope.messages.push({
						message : data.message,
						user : data.user
						date : data.date
					})
#				container.append('<li>' + data.message + '</li>')
		)
		return
	setInterval(allmessages, 500);

	$scope.addMessage = (message)->
		if message? and message != ''
			###
    $http.get("php/_db.class.php?function=addMessage&message=" + message + '&user=' + $scope.user).then(->
				$scope.messages.push({
					message: message,
					user: $scope.user
				})

				$scope.message = "";
				$('.chat-window-message').val('')
				$('.chat-window-message').text('')
				$('.chat-window-message').html('')
				return
			)
###
			data = {
				user: $scope.user
				message: message
			}


			$http.post(
				"http://localhost:8600/messages/", data,
				{
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}
			).then((result)->
				console.log result.data
				$scope.messages.push({
					message: message,
					user: $scope.user,
					date: new Date()
				})

				$scope.message = "";
				$('.chat-window-message').val('')
				$('.chat-window-message').text('')
				$('.chat-window-message').html('')
				return
			)
		return

settingsCtrl = ($scope,$window, settings)->
	$scope.user = settings.user
	$scope.changeUser = (user)->
		settings.user = user
		$window.localStorage.setItem('user', settings.user)
		return

	return
angular.module('starter.controllers', [])
	.controller 'menuCtrl', menuCtrl
	.controller 'meteoCtrl', meteoCtrl
	.controller 'chatCtrl', chatCtrl
	.controller 'audioCtrl', ($scope) -> return
	.controller 'imagesCtrl', imagesCtrl
	.controller 'settingsCtrl', settingsCtrl
	.controller 'marvelCtrl', ($scope) -> return
