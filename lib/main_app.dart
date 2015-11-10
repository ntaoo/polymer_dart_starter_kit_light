/// Porting from Polymer Starter Kit as much as possible.

@HtmlImport('main_app.html')
library main_app;

import 'dart:html';
import 'dart:math';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:polymer_elements/roboto.dart';

/// Iron elements
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/iron_pages.dart';
import 'package:polymer_elements/iron_selector.dart';

/// Paper elements
import 'package:polymer_elements/paper_drawer_panel.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_scroll_header_panel.dart';
import 'package:polymer_elements/paper_styles_classes.dart';
import 'package:polymer_elements/paper_toast.dart';
import 'package:polymer_elements/paper_toolbar.dart';

/// Seems no platinum-elements' support yet.
// Uncomment next block to enable Service Worker Support (2/2)
//<!--
//<link rel="import" href="../bower_components/platinum-sw/platinum-sw-cache.html">
//<link rel="import" href="../bower_components/platinum-sw/platinum-sw-register.html">
//-->

import 'app_router.dart';
import 'elements/my_greeting/my_greeting.dart';
import 'elements/my_list/my_list.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement with AppRouter {
  MainApp.created() : super.created();

  // Close drawer after menu item is selected if drawerPanel is narrow
  @reflectable
  void onDataRouteClick(Event event, [_]) {
    var drawerPanel = querySelector('#paperDrawerPanel');
    if (drawerPanel.narrow) {
      drawerPanel.closeDrawer();
    }
  }

  // Main area's paper-scroll-header-panel custom condensing transformation of
  // the appName in the middle-container and the bottom title in the bottom-container.
  // The appName is moved to top and shrunk on condensing. The bottom sub title
  // is shrunk to nothing on condensing.
  @Listen('paper-header-transform')
  void onPaperHeaderTransform(Event event, [detail]) {
    var appName =
        Polymer.dom(this.root).querySelector('#mainToolbar .app-name');
    var middleContainer =
        Polymer.dom(this.root).querySelector('#mainToolbar .middle-container');
    var bottomContainer =
        Polymer.dom(this.root).querySelector('#mainToolbar .bottom-container');
    num y = detail['y'];
    if (y == null) y = 0;
    num heightDiff = detail['height'] - detail['condensedHeight'];
    num yRatio = min(1, y / heightDiff);
    // appName max size when condensed. The smaller the number the smaller the condensed size.
    num maxMiddleScale = 0.50;
    num scaleMiddle = max(
        maxMiddleScale,
        (heightDiff - y) / (heightDiff / (1 - maxMiddleScale)) +
            maxMiddleScale);
    num scaleBottom = 1 - yRatio;
    // Move/translate middleContainer
    transform('translate3d(0, ${yRatio * 100}%, 0)', middleContainer);
    // Scale bottomContainer and bottom sub title to nothing and back
    transform('scale($scaleBottom) translateZ(0)', bottomContainer);
    // Scale middleContainer appName
    transform('scale($scaleMiddle) translateZ(0)', appName);
  }

  // Optional lifecycle methods - uncomment if needed.

//  /// Called when an instance of main-app is inserted into the DOM.
  attached() {
    super.attached();
  }

//  /// Called when an instance of main-app is removed from the DOM.
//  detached() {
//    super.detached();
//  }

//  /// Called when an attribute (such as a class) of an instance of
//  /// main-app is added, changed, or removed.
//  attributeChanged(String name, String oldValue, String newValue) {
//    super.attributeChanged(name, oldValue, newValue);
//  }

//  /// Called when main-app has been fully prepared (Shadow DOM created,
//  /// property observers set up, event listeners attached).
//  ready() {
//  }
}
