'use strict'
angular.module('bootstrap.dropdown', [])
.directive('dropdown',  ['$compile', ($compile)->
    restrict: "AE"
    replace: true
    scope:
      att: '='
      data: '='
      label: '='
      children: '='
      click: '='
    link: (scope, iElement, iAttrs) ->
      scope.hasChildFields = (ele)->
        if (angular.isArray(ele) and ele.length) or ele?[scope.children]?.length > 0 then 'dropdown-submenu' else false
      scope.getLabelName = (ele) ->
        if scope.label then ele[scope.label] else ele

      template = """
      <ul ng-if="hasChildFields(data)" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu"> <!-- first class dropdown -->
          <li ng-class="hasChildFields(firstElement)" ng-repeat="(firstKey, firstElement) in data">
              <a class='intter-link' ng-click="click(firstKey, firstElement, att)" tabindex="-1"> {{ getLabelName(firstElement) | getEmptyLabel | noHTML }} </a>
      """
      if scope.hasChildFields(scope.data)
        template += """ <ul data-dropdown data-data="firstElement[children]" data-att="att" data-label="label" data-children="children" data-click="click" ></ul> """

      template += "</li></ul>"

      newElement = angular.element(template);
      $compile(newElement)(scope);
      iElement.replaceWith(newElement);
  ])
.filter('getEmptyLabel', [ ->
    (input)-> if input then input else  '-- Empty label --'
  ])
.filter('noHTML', [ ->
    (input)-> input.replace(/<(?:.|\n)*?>/gm, '')
  ])
