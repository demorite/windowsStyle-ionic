menuCtrl = ($scope, $interval) ->
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
			name : 'Movie'
			url  : '#/tab/menu/movie'
			icon : 'img/icons/movie.png'
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

meteoCtrl = ($scope, $http, $meteodir) ->
	$scope.meteo = $meteodir
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

	$scope.showImage = (url)->
		full = $('.fullscreenImage')
		full.css('background-image': 'url('+url+')')
		full.fadeIn()

	$scope.hideImage = ()->
		full = $('.fullscreenImage')
		full.fadeOut()
	return

chatCtrl = ($scope, $http, settings)->
	container = $('.chat-thread')
	$scope.message = ''
	$scope.user = settings.user
	$scope.messages = []
	allmessages = ->
		$http.get("http://localhost/www/windowsStyleApi/public/messages/").then((result)->
			if result.data[result.data.length - 1].date != $scope.messages[9]?.date
				$scope.messages = []
				for data in result.data
					$scope.messages.push({
						message : data.message,
						user : data.user
						date : data.date
					})

		)

		return
	setInterval(allmessages, 500);

	$scope.addMessage = (message)->
		if message? and message != ''
			data = {
				user: $scope.user
				message: message
			}


			$http.post(
				"http://localhost/www/windowsStyleApi/public/messages/", data,
				{
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
					}
				}
			).then((result)->
				$scope.messages.push({
					message: message,
					user: $scope.user,
					date: new Date()
				})

#				SCROLL
#				$('.chat-thread').animate({'scrollTop' : 4000}, 2000)
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

movieCtrl =  ($scope,$window, settings, $http) ->
    baseurl = "https://api.themoviedb.org/3/"
    apikey = "api_key=2605db3bb9a62669d5158c263210dea4"

    $scope.getMovies = (type = 'top_rated') ->
        console.log 'me'
        $http.get baseurl+'movie/'+type+'/?'+apikey, (result) ->
            console.log result

        return

    $scope.getMovie = () ->
        return

angular.module('starter.controllers', [])
	.controller 'menuCtrl', menuCtrl
	.controller 'meteoCtrl', meteoCtrl
	.controller 'chatCtrl', chatCtrl
	.controller 'audioCtrl', ($scope) -> return
	.controller 'imagesCtrl', imagesCtrl
	.controller 'settingsCtrl', settingsCtrl
	.controller 'movieCtrl', movieCtrl
