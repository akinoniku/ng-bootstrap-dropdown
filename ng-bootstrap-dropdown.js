// Generated by CoffeeScript 1.6.2
(function() {
  'use strict';  angular.module('bootstrap.dropdown', []).directive('dropdown', function() {
    return {
      restrict: "AE",
      replace: true,
      template: "<ul ng-if=\"hasChildFields(data)\" class=\"dropdown-menu\" role=\"menu\" aria-labelledby=\"dropdownMenu\"> <!-- first class dropdown -->\n    <li class=\"dropdown-submenu\" ng-repeat=\"(firstKey, firstElement) in data\">\n        <a ng-click=\"func(firstKey, firstElement)\" tabindex=\"-1\"> {{ firstElement[label] | getEmptyLabel | noHTML }} </a>\n        <ul ng-if=\"hasChildFields(firstElement)\" class=\"dropdown-menu\"><!-- second class dropdown -->\n            <li ng-class=\"hasChildFields(secondElement)\" ng-click=\"func(secondKey, secondElement)\" ng-repeat=\"(secondKey, secondElement) in firstElement[children]\">\n                <a tabindex=\"-1\" href=\"\">{{ secondElement[label] | getEmptyLabel | noHTML }}</a>\n                <ul ng-if=\"hasChildFields(secondElement)\" class=\"dropdown-menu\"><!-- third class dropdown -->\n                    <li ng-class=\"hasChildFields(thirdElement)\" ng-click=\"func(thridKey, thirdElement)\" ng-repeat=\"(thirdKey, thirdElement) in secondElement[children]\">\n                        <a tabindex=\"-1\" href=\"\">{{ thirdElement[label] | getEmptyLabel | noHTML }}</a>\n                    </li>\n                </ul>\n            </li>\n        </ul>\n    </li>\n</ul>",
      scope: {
        data: '=',
        label: '=',
        children: '=',
        func: '='
      },
      link: function(scope, iElement, iAttrs) {
        console.log(scope);
        return scope.hasChildFields = function(ele) {
          var _ref;

          if ((angular.isArray(ele) && ele.length) || (ele != null ? (_ref = ele[scope.children]) != null ? _ref.length : void 0 : void 0) > 0) {
            return 'dropdown-submenu';
          } else {
            return false;
          }
        };
      }
    };
  }).filter('getEmptyLabel', [
    function() {
      return function(input) {
        if (input) {
          return input;
        } else {
          return '-- Empty label --';
        }
      };
    }
  ]).filter('noHTML', [
    function() {
      return function(input) {
        return input.replace(/<(?:.|\n)*?>/gm, '');
      };
    }
  ]);

}).call(this);

/*
//@ sourceMappingURL=ng-bootstrap-dropdown.map
*/
