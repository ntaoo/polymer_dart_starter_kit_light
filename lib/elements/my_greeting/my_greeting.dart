/// Porting from Polymer Starter Kit as much as possible.

@HtmlImport('my_greeting.html')
library my_greeting;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

@PolymerRegister('my-greeting')
class MyGreeting extends PolymerElement {
  @Property(notify: true) String greeting = 'Welcome!';

  MyGreeting.created() : super.created();
}
