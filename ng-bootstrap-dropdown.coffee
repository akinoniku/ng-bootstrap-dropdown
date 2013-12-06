'use strict'
angular.module('bootstrap.dropdown',[])
.directive('dropdown', ->
    restrict: "AE"
    replace: true
    template: """
      <ul ng-if="hasChildFields(data)" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu"> <!-- first class dropdown -->
          <li ng-class="hasChildFields(firstElement)" ng-repeat="(firstKey, firstElement) in data">
              <a ng-click="func(firstKey, firstElement)" tabindex="-1"> {{ getLabelName(firstElement) | getEmptyLabel | noHTML }} </a>
              <ul ng-if="hasChildFields(firstElement)" class="dropdown-menu"><!-- second class dropdown -->
                  <li ng-class="hasChildFields(secondElement)" ng-click="func(secondKey, secondElement)" ng-repeat="(secondKey, secondElement) in firstElement[children]">
                      <a tabindex="-1" href="">{{ getLabelName(secondElement) | getEmptyLabel | noHTML }}</a>
                      <ul ng-if="hasChildFields(secondElement)" class="dropdown-menu"><!-- third class dropdown -->
                          <li ng-class="hasChildFields(thirdElement)" ng-click="func(thridKey, thirdElement)" ng-repeat="(thirdKey, thirdElement) in secondElement[children]">
                              <a tabindex="-1" href="">{{ getLabelName(thirdElement) | getEmptyLabel | noHTML }}</a>
                          </li>
                      </ul>
                  </li>
              </ul>
          </li>
      </ul>
      """
    scope:
      data: '='
      label: '='
      children: '='
      func: '='
    link: (scope, iElement, iAttrs) ->
      scope.hasChildFields = (ele)->
        if (angular.isArray(ele) and ele.length) or ele?[scope.children]?.length > 0 then 'dropdown-submenu' else false
      scope.getLabelName = (ele) ->
        if scope.label then ele[scope.label] else ele
  )
.filter('getEmptyLabel', [ ->
    (input)-> if input then input else  '-- Empty label --'
  ])
.filter('noHTML', [ ->
    (input)-> input.replace(/<(?:.|\n)*?>/gm, '')
  ])