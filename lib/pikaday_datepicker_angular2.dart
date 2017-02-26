import 'dart:html';

import 'package:angular2/core.dart';

import 'package:pikaday_datepicker/pikaday_wrapper.dart';

/// Angular2 component wrapper around the Pikaday-js lib. You will have to
/// link to pikaday.js (Get the latest version from it's
/// [GitHub page](https://github.com/dbushell/Pikaday) and if you want
/// a custom date format (which is highly likable) also to [moment.js](http://momentjs.com/)).
///
/// Attribute documentation adapted from the
/// [pikaday.js documentation](https://github.com/dbushell/Pikaday).
///
/// You can't set a container DOM node nore a callback, but you can listen to
/// dayChange to be informed about selected days (DateTime instances).

@Component(
    selector: 'pikaday',
    template: '<input type="text" id="{{id}}" class="{{cssClasses}}" placeholder="{{placeholder}}">')
class PikadayComponent implements AfterViewInit {
  static int _componentCounter = 0;
  final String id = "pikadayInput${++_componentCounter}";

  /// css-classes to be set on the pikaday-inputfield via <input class="{{cssClasses}}>
  @Input() String cssClasses = "";
  /// Sets the placeholder of the pikaday-inputfield.
  @Input() String placeholder;

  PikadayParams _params = new PikadayParams();
  /// Emits selected dates.
  @Output() EventEmitter<DateTime> dayChange = new EventEmitter();
  /// Forwards to [PikadayParams.day]. Look there for more info.
  @Input() void set day(DateTime day) {
    _params.defaultDay = day;
  }

  /// Forwards to [PikadayParams.showDayOnInit]. Look there for more info.
  @Input() void set showDayOnInit(dynamic showDayOnInit) {
    _params.showDayOnInit = showDayOnInit;
  }

  /// Forwards to [PikadayParams.bound]. Look there for more info.
  @Input() void set bound(bound) {
    _params.bound = bound;
  }

  /// Forwards to [PikadayParams.position]. Look there for more info.
  @Input() void set position(String position) {
    _params.position = position;
  }

  /// Forwards to [PikadayParams.reposition]. Look there for more info.
  @Input() void set reposition(reposition) {
    _params.reposition = reposition;
  }

  /// Forwards to [PikadayParams.format]. Look there for more info.
  @Input() void set format(String format) {
    _params.format = format;
  }

  /// Forwards to [PikadayParams.formatString]. Look there for more info.
  @Input() void set formatString(formatString) {
    _params.formatString = formatString;
  }

  /// Forwards to [PikadayParams.firstDay]. Look there for more info.
  @Input() void set firstDay(firstDay) {
    _params.firstDay = firstDay;
  }

  /// Forwards to [PikadayParams.minDate]. Look there for more info.
  @Input() void set minDate(minDate) {
    _params.minDate = minDate;
  }

  /// Forwards to [PikadayParams.maxDate]. Look there for more info.
  @Input() void set maxDate(maxDate) {
    _params.maxDate = maxDate;
  }

  /// Forwards to [PikadayParams.disableWeekends]. Look there for more info.
  @Input() void set disableWeekends(disableWeekends) {
    _params.disableWeekends = disableWeekends;
  }

  /// Forwards to [PikadayParams.yearRange]. Look there for more info.
  @Input() void set yearRange(yearRange) {
    _params.yearRange = yearRange;
  }

  /// Forwards to [PikadayParams.showWeekNumber]. Look there for more info.
  @Input() void set showWeekNumber(showWeekNumber) {
    _params.showWeekNumber = showWeekNumber;
  }

  /// Forwards to [PikadayParams.isRTL]. Look there for more info.
  @Input() void set isRTL(isRTL) {
    _params.isRTL = isRTL;
  }

  /// Forwards to [PikadayParams.i18n]. Look there for more info.
  @Input() void set i18n(Map<String, dynamic> i18n) {
    _params.i18n = i18n;
  }

  /// Forwards to [PikadayParams.yearSuffix]. Look there for more info.
  @Input() void set yearSuffix(String yearSuffix) {
    _params.yearSuffix = yearSuffix;
  }

  /// Forwards to [PikadayParams.showMonthAfterYear]. Look there for more info.
  @Input() void set showMonthAfterYear(showMonthAfterYear) {
    _params.showMonthAfterYear = showMonthAfterYear;
  }

  /// Forwards to [PikadayParams.showDaysInNextAndPreviousMonths]. Look there for more info.
  @Input() void set showDaysInNextAndPreviousMonths(showDaysInNextAndPreviousMonths) {
    _params.showDaysInNextAndPreviousMonths = showDaysInNextAndPreviousMonths;
  }

  /// Forwards to [PikadayParams.numberOfMonths]. Look there for more info.
  @Input() void set numberOfMonths(numberOfMonths) {
    _params.numberOfMonths = numberOfMonths;
  }

  /// Forwards to [PikadayParams.mainCalendarIsLeft]. Look there for more info.
  @Input() void set mainCalendarIsLeft(mainCalendarIsLeft) {
    _params.mainCalendarIsLeft = mainCalendarIsLeft;
  }

  /// Forwards to [PikadayParams.theme]. Look there for more info.
  @Input() void set theme(String theme) {
    _params.theme = theme;
  }

  @override
  ngAfterViewInit() {
    InputElement datepickerElem = querySelector('#$id');
    upgradeInputToDatepicker(datepickerElem, dayChange.emit, _params);
  }
}
