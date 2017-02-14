angular.module('starter.filters', [])
	.filter 'tohour', ->
		(input) ->
			date = input
			date = new Date(date * 1000).toLocaleTimeString().split(' ')[0]
	.filter 'todeg', ->
		(input) ->
			Math.round((input - 273.15)*100)/100