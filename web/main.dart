import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';

import 'package:pikaday_datepicker_angular2/pikaday_datepicker_angular2.dart';

void main() {
  bootstrap(AppComponent);
}

// example app to showcase the PikadayComponent.
@Component(
    selector: 'showcase-pikadate-component',
    template: '''<pikaday [(day)]="selectedDay" format="DD-MM-YYYY"
                          firstDay="1" minDate="2010-1-1" maxDate="2025-12-31"
                          placeholder="select a day">
                 </pikaday>
                 <div>selectedDay: {{selectedDay | date}}</div>''',
    directives: const [PikadayComponent])
class AppComponent {
  DateTime selectedDay = new DateTime(2015, 2, 1);
}