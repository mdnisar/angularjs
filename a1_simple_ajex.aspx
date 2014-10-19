<%@ Page Language="C#" AutoEventWireup="true" CodeFile="a1_simple_ajex.aspx.cs" Inherits="my_ng_practice_2_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="angular.js"></script>
</head>

<body ng-app="myapp">

  <div ng-controller="MyController" >
    <button ng-click="myData.doClick(item, $event)">Send AJAX Request</button>
    <br/>
    Data from server: {{myData.fromServer}}
  </div>

  <script>
      angular.module("myapp", [])
          .controller("MyController", function ($scope, $http) {
              $scope.myData = {};
              $scope.myData.doClick = function (item, event) {

                  $http.post('a1_simple_ajex.aspx/GetEmployees', { data: {} })
                    .success(function (data, status, headers, config) {
                        $scope.myData.fromServer = data.d;
                    })
                    .error(function (data, status, headers, config) {
                        $scope.status = status;
                    });

              }


          }).config(function ($httpProvider) {
              $httpProvider.defaults.headers.post = {};
              $httpProvider.defaults.headers.post["Content-Type"] = "application/json; charset=utf-8";

          });
  </script>

</body>

</html>
</html>
