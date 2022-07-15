import 'package:provider/provider.dart';

import '../screens/home_screen.dart';

import 'route_utils.dart';
import 'package:flutter/material.dart';

class PageManager extends ChangeNotifier {
  static PageManager of(BuildContext context) {
    return Provider.of<PageManager>(context, listen: false);
  }

  List<Page> get pages => List.unmodifiable(_pages);
  List<Page> _pages = [];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PageManager() {
    _pages = [
      MaterialPage(
        child: const HomeScreen(),
        key: ValueKey(RoutePath.home.name),
        name: RoutePath.home.location,
      ),
    ];
  }

  RoutePath get currentPath => RouteUtils.parseUri(_pages.last.name);

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  Future<void> setNewRoutePath(RoutePath path) async {
    final newPage = RouteUtils.updatePages(path);
    if (newPage == null) {
      _pages.removeWhere(
        (element) => element.key != Key(RoutePath.home.name),
      );
    } else {
      _pages.add(newPage);
    }
    notifyListeners();
    return;
  }

  void resetToHome() {
    setNewRoutePath(RoutePath.home);
  }

  void addUnknownPage() {
    setNewRoutePath(RoutePath.unknown);
  }
}
