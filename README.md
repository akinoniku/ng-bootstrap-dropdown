ng-bootstrap-dropdown
=====================

bootstrap dropdown directive for angular.js

##Usage:

### html
```html
<ul dropdown data="dropdownData" label="'labelName'" children="'childrenName'" func="functionName" ></ul>
```
* **data** dropdown elements array
* **label** property name of label
* **children** property name of sub-menu array
* **func** function name for the ng-click event for elements, you can define it in controller

### example of data field and func
```javascript
dropdownData = [
    { 'labelName': 'this is label',
      'childrenName': [ // sub-menu elements
        { 'labelName': 'this is sub-menu label',
          'childrenName': []//
        },
        //..... some other children
        ]
      ]
    },
    // some other children
]
function functionName(k,v){
    console.log(k);
    console.log(v);
}
```
