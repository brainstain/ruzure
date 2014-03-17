/**
 * Created with IntelliJ IDEA.
 * User: michael
 * Date: 3/15/14
 * Time: 11:58 AM
 * To change this template use File | Settings | File Templates.
 */
'use strict'
var app = angular.module('app', ['ngRoute']);

app.config(['$routeProvider', function($routeProvider){
    $routeProvider.when('/',{
        templateUrl: '../assets/mainIndex.html',
        controller: 'IndexController'
    });
}]);