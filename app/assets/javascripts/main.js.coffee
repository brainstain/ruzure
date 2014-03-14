# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./services
#= require_tree ./controllers

Brain = angular.module('Brain', ['ngRoute']);

Brain.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/',{
    templateUrl: '../assets/mainIndex.html',
    controller: 'IndexCtrl'
  })
])