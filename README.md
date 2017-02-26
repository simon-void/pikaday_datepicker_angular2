PikadayAngular2
========

### A Dart Datepicker usable as a AngularDart2 component

* uses [PikadayDart] which wraps a lightweight js-lib ([Pikaday], less than 5kb minified and gzipped)
* one optinal dependency, if date format needs to be changed ([Moment.js], less than 25kb minified and gzipped)
* modular CSS classes for easy styling

![screenshot]

If you do find bugs or have feature requests please submit them to the [issues]
Also see the [changelog](CHANGELOG.md)


## Usage

### html

Link to the [Pikaday]-js library (with it's css file) and
the optional but highly advisable [Moment.js] library (for advanced date formating) in your index.html-file:

```html
<link rel="stylesheet" href="pikaday.css">
<script src="moment.js"></script>
<script src="pikaday.js"></script>
```

Download a local copy of those libs, put them in or under the directory your index.html file is in,
an link accordingly.

### Angular2

Check out the example under web!

Import and use **PikadayComponent** into your AngularDart2 component:

```dart
import 'package:angular2/core.dart';
import 'package:pikaday_datepicker/pikaday_angular2.dart';

@Component(
    selector: 'my-app',
    template: '''<h1>AngularDart2-datepicker</h1>
                 <pikaday [(day)]="selectedDay" format="DD-MM-YYYY"
                          minDate="2010-1-1" maxDate="2025-12-31"
                          firstDay="1">
                 </pikaday>
                 <div>selectedDay: {{selectedDay | date}}</div>''',
    directives: const [PikadayComponent]
)
class AppComponent {
  DateTime selectedDay = new DateTime(2016, 12, 14);
}
```

### Basic/Vanilla Dart Usage

If you're looking for a datepicker within a plain Dart project (no angular2),
check out [PikadayDart] package instead.

### Angular2 component - Configuration

PikadayComponent has many useful options:
- two-way data binding:
  - `day` the DateTime instance to display/update (replacing `defaultDay` from PikadayParams)
- one-way attributes
  - `cssClasses` setting css classes on input (<input class="{{cssClasses}}>)
  - `placeholder` sets the placeholder of the pikaday-inputfield
- attributes directly used to initialize PikadayParams
  - `showDayOnInit` display `defaultDay` in inputfield on startup, otherwise show no date, but use `defaultDay` when opening the picker-dialog
  - `bound` automatically show/hide the datepicker on input field focus (default `true` if `field` is set)
  - `position` preferred position of the datepicker relative to the form field, e.g.: `top right`, `bottom right` **Note:** automatic adjustment may occur to avoid datepicker from being displayed outside the viewport, see (default to 'bottom left')
  - `reposition` can be set to false to not reposition datepicker within the viewport, forcing it to take the configured `position` (default: true)
  - `format` the output format used within the input element (requires [Moment.js] for custom formatting)
  - `formatStrict` the default flag for moment's strict date parsing (requires [Moment.js] for custom formatting)
  - `firstDay` first day of the week (0: Sunday, 1: Monday, etc)
  - `minDate` the minimum/earliest date that can be selected (this should be a native Date object - e.g. `new Date()` or `moment().toDate()`)
  - `maxDate` the maximum/latest date that can be selected (this should be a native Date object - e.g. `new Date()` or `moment().toDate()`)
  - `disableWeekends` disallow selection of Saturdays or Sundays
  - `yearRange` number of years either side (e.g. `10`) or array of upper/lower range (e.g. `[1900,2015]`)
  - `showWeekNumber` show the ISO week number at the head of the row (default `false`)
  - `isRTL` reverse the calendar for right-to-left languages
  - `i18n` language defaults for month and weekday names (see internationalization example on [Pikaday])
  - `yearSuffix` additional text to append to the year in the title
  - `showMonthAfterYear` render the month after year in the title (default `false`)
  - `showDaysInNextAndPreviousMonths` render days of the calendar grid that fall in the next or previous months to the current month instead of rendering an empty table cell (default: true)
  - `numberOfMonths` number of visible calendars
  - `mainCalendarIsLeft` when `numberOfMonths` is used, this will help you to choose where the main calendar will be (default `true`/`left`, can be set to `false`/`right`). Only used for the first display or when a selected date is not already visible
  - `theme` define a classname that can be used as a hook for styling different themes (default `null`)

### Common problems

- console error msg: **constructor not a function**

The Dart-Wrapper can't access the Pikaday-JS-constructor.
You probably forgot to link to the js-lib itself in index.html:
```html
<link rel="stylesheet" href="pikaday.css">
<script src="moment.js"></script>
<script src="pikaday.js"></script>
```
* * *

## Authors

* Stephan Schröder [GitHub](https://github.com/simon-void)

Thanks to [David Bushell](https://github.com/dbushell) for writing [Pikaday].

Copyright © 2017 Stephan Schröder | BSD & MIT license

  [PikadayDart]: https://pub.dartlang.org/packages/pikaday_datepicker  
  [Pikaday]:     https://github.com/dbushell/Pikaday                              "Pikaday"
  [Moment.js]:   http://momentjs.com/                                             "moment.js"
  [screenshot]:  https://raw.github.com/dbushell/Pikaday/gh-pages/screenshot.png  "Screenshot"
  [issues]:      https://github.com/simon-void/pikaday_component_angular2/issues           "Issues"
  