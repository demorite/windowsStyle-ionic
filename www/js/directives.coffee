

cssSunny = () ->
	return {
		restrict: 'E'
		template: '<div icon="sunny" data-label="Soleil"><span class="sun"></span></div>'
	}

cssCloudy = () ->
	return {
		restrict: 'E'
		template: '<div icon="cloudy" data-label="Nuages"><span class="cloud"></span><span class="cloud"></span></div>'
	}

cssSnowy = () ->
	return {
		restrict: 'E'
		template: '<div icon="snowy" data-label="Neige"><span class="snowman"></span><ul><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul></div>'
	}

cssStormy = () ->
	return {
		restrict: 'E'
		template: '<div icon="stormy" data-label="Pluie"><span class="cloud"></span><ul><li></li><li></li><li></li><li></li><li></li></ul></div>'
	}

cssSupermoon = () ->
	return {
		restrict: 'E'
		template: '<div icon="supermoon" data-label="Super lune"><span class="moon"></span><span class="meteor"></span></div>'
	}



angular.module('starter.directives', [])
	.directive 'cssSunny', cssSunny
	.directive 'cssCloudy', cssCloudy
	.directive 'cssSnowy', cssSnowy
	.directive 'cssStormy', cssStormy
	.directive 'cssSupermoon', cssSupermoon