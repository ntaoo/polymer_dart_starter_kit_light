/// Original Polymer Starter Kit Light uses [page.js]. For Dart, here I use
/// route_hierarchical package.
/// And define AppRouter as Polymer Behavior and mix into the MainApp.

library app_router;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:route_hierarchical/client.dart';
import 'package:your_app/main_app.dart';

@behavior
abstract class AppRouter {
  @property String route = '';
  @reflectable setRoute(String route) => set('route', route);

  @property Map params = {};
  @reflectable setParams(Map params) => set('params', params);

  static created(instance) {
    var router = new Router();
    router.root
      ..addRoute(
          name: 'users',
          path: '/users',
          enter: (RouteEvent e) => handleRoute(e, instance))
      ..addRoute(
          name: 'user-info',
          path: '/users/:name',
          enter: (RouteEvent e) => handleRoute(e, instance))
      ..addRoute(
          name: 'contact',
          path: '/contact',
          enter: (RouteEvent e) => handleRoute(e, instance))
      ..addRoute(
          name: 'home',
          defaultRoute: true,
          path: '/',
          enter: (RouteEvent e) => handleRoute(e, instance));
    router.listen();
  }

  // Generic function on route enter.
  static void handleRoute(RouteEvent e, MainApp instance) {
    instance
      ..scrollPageToTop()
      ..closeDrawer()
      ..setParams(e.parameters)
      ..setRoute(e.route.name);
  }
}
