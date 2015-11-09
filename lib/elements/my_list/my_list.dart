/// Porting from Polymer Starter Kit as much as possible.

@HtmlImport('my_list.html')
library my_list;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

@PolymerRegister('my-list')
class MyList extends PolymerElement {
  @Property(notify: true) List<String> items = [];

  MyList.created() : super.created();

  ready() {
    this.set('items', [
      'Responsive Web App boilerplate',
      'Iron Elements and Paper Elements',
      'End-to-end Build Tooling (including Vulcanize)',
      'Unit testing with Web Component Tester',
      'Routing with Page.js',
      'Offline support with the Platinum Service Worker Elements'
    ]);
  }
}
