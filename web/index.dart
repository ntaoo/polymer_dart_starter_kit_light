library polymer_dart_starter_kit_light.web.index;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_dart_starter_kit_light/main_app.dart';

/// [MainApp] used!
main() async {
  await initPolymer();

  var app = querySelector('main-app');
  app.on['dom-change'].listen((_) {
    print('Our app is ready to rock!');
  });
}
