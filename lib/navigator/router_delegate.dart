import 'package:provider/provider.dart';

import 'page_manager.dart';
import 'package:flutter/material.dart';
import 'route_utils.dart';

class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  AppRouterDelegate() {
    pageManager.addListener(notifyListeners);
  }
  final PageManager pageManager = PageManager();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageManager>.value(
      value: pageManager,
      child: Consumer<PageManager>(
        builder: (context, pageManager, child) {
          return Navigator(
            key: navigatorKey,
            onPopPage: _onPopPage,
            pages: List.of(pageManager.pages),
          );
        },
      ),
    );
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }

    pageManager.didPop(route.settings as Page<dynamic>);
    return true;
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => pageManager.navigatorKey;

  @override
  RoutePath get currentConfiguration => pageManager.currentPath;

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    await pageManager.setNewRoutePath(configuration);
  }
}
